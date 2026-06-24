#ifndef __DIFFERENTIAL_DWA_H
#define __DIFFERENTIAL_DWA_H

#include <ros/ros.h>
#include <tf/tf.h>
#include <tf/transform_listener.h>
#include <geometry_msgs/Twist.h>
#include <geometry_msgs/PoseStamped.h>
#include <sensor_msgs/LaserScan.h>
#include <nav_msgs/Odometry.h>
#include <nav_msgs/OccupancyGrid.h>
#include <nav_msgs/Path.h>
#include <visualization_msgs/Marker.h>
#include <visualization_msgs/MarkerArray.h>
#include <Eigen/Dense>
#include <vector>
#include <cmath>

#include "vel_transform/vel_transform.h"
#include "path_follow/pid_follow.h"
#include "robot_communication/localizationInfoBroadcast.h"
#include "robot_communication/chassisControl.h"
#include "robot_communication/goal.h"

using namespace std;
using namespace Eigen;

class Differential_DWAPlanner
{
public:
  Differential_DWAPlanner(void);

  class State
  {
  public:
    State(double, double, double, double, double);
    double x, y, yaw, velocity, yawrate;
  };

  class Window
  {
  public:
    Window(void);
    Window(const double, const double, const double, const double);
    double min_velocity, max_velocity, min_yawrate, max_yawrate;
  };

  // 主循环
  void process(void);

  // 回调
  void scan_callback(const sensor_msgs::LaserScanConstPtr &msg);
  void local_goal_callback(const robot_communication::goalConstPtr &msg);
  void pathCallback(const nav_msgs::PathConstPtr &path);
  void local_map_callback(const nav_msgs::OccupancyGridConstPtr &msg);
  void target_velocity_callback(const geometry_msgs::TwistConstPtr &global);
  void odom_callback(const nav_msgs::OdometryConstPtr &msg);

  // DWA 核心函数
  Window calc_dynamic_window(const geometry_msgs::Twist &cur_velocity);
  float calc_to_goal_cost(const std::vector<State> &traj, const Eigen::Vector3d &goal);
  float calc_speed_cost(const std::vector<State> &traj, const float target_velocity);
  float calc_obstacle_cost(std::vector<State> &traj, const std::vector<std::pair<double,double>> &scan_points);
  void motion(State &state, const double velocity, const double yawrate);
  std::vector<State> dwa_planning(Window dynamic_window, Eigen::Vector3d goal,
                                  const std::vector<std::pair<double,double>> &scan_points,
                                  double target_velocity);

  // 可视化
  void visualize_trajectory(const std::vector<State> &trajectory, const double r, const double g, const double b, const ros::Publisher &pub);
  void visual_VisitedNode(ros::Publisher pathPublish, std::vector<Eigen::Vector2d> visitnodes,
                          float a_set, float r_set, float g_set, float b_set, float length);

  ros::Publisher chassCtlPub;

protected:
  // ----- 参数 -----
  double HZ;
  std::string ROBOT_FRAME;
  double TARGET_VELOCITY;
  double MAX_VELOCITY, MIN_VELOCITY;
  double MAX_YAWRATE;
  double MAX_ACCELERATION, MAX_D_YAWRATE;
  double MAX_DIST;
  double VELOCITY_RESOLUTION, YAWRATE_RESOLUTION;
  double ANGLE_RESOLUTION;
  double PREDICT_TIME;
  double TO_GOAL_COST_GAIN, SPEED_COST_GAIN, OBSTACLE_COST_GAIN;
  double DT;
  double GOAL_THRESHOLD, TURN_DIRECTION_THRESHOLD;
  double TEMP_GOAL_RADIUS;
  double ROBOT_RADIUS, SAFETY_MARGIN;
  double LOOKAHEAD_DIST;

  // ----- 状态 -----
  Vector3d nowposition;
  Vector3d localposition;
  geometry_msgs::Twist current_velocity;
  bool odom_updated, local_goal_subscribed, local_map_updated, scan_updated;
  bool update_path;
  int path_nodes_num, last_path_nodes_num;
  int current_path_index_;
  bool final_reached_;
  Vector2d final_goal_;
  double goal_yaw_;

  // ----- 路径存储 -----
  vector<Vector2d> trajpath;
  vector<pair<int,Vector2d>> visitPath;   // 保留兼容

  // ----- 激光点云 -----
  std::vector<std::pair<double,double>> scan_points_;
  double laser_max_range_;

  // ----- TF 与 地图 -----
  tf::TransformListener listener;
  nav_msgs::OccupancyGrid local_map;
  double map_origin_x_, map_origin_y_;

  // ----- ROS 句柄和发布/订阅 -----
  ros::NodeHandle nh, local_nh;
  ros::Publisher candidate_trajectories_pub, selected_trajectory_pub;
  ros::Publisher localPathPub, localgoalPub;
  ros::Subscriber local_map_sub, scan_sub, local_goal_sub, odom_sub, target_velocity_sub, pathSub;

  // 用于 local_goal_callback 存储消息（实际未使用，仅为编译）
  robot_communication::goal local_goal;

  // ----- 辅助函数 -----
  double calPointLength(const Vector2d &a, const Vector2d &b);
  double clearance_at(double x, double y);
  void update_path_index(double rx, double ry);
  void compute_lookahead_target(double rx, double ry, double &gx, double &gy, double &g_yaw);
  void LIMIT_VECTOR_Velocity(double &velocity, double &yawrate);

  // 保留未使用的函数声明以避免链接错误（但实际不会再调用）
  std::vector<std::vector<float>> raycast();
  void GetRobotVelocity(Vector3d, Vector3d, Vector3d&);
  void Deal_Super_Circle(double*, double*);
  double calVectorAngle(Vector2d, Vector2d);
  Vector2d calUnitvector(Vector2d);
  Vector2d caLocalGoalPosition(vector<Vector2d>, Vector2d, double);
  pid_follow pidFollow;
  double anglePID[7];
};

#endif