#ifndef __DIFFERENTIAL_DWA_H
#define __DIFFERENTIAL_DWA_H

#include <ros/ros.h>
#include <tf/tf.h>
#include <geometry_msgs/Twist.h>
#include <geometry_msgs/PoseStamped.h>
#include <sensor_msgs/LaserScan.h>
#include <nav_msgs/Odometry.h>
#include <nav_msgs/OccupancyGrid.h>
#include <nav_msgs/Path.h>
#include <visualization_msgs/Marker.h>
#include <visualization_msgs/MarkerArray.h>
#include <tf/tf.h>
#include <tf/transform_listener.h>
#include "tf2/convert.h"
#include <tf2/utils.h>

#include <Eigen/Dense>

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
    double x; 
    double y;
    double yaw; 
    double velocity; 
    double yawrate; 
  };

  class Window
  {
  public:
    Window(void);
    Window(const double, const double,const double, const double);
    double min_velocity;
    double max_velocity;
    double min_yawrate;
    double max_yawrate;
  };

  void process(void);
  void local_planner(void);
  void scan_callback(const sensor_msgs::LaserScanConstPtr &msg);
  void local_goal_callback(const robot_communication::goalConstPtr &msg);
  void pathCallback(const nav_msgs::PathConstPtr &path);
  void local_map_callback(const nav_msgs::OccupancyGridConstPtr &msg);
  void target_velocity_callback(const geometry_msgs::TwistConstPtr &global);
  void odom_callback(const nav_msgs::OdometryConstPtr &msg);
  Window calc_dynamic_window(const geometry_msgs::Twist &cur_velocity);
  float calc_to_goal_cost(const std::vector<State> &traj, const Eigen::Vector3d &goal);
  float calc_speed_cost(const std::vector<State> &traj, const float target_velocity);
  float calc_obstacle_cost(std::vector<State> &traj,const std::vector<std::vector<float>> &obs_list);
  void motion(State &state, const double velocity, const double yawrate);
  std::vector<std::vector<float>> raycast();
  std::vector<std::vector<float>> scan_to_obs();

  Vector2d mapToWorld(Vector2i mapt,double resolution_,double origin_x,double origin_y) const;
  Vector2i worldToMap(Vector2d worldpt,double resolution_,double origin_x,double origin_y) const;

  void visualize_trajectories(const std::vector<std::vector<State>> &, const double, const double, const double, const int, const ros::Publisher &);
  void visualize_trajectory(const std::vector<State> &, const double, const double, const double, const ros::Publisher &);
  
  std::vector<Differential_DWAPlanner::State> dwa_planning(
      Window dynamic_window,
      Eigen::Vector3d goal,
      std::vector<std::vector<float>> obs_list,
      double target_velocity); 
  
  ros::Publisher chassCtlPub;
  geometry_msgs::Twist my_twist;

protected:
  double HZ;
  std::string ROBOT_FRAME;
  double TARGET_VELOCITY;
  double MAX_VELOCITY;
  double MIN_VELOCITY;
  double MAX_YAWRATE;
  double MAX_ACCELERATION;
  double MAX_D_YAWRATE;
  double MAX_DIST;
  double VELOCITY_RESOLUTION;
  double YAWRATE_RESOLUTION;
  double ANGLE_RESOLUTION;
  double PREDICT_TIME;
  double TO_GOAL_COST_GAIN;
  double SPEED_COST_GAIN;
  double OBSTACLE_COST_GAIN;
  double DT;
  double GOAL_THRESHOLD;
  double TURN_DIRECTION_THRESHOLD;

  std::vector<State> best_traj_to_use;
  robot_communication::chassisControl motionData;             

  bool use_scan_as_input;

  double map_origin_x{0.0};
  double map_origin_y{0.0};

  ros::NodeHandle nh;
  ros::NodeHandle local_nh;

  ros::Publisher velocity_pub;
  ros::Publisher candidate_trajectories_pub;
  ros::Publisher selected_trajectory_pub;
  ros::Publisher localPathPub;   

  ros::Subscriber local_map_sub;
  ros::Subscriber scan_sub;
  ros::Subscriber local_goal_sub;
  ros::Subscriber global_velocity_sub;
  ros::Subscriber odom_sub;
  ros::Subscriber target_velocity_sub;
  tf::TransformListener listener;

  robot_communication::localizationInfoBroadcast current_state;   
  robot_communication::localizationInfoBroadcast target_state;   

  robot_communication::goal local_goal;
  sensor_msgs::LaserScan scan;
  nav_msgs::OccupancyGrid local_map;
  geometry_msgs::Twist current_velocity;
  
  double vector_Velocity;
  bool local_goal_subscribed;
  bool scan_updated;
  bool local_map_updated;
  bool odom_updated;
  bool update_path;

  int path_nodes_num;
  int last_path_nodes_num;

  bool final_reached_{false};
  Eigen::Vector2d final_goal_;
  double goal_yaw_;   

  vector<Vector2d> trajpath;
  Vector3d nowposition;
  Vector3d localposition;
  vector<Vector2d> globalpath;

  void visual_VisitedNode(ros::Publisher pathPublish, std::vector<Eigen::Vector2d> visitnodes,
  float a_set,float r_set,float g_set,float b_set,float length);

  void GetRobotVelocity(Vector3d nowpoint,Vector3d endpoint,Vector3d &localvelocity);

  double anglePID[7] = {10.0,0,0,3.0,-3.0,0.05};
  pid_follow pidFollow;

  void Deal_Super_Circle(double *setangle,double *feedangle);
  ros::Publisher localgoalPub;      
  double calVectorAngle(Vector2d vector1,Vector2d vector2);
  vector<pair<int,Vector2d>> visitPath;
  Vector2d calUnitvector(Vector2d unitv);
  Vector2d caLocalGoalPosition(vector<Vector2d> path,Vector2d nowpoint,double radius);
  
  Odom_data_define carVel;
  Odom_data_define worldVel;
  double calPointLength(Vector2d vector1,Vector2d vector2);
  Vector2d lastendPoint;
  Vector2d firststartPoint;
  double TEMP_GOAL_RADIUS;
  void LIMIT_VECTOR_Velocity(double &velocity, double &yawrate);
  ros::Subscriber pathSub;
};

#endif //__DIFFERENTIAL_DWA_H