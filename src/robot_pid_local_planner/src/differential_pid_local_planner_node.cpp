#include <ros/ros.h>
#include <geometry_msgs/Twist.h>
#include <geometry_msgs/PoseStamped.h>
#include <nav_msgs/Path.h>
#include <nav_msgs/Odometry.h>
#include <visualization_msgs/Marker.h>
#include <tf/tf.h>
#include <cmath>
#include <algorithm>

static inline double wrap_to_pi(double a)
{
  while (a > M_PI) a -= 2.0 * M_PI;
  while (a < -M_PI) a += 2.0 * M_PI;
  return a;
}

static inline double clamp(double x, double lo, double hi)
{
  return std::max(lo, std::min(hi, x));
}

struct PID
{
  double kp{0}, ki{0}, kd{0};
  double i{0}, prev_e{0};
  double i_limit{1.0};

  double step(double e, double dt)
  {
    if (dt <= 1e-6) return kp * e;
    i += e * dt;
    i = clamp(i, -i_limit, i_limit);
    const double de = (e - prev_e) / dt;
    prev_e = e;
    return kp * e + ki * i + kd * de;
  }

  void reset()
  {
    i = 0;
    prev_e = 0;
  }
};

class DifferentialPIDLocalPlanner
{
public:
  DifferentialPIDLocalPlanner() : nh_(), pnh_("~")
  {
    nh_.param("LOOKAHEAD_DIST", lookahead_dist_, 0.5);
    nh_.param("GOAL_TOL", goal_tol_, 0.25);
    nh_.param("MAX_VX", max_vx_, 0.4);
    nh_.param("MAX_WZ", max_wz_, 0.8);
    nh_.param("KP_X", pid_x_.kp, 0.9);
    nh_.param("KD_X", pid_x_.kd, 0.0);
    nh_.param("KP_YAW", pid_yaw_.kp, 1.2);
    nh_.param("KD_YAW", pid_yaw_.kd, 0.0);
    nh_.param("I_LIMIT_X", pid_x_.i_limit, 0.6);
    nh_.param("I_LIMIT_YAW", pid_yaw_.i_limit, 1.0);
    nh_.param("CMD_TIMEOUT", cmd_timeout_, 0.5);
    nh_.param("PUB_HZ", pub_hz_, 30.0);
    nh_.param("FILTER_ALPHA", filter_alpha_, 0.3);
    nh_.param("LATERAL_GAIN", lateral_gain_, 0.5);
    nh_.param("LATERAL_I_GAIN", lateral_i_gain_, 0.1);
    nh_.param("LATERAL_I_LIMIT", lateral_i_limit_, 1.0);

    path_sub_ = nh_.subscribe("/opt_path", 1, &DifferentialPIDLocalPlanner::pathCb, this);
    odom_sub_ = nh_.subscribe("/odom", 1, &DifferentialPIDLocalPlanner::odomCb, this);
    goal_sub_ = nh_.subscribe("/move_base_simple/goal", 1, &DifferentialPIDLocalPlanner::goalCb, this);

    cmd_pub_ = nh_.advertise<geometry_msgs::Twist>("/cmd_vel", 1);
    local_path_pub_ = nh_.advertise<nav_msgs::Path>("/local_path", 1, true);
    marker_pub_ = nh_.advertise<visualization_msgs::Marker>("/local_goal", 1, true);

    last_cmd_time_ = ros::Time(0);
    timer_ = nh_.createTimer(ros::Duration(1.0 / std::max(1.0, pub_hz_)),
                             &DifferentialPIDLocalPlanner::onTimer, this);

    ROS_INFO("[DifferentialPIDLocalPlanner] started. lookahead=%.2f, max_vx=%.2f, max_wz=%.2f",
             lookahead_dist_, max_vx_, max_wz_);
  }

private:
  void pathCb(const nav_msgs::PathConstPtr& msg)
{
  path_ = *msg;
  has_path_ = !path_.poses.empty();
  lateral_i_ = 0.0;  // 重置积分
}

  void goalCb(const geometry_msgs::PoseStampedConstPtr& msg)
  {
    goal_ = *msg;
    has_goal_ = true;
  }

  void odomCb(const nav_msgs::OdometryConstPtr& msg)
  {
    x_ = msg->pose.pose.position.x;
    y_ = msg->pose.pose.position.y;
    yaw_ = tf::getYaw(msg->pose.pose.orientation);
    has_odom_ = true;
  }

  bool computeLookaheadPoint(double& gx, double& gy, double& g_yaw_target)
  {
    if (!has_path_ || path_.poses.empty()) return false;

    int nearest = 0;
    double best_d2 = 1e100;
    for (size_t i = 0; i < path_.poses.size(); ++i)
    {
      double dx = path_.poses[i].pose.position.x - x_;
      double dy = path_.poses[i].pose.position.y - y_;
      double d2 = dx*dx + dy*dy;
      if (d2 < best_d2) { best_d2 = d2; nearest = i; }
    }

    double acc = 0.0;
    int idx = nearest;
    for (size_t i = nearest; i+1 < path_.poses.size(); ++i)
    {
      double x0 = path_.poses[i].pose.position.x;
      double y0 = path_.poses[i].pose.position.y;
      double x1 = path_.poses[i+1].pose.position.x;
      double y1 = path_.poses[i+1].pose.position.y;
      double seg = std::hypot(x1-x0, y1-y0);
      acc += seg;
      if (acc >= lookahead_dist_) { idx = i+1; break; }
      idx = i+1;
    }

    gx = path_.poses[idx].pose.position.x;
    gy = path_.poses[idx].pose.position.y;
    g_yaw_target = std::atan2(gy - y_, gx - x_);

    // 发布局部路径和marker
    nav_msgs::Path local;
    local.header = path_.header;
    for (int i = nearest; i <= idx; ++i)
      local.poses.push_back(path_.poses[i]);
    local_path_pub_.publish(local);

    visualization_msgs::Marker mk;
    mk.header = path_.header;
    mk.ns = "pid_local_goal";
    mk.id = 1;
    mk.type = visualization_msgs::Marker::SPHERE;
    mk.action = visualization_msgs::Marker::ADD;
    mk.pose.position.x = gx;
    mk.pose.position.y = gy;
    mk.pose.position.z = 0.1;
    mk.pose.orientation.w = 1.0;
    mk.scale.x = mk.scale.y = mk.scale.z = 0.18;
    mk.color.a = 1.0; mk.color.r = 1.0; mk.color.g = 0.8; mk.color.b = 0.0;
    marker_pub_.publish(mk);

    const auto& last = path_.poses.back().pose.position;
    double dist_goal = std::hypot(last.x - x_, last.y - y_);
    return (dist_goal > goal_tol_);
  }

  void publishZero()
  {
    geometry_msgs::Twist z;
    cmd_pub_.publish(z);
  }

  void onTimer(const ros::TimerEvent& ev)
  {
    if (!has_odom_)
    {
      publishZero();
      return;
    }

    double gx, gy, yaw_target;
    if (!computeLookaheadPoint(gx, gy, yaw_target))
    {
      pid_x_.reset();
      pid_yaw_.reset();
      publishZero();
      return;
    }

    double dt = (last_cmd_time_.isZero()) ? (1.0 / std::max(1.0, pub_hz_))
                                          : (ros::Time::now() - last_cmd_time_).toSec();
    last_cmd_time_ = ros::Time::now();

    double dx = gx - x_;
    double dy = gy - y_;
    double cy = std::cos(yaw_);
    double sy = std::sin(yaw_);
    double ex =  cy*dx + sy*dy;   // 前向误差
    double ey = -sy*dx + cy*dy;   // 侧向误差
    double e_yaw = wrap_to_pi(yaw_target - yaw_);

    // 前向速度 PID
    double vx = pid_x_.step(ex, dt);
    // 角速度 = 角度误差 PID + 侧向误差比例控制
    double wz_angle = pid_yaw_.step(e_yaw, dt);
    double wz_lateral = lateral_gain_ * ey;

    // 侧向误差积分
    lateral_i_ += ey * dt;
    lateral_i_ = clamp(lateral_i_, -lateral_i_limit_, lateral_i_limit_);
    wz_lateral += lateral_i_gain_ * lateral_i_;
    double wz = wz_angle + wz_lateral;

    // 低通滤波平滑指令
    cmd_vx_filtered_ = filter_alpha_ * vx + (1.0 - filter_alpha_) * cmd_vx_filtered_;
    cmd_wz_filtered_ = filter_alpha_ * wz + (1.0 - filter_alpha_) * cmd_wz_filtered_;
    vx = cmd_vx_filtered_;
    wz = cmd_wz_filtered_;

    // 限幅
    vx = clamp(vx, -max_vx_, max_vx_);
    wz = clamp(wz, -max_wz_, max_wz_);

    geometry_msgs::Twist cmd;
    cmd.linear.x = vx;
    cmd.angular.z = wz;
    cmd_pub_.publish(cmd);
  }

private:
  ros::NodeHandle nh_, pnh_;
  ros::Subscriber path_sub_, goal_sub_, odom_sub_;
  ros::Publisher cmd_pub_, local_path_pub_, marker_pub_;
  ros::Timer timer_;
  ros::Time last_cmd_time_;

  nav_msgs::Path path_;
  geometry_msgs::PoseStamped goal_;
  bool has_path_{false}, has_goal_{false}, has_odom_{false};
  bool diff_drive_{true};

  double lookahead_dist_{0.6}, goal_tol_{0.25};
  double max_vx_{0.4}, max_wz_{0.8};
  double cmd_timeout_{0.5}, pub_hz_{30.0};

  double lateral_i_{0.0};
  double lateral_i_limit_{1.0};
  double lateral_i_gain_{0.0};  // 新增参数

  double x_{0}, y_{0}, yaw_{0};
  PID pid_x_, pid_yaw_;

  double cmd_vx_filtered_{0.0}, cmd_wz_filtered_{0.0};
  double filter_alpha_{0.3};
  double lateral_gain_{0.5};
};

int main(int argc, char** argv)
{
  ros::init(argc, argv, "differential_pid_local_planner");
  DifferentialPIDLocalPlanner node;
  ros::spin();
  return 0;
}