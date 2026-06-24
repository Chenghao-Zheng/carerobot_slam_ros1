#include "local_plan/differential_dwa.h"

Differential_DWAPlanner::Differential_DWAPlanner(void)
    : local_nh("~"), local_goal_subscribed(false), scan_updated(false), local_map_updated(false), odom_updated(false)
{
  local_nh.param("HZ", HZ, {20});
  local_nh.param("ROBOT_FRAME", ROBOT_FRAME, {"base_link"});
  local_nh.param("TARGET_VELOCITY", TARGET_VELOCITY, {0.8});
  local_nh.param("MAX_VELOCITY", MAX_VELOCITY, {1.0});
  local_nh.param("MIN_VELOCITY", MIN_VELOCITY, {0.0}); 
  local_nh.param("MAX_YAWRATE", MAX_YAWRATE, {1.5});
  local_nh.param("MAX_ACCELERATION", MAX_ACCELERATION, {1.5});
  local_nh.param("MAX_D_YAWRATE", MAX_D_YAWRATE, {8.0});
  local_nh.param("MAX_DIST", MAX_DIST, {10.0});
  local_nh.param("VELOCITY_RESOLUTION", VELOCITY_RESOLUTION, {0.05});
  local_nh.param("YAWRATE_RESOLUTION", YAWRATE_RESOLUTION, {0.05});
  local_nh.param("ANGLE_RESOLUTION", ANGLE_RESOLUTION, {0.0087});
  local_nh.param("PREDICT_TIME", PREDICT_TIME, {3.0});
  local_nh.param("TO_GOAL_COST_GAIN", TO_GOAL_COST_GAIN, {1.0});
  local_nh.param("SPEED_COST_GAIN", SPEED_COST_GAIN, {0.5});
  local_nh.param("OBSTACLE_COST_GAIN", OBSTACLE_COST_GAIN, {1.0});
  local_nh.param("GOAL_THRESHOLD", GOAL_THRESHOLD, {0.2});
  local_nh.param("TURN_DIRECTION_THRESHOLD", TURN_DIRECTION_THRESHOLD, {0.1});
  local_nh.param("TEMP_GOAL_RADIUS", TEMP_GOAL_RADIUS, {4.0});
  DT = 1.0 / HZ;

  if (MIN_VELOCITY < 0.0) {
      MIN_VELOCITY = 0.0;
  }
  
  candidate_trajectories_pub = local_nh.advertise<visualization_msgs::MarkerArray>("candidate_trajectories", 1);
  selected_trajectory_pub = local_nh.advertise<visualization_msgs::Marker>("selected_trajectory", 1);
  localPathPub = local_nh.advertise<nav_msgs::Path>("/local_path",1);
  chassCtlPub = local_nh.advertise<geometry_msgs::Twist>("/cmd_vel_auto", 1, true);
  localgoalPub = nh.advertise<visualization_msgs::Marker>("/local_goal_vis", 10);

  local_goal_sub = nh.subscribe("/local_goal", 1, &Differential_DWAPlanner::local_goal_callback, this);
  local_map_sub = nh.subscribe("/local_map_inflate", 1, &Differential_DWAPlanner::local_map_callback, this);
  odom_sub = nh.subscribe("/carto_odom", 1, &Differential_DWAPlanner::odom_callback, this);
  target_velocity_sub = nh.subscribe("/velocity_control", 1, &Differential_DWAPlanner::target_velocity_callback, this);
  pathSub = nh.subscribe("/opt_path",10,&Differential_DWAPlanner::pathCallback,this);
  
  pidFollow.Init();
  pidFollow.SetPIDParameter(&pidFollow.gyro_pid,anglePID);
}

Differential_DWAPlanner::State::State(double _x, double _y, double _yaw, double _velocity, double _yawrate)
    : x(_x), y(_y), yaw(_yaw), velocity(_velocity), yawrate(_yawrate) {}

Differential_DWAPlanner::Window::Window(void)
    : min_velocity(0.0), max_velocity(0.0), min_yawrate(0.0), max_yawrate(0.0) {}

Differential_DWAPlanner::Window::Window(const double min_v, const double max_v, const double min_y, const double max_y)
    : min_velocity(min_v), max_velocity(max_v), min_yawrate(min_y), max_yawrate(max_y) {}

void Differential_DWAPlanner::local_goal_callback(const robot_communication::goalConstPtr &msg) {
  local_goal = *msg;
  local_goal_subscribed = true;
}

void Differential_DWAPlanner::local_map_callback(const nav_msgs::OccupancyGridConstPtr &msg) {
  local_map = *msg;
  local_map_updated = true;
  map_origin_x = msg->info.origin.position.x;
  map_origin_y = msg->info.origin.position.y;
}

void Differential_DWAPlanner::pathCallback(const nav_msgs::PathConstPtr &path) {
  nav_msgs::Path tempath = *path;
  path_nodes_num = tempath.poses.size();
  if(path_nodes_num <= 0) return;

  update_path = (path_nodes_num != last_path_nodes_num);

  Eigen::Vector2d new_end(tempath.poses.back().pose.position.x,
                          tempath.poses.back().pose.position.y);

  if(update_path == true) {
    if (final_reached_) {
      if (calPointLength(final_goal_, new_end) < GOAL_THRESHOLD * 2) {
        final_goal_ = new_end;
        if (trajpath.size() >= 2) {
          Vector2d last_dir = trajpath.back() - trajpath[trajpath.size()-2];
          goal_yaw_ = atan2(last_dir[1], last_dir[0]);
        } else {
          goal_yaw_ = atan2(new_end[1] - nowposition[1], new_end[0] - nowposition[0]);
        }
        localposition[0] = final_goal_[0];
        localposition[1] = final_goal_[1];
        localposition[2] = goal_yaw_;
        local_goal_subscribed = true;
        return;
      }
    }

    trajpath.clear();
    visitPath.clear();
    for (int i = 0; i < path_nodes_num; i++) {
      Vector2d tempoint(tempath.poses[i].pose.position.x, tempath.poses[i].pose.position.y);
      trajpath.push_back(tempoint);
      visitPath.push_back(make_pair(0,tempoint));
    }
    firststartPoint[0] = tempath.poses[0].pose.position.x;
    firststartPoint[1] = tempath.poses[0].pose.position.y;
    final_reached_ = false;
    last_path_nodes_num = path_nodes_num;
    local_goal_subscribed = true;

    Vector2d tempnow(nowposition[0], nowposition[1]);
    int nearest = 0;
    double min_dist = 1e9;
    for (size_t i = 0; i < trajpath.size(); ++i) {
      double d = calPointLength(trajpath[i], tempnow);
      if (d < min_dist) { min_dist = d; nearest = (int)i; }
    }
    double remain = 0.0;
    for (size_t i = nearest; i < trajpath.size()-1; ++i)
      remain += calPointLength(trajpath[i], trajpath[i+1]);
    
    // 修复：动态前瞻距离，根据当前速度决定看得多远，避免拐弯时过度偏离
    double current_v = current_velocity.linear.x;
    double lookahead_base = 0.5 + fabs(current_v) * 1.0; 
    double lookahead = std::max(0.2, std::min(lookahead_base, std::min(TEMP_GOAL_RADIUS, remain * 0.8)));

    double acc = 0.0;
    size_t idx = nearest;
    for (size_t i = nearest; i < trajpath.size()-1; ++i) {
      acc += calPointLength(trajpath[i], trajpath[i+1]);
      if (acc >= lookahead) { idx = i+1; break; }
      if (i == trajpath.size()-2) idx = trajpath.size()-1;
    }
    localposition[0] = trajpath[idx][0];
    localposition[1] = trajpath[idx][1];
    if (idx < trajpath.size()-1) {
      Vector2d dir = trajpath[idx+1] - trajpath[idx];
      localposition[2] = atan2(dir[1], dir[0]);
    } else {
      Vector2d dir = trajpath[idx] - trajpath[idx-1];
      localposition[2] = atan2(dir[1], dir[0]);
    }
    goal_yaw_ = localposition[2];
    return;
  }

  Vector2d tempnow(nowposition[0], nowposition[1]);
  size_t nearest = 0;
  double min_dist = 1e9;
  for (size_t i = 0; i < trajpath.size(); ++i) {
    double d = calPointLength(trajpath[i], tempnow);
    if (d < min_dist) { min_dist = d; nearest = i; }
  }

  double remain_dist = 0.0;
  for (size_t i = nearest; i < trajpath.size()-1; ++i)
    remain_dist += calPointLength(trajpath[i], trajpath[i+1]);

  // 修复：同上的动态前瞻
  double current_v = current_velocity.linear.x;
  double lookahead_base = 0.5 + fabs(current_v) * 1.0;
  double effective_lookahead = std::max(0.2, std::min(lookahead_base, std::min(TEMP_GOAL_RADIUS, remain_dist * 0.8)));

  double acc = 0.0;
  size_t idx = nearest;
  for (size_t i = nearest; i < trajpath.size()-1; ++i) {
    acc += calPointLength(trajpath[i], trajpath[i+1]);
    if (acc >= effective_lookahead) { idx = i+1; break; }
    if (i == trajpath.size()-2) idx = trajpath.size()-1;
  }

  double dist_to_final = calPointLength(trajpath.back(), tempnow);

  if (final_reached_) {
      localposition[0] = final_goal_[0];
      localposition[1] = final_goal_[1];
      localposition[2] = goal_yaw_;
  } else {
      if (dist_to_final < GOAL_THRESHOLD || idx == trajpath.size()-1) {
          final_reached_ = true;
          final_goal_ = trajpath.back();
          if (trajpath.size() >= 2) {
              Vector2d last_dir = trajpath.back() - trajpath[trajpath.size()-2];
              goal_yaw_ = atan2(last_dir[1], last_dir[0]);
          } else {
              goal_yaw_ = atan2(final_goal_[1] - nowposition[1], final_goal_[0] - nowposition[0]);
          }
          localposition[0] = final_goal_[0];
          localposition[1] = final_goal_[1];
          localposition[2] = goal_yaw_;
      } else {
          localposition[0] = trajpath[idx][0];
          localposition[1] = trajpath[idx][1];
          if (idx < trajpath.size()-1) {
              Vector2d dir = trajpath[idx+1] - trajpath[idx];
              localposition[2] = atan2(dir[1], dir[0]);
          } else {
              Vector2d dir = trajpath[idx] - trajpath[idx-1];
              localposition[2] = atan2(dir[1], dir[0]);
          }
          goal_yaw_ = localposition[2];
      }
  }
  local_goal_subscribed = true;

  vector<Vector2d> tempvec;
  tempvec.push_back(Vector2d(localposition[0],localposition[1]));
  visual_VisitedNode(localgoalPub,tempvec,1,0,1,0.5,5);
  last_path_nodes_num = path_nodes_num;
}

double Differential_DWAPlanner::calVectorAngle(Vector2d vector1, Vector2d vector2) {
  Vector2d vectorFirst = calUnitvector(vector1);
  Vector2d vectorSecond = calUnitvector(vector2);
  double vector_angle = vectorFirst[0]*vectorSecond[0] + vectorFirst[1]*vectorSecond[1];
  return acos(vector_angle);
}

double Differential_DWAPlanner::calPointLength(Vector2d vector1, Vector2d vector2) {
  return sqrt((vector1[0]-vector2[0])*(vector1[0]-vector2[0]) + (vector1[1]-vector2[1])*(vector1[1]-vector2[1]));
}

Vector2d Differential_DWAPlanner::calUnitvector(Vector2d unitv) {
  unitv = unitv * 1.0f / sqrt(pow(abs(unitv[0]),2)+pow(abs(unitv[1]),2));
  return unitv;
}

void Differential_DWAPlanner::LIMIT_VECTOR_Velocity(double &velocity, double &yawrate) {
  if(velocity > MAX_VELOCITY) velocity = MAX_VELOCITY;
  if(velocity < MIN_VELOCITY) velocity = MIN_VELOCITY;
  if(yawrate > MAX_YAWRATE) yawrate = MAX_YAWRATE;
  if(yawrate < -MAX_YAWRATE) yawrate = -MAX_YAWRATE;
}

void Differential_DWAPlanner::odom_callback(const nav_msgs::OdometryConstPtr &msg) {
  current_velocity = msg->twist.twist;
  nowposition[0] = msg->pose.pose.position.x;
  nowposition[1] = msg->pose.pose.position.y;
  double roll, pitch, yaw;
  tf::Quaternion q(msg->pose.pose.orientation.x, msg->pose.pose.orientation.y,
                   msg->pose.pose.orientation.z, msg->pose.pose.orientation.w);
  tf::Matrix3x3(q).getRPY(roll, pitch, yaw);
  nowposition[2] = yaw;
  if(fabs(current_velocity.angular.z) < 0.01) current_velocity.angular.z = 0.0;
  odom_updated = true;
}

void Differential_DWAPlanner::target_velocity_callback(const geometry_msgs::TwistConstPtr &msg) {
  TARGET_VELOCITY = sqrt(pow(msg->linear.x,2)+pow(msg->linear.y,2));
}

// 确保在 dwa_planning 中完整调用了这套代价逻辑
std::vector<Differential_DWAPlanner::State> Differential_DWAPlanner::dwa_planning(
    Window dynamic_window, Eigen::Vector3d goal, std::vector<std::vector<float>> obs_list, double target_velocity) {
  float min_cost = 1e6;
  std::vector<State> best_traj;

  for (float v = dynamic_window.min_velocity; v <= dynamic_window.max_velocity; v += VELOCITY_RESOLUTION) {
    for (float y = dynamic_window.min_yawrate; y <= dynamic_window.max_yawrate; y += YAWRATE_RESOLUTION) {
      State state(0.0, 0.0, 0.0, current_velocity.linear.x, current_velocity.angular.z);
      std::vector<State> traj;
      for (float t = 0; t <= PREDICT_TIME; t += DT) {
        motion(state, v, y);
        traj.push_back(state);
      }
      
      float to_goal_cost = calc_to_goal_cost(traj, goal);
      float speed_cost = calc_speed_cost(traj, target_velocity);
      float obstacle_cost = calc_obstacle_cost(traj, obs_list);
      
      // 最终代价计算：权重决定了行为倾向
      float final_cost = TO_GOAL_COST_GAIN * to_goal_cost + 
                         SPEED_COST_GAIN * speed_cost + 
                         OBSTACLE_COST_GAIN * obstacle_cost;

      if (final_cost < min_cost) {
        min_cost = final_cost;
        best_traj = traj;
      }
    }
  }
  return best_traj;
}

void Differential_DWAPlanner::process(void) {
  ros::Rate loop_rate(HZ);
  const double POSITION_TOLERANCE_ = 0.05;   
  const double ANGLE_TOLERANCE_ = 0.1;       

  while (ros::ok()) {
    if (local_map_updated && local_goal_subscribed && odom_updated) {
      Window dynamic_window = calc_dynamic_window(current_velocity);

      // --- 在这里添加你的调试代码 ---
      std::vector<std::vector<float>> obs_list = raycast();
      ROS_INFO_THROTTLE(1.0, "Current obstacles detected: %ld", obs_list.size());
      
      double cos_yaw = cos(nowposition[2]);
      double sin_yaw = sin(nowposition[2]);
      double dx = localposition[0] - nowposition[0];
      double dy = localposition[1] - nowposition[1];
      double local_goal_x =  dx * cos_yaw + dy * sin_yaw;
      double local_goal_y = -dx * sin_yaw + dy * cos_yaw;
      double local_goal_yaw = localposition[2] - nowposition[2];
      local_goal_yaw = atan2(sin(local_goal_yaw), cos(local_goal_yaw));
      
      // 传递给 DWA 的 goal 包含局部坐标系的 X, Y 坐标
      Eigen::Vector3d goal(local_goal_x, local_goal_y, local_goal_yaw);

      geometry_msgs::Twist cmd_vel;
      double dist_to_goal = hypot(goal[0], goal[1]);
      double heading_error = fabs(local_goal_yaw);

      double current_target_vel = TARGET_VELOCITY;
      if (dist_to_goal < GOAL_THRESHOLD * 2.0) {
          current_target_vel = TARGET_VELOCITY * (dist_to_goal / (GOAL_THRESHOLD * 2.0));
          dynamic_window.max_velocity = std::min(dynamic_window.max_velocity, std::max(current_target_vel, 0.05));
      }

      if (dist_to_goal <= POSITION_TOLERANCE_) {
        if (heading_error <= ANGLE_TOLERANCE_) {
            cmd_vel.linear.x = 0.0;
            cmd_vel.angular.z = 0.0;
            ROS_INFO_THROTTLE(1.0, "Goal reached perfectly. Stopping.");
        } else {
            cmd_vel.linear.x = 0.0;
            double kp_yaw = 1.0; 
            cmd_vel.angular.z = local_goal_yaw * kp_yaw;
            if(cmd_vel.angular.z > MAX_YAWRATE) cmd_vel.angular.z = MAX_YAWRATE;
            if(cmd_vel.angular.z < -MAX_YAWRATE) cmd_vel.angular.z = -MAX_YAWRATE;
            ROS_INFO_THROTTLE(1.0, "Position reached. Aligning heading...");
        }
      } else {
        std::vector<std::vector<float>> obs_list = raycast();
        std::vector<State> best_traj = dwa_planning(dynamic_window, goal, obs_list, current_target_vel);
        cmd_vel.linear.x = best_traj.back().velocity;
        cmd_vel.angular.z = best_traj.back().yawrate;
        visualize_trajectory(best_traj, 1, 0, 0, selected_trajectory_pub);
      }

      chassCtlPub.publish(cmd_vel);
    } else {
      if (!local_goal_subscribed) ROS_WARN_THROTTLE(1.0, "Local goal has not been updated");
      if (!odom_updated) ROS_WARN_THROTTLE(1.0, "Odom has not been updated");
      if (!local_map_updated) ROS_WARN_THROTTLE(1.0, "Local map has not been updated");
    }
    ros::spinOnce();
    loop_rate.sleep();
  }
}

// 修复核心 1：扩大速度采样评估窗口，避免分辨率死锁
Differential_DWAPlanner::Window Differential_DWAPlanner::calc_dynamic_window(const geometry_msgs::Twist &cur_velocity) {
  Window window(MIN_VELOCITY, MAX_VELOCITY, -MAX_YAWRATE, MAX_YAWRATE);
  // 使用 0.2 秒的前瞻时间来生成窗口，防止因 DT(0.05s) 过短导致被分辨率卡死在 v=0 无法起步
  double eval_dt = 0.2; 
  double accel_v = MAX_ACCELERATION * eval_dt;
  double accel_w = MAX_D_YAWRATE * eval_dt;
  
  window.min_velocity = std::max((current_velocity.linear.x - accel_v), MIN_VELOCITY);
  if (window.min_velocity < 0.0) {
      window.min_velocity = 0.0;
  }
  
  window.max_velocity = std::min((current_velocity.linear.x + accel_v), MAX_VELOCITY);
  window.min_yawrate = std::max((current_velocity.angular.z - accel_w), -MAX_YAWRATE);
  window.max_yawrate = std::min((current_velocity.angular.z + accel_w), MAX_YAWRATE);
  return window;
}

// 修复核心 2：彻底重写到达目标的代价计算
float Differential_DWAPlanner::calc_to_goal_cost(const std::vector<State> &traj, const Eigen::Vector3d &goal) {
  // 目标点在机器人局部坐标系下的位置
  double target_x = goal[0];
  double target_y = goal[1];
  
  // 轨迹末端点在机器人局部坐标系下的位置和朝向
  double end_x = traj.back().x;
  double end_y = traj.back().y;
  double end_yaw = traj.back().yaw;

  // 计算轨迹末端到目标点的相对向量
  double dx = target_x - end_x;
  double dy = target_y - end_y;
  
  // 1. 距离代价（直接鼓励小车靠向目标点）
  double dist_to_goal = hypot(dx, dy);
  
  // 2. 航向代价（要求车头必须指向目标点的位置，而不是平行于目标点的切线！）
  double angle_to_goal = atan2(dy, dx);
  double heading_error = fabs(atan2(sin(angle_to_goal - end_yaw), cos(angle_to_goal - end_yaw)));

  // 综合代价：通过优先保证对准方向，并缩短距离，完美驱动差速底盘向目标进发
  return dist_to_goal + 2.0 * heading_error;
}

float Differential_DWAPlanner::calc_speed_cost(const std::vector<State> &traj, const float target_velocity) {
  return fabs(target_velocity - traj.back().velocity);
}

// 优化后的避障代价函数
float Differential_DWAPlanner::calc_obstacle_cost(std::vector<State> &traj, const std::vector<std::vector<float>> &obs_list) {
  // 如果没有任何障碍物数据，直接返回 0 代价
  if (obs_list.empty()) return 0.0;

  float cost = 0.0;
  const float ROBOT_RADIUS = 0.4;  // 机器人的安全半径
  const float SAFE_DISTANCE = 0.8; // 避障惩罚起始距离

  for (const auto &state : traj) {
    for (const auto &obs : obs_list) {
      float dist = hypot(state.x - obs[0], state.y - obs[1]);
      
      // 致命碰撞检测：轨迹直接穿过机器人半径内，给极大惩罚
      if (dist <= ROBOT_RADIUS) {
        return 1e6; // 这是一个“拒绝”信号，DWA 会直接舍弃此路径
      }
      
      // 软避障代价：距离越近，代价增长越快 (非线性惩罚)
      if (dist < SAFE_DISTANCE) {
        cost += (SAFE_DISTANCE - dist) * 50.0; // 调高乘数，让避障代价变敏感
      }
    }
  }
  return cost;
}

void Differential_DWAPlanner::motion(State &state, const double velocity, const double yawrate) {
  state.yaw += yawrate * DT;
  state.x += velocity * std::cos(state.yaw) * DT;
  state.y += velocity * std::sin(state.yaw) * DT;
  state.velocity = velocity;
  state.yawrate = yawrate;
}

std::vector<std::vector<float>> Differential_DWAPlanner::raycast() {
  std::vector<std::vector<float>> obs_list;
  double robot_x = nowposition[0];
  double robot_y = nowposition[1];
  double robot_yaw = nowposition[2];
  double cos_yaw = cos(robot_yaw);
  double sin_yaw = sin(robot_yaw);
  const float MIN_OBS_DIST = 0.1;  

  for (float angle = -M_PI; angle <= M_PI; angle += ANGLE_RESOLUTION) {
    for (float dist = 0.0; dist <= MAX_DIST; dist += local_map.info.resolution) {
      float x = dist * cos(angle);
      float y = dist * sin(angle);
      double wx = robot_x + x * cos_yaw - y * sin_yaw;
      double wy = robot_y + x * sin_yaw + y * cos_yaw;
      int i = (int)floor((wx - map_origin_x) / local_map.info.resolution + 0.5);
      int j = (int)floor((wy - map_origin_y) / local_map.info.resolution + 0.5);
      if (i < 0 || i >= (int)local_map.info.width || j < 0 || j >= (int)local_map.info.height) break;
      if (local_map.data[j * local_map.info.width + i] == 100) {
        float obs_dist = hypot(x, y);
        if (obs_dist > MIN_OBS_DIST)   
          obs_list.push_back({x, y});
        break;
      }
    }
  }
  return obs_list;
}

void Differential_DWAPlanner::visualize_trajectories(const std::vector<std::vector<State>> &trajectories, const double r, const double g, const double b, const int trajectories_size, const ros::Publisher &pub) {
  visualization_msgs::MarkerArray v_trajectories;
  size_t count = 0;
  const size_t size = trajectories.size();
  for (; count < size; count++) {
    visualization_msgs::Marker v_trajectory;
    v_trajectory.header.frame_id = ROBOT_FRAME;
    v_trajectory.header.stamp = ros::Time::now();
    v_trajectory.color.r = r; v_trajectory.color.g = g; v_trajectory.color.b = b; v_trajectory.color.a = 0.8;
    v_trajectory.ns = pub.getTopic();
    v_trajectory.type = visualization_msgs::Marker::LINE_STRIP;
    v_trajectory.action = visualization_msgs::Marker::ADD;
    v_trajectory.lifetime = ros::Duration();
    v_trajectory.id = (int)count;
    v_trajectory.scale.x = 0.02;
    geometry_msgs::Pose pose; pose.orientation.w = 1; v_trajectory.pose = pose;
    for (const auto &state : trajectories[count]) {
      geometry_msgs::Point p; p.x = state.x; p.y = state.y;
      v_trajectory.points.push_back(p);
    }
    v_trajectories.markers.push_back(v_trajectory);
  }
  for (; count < (size_t)trajectories_size;) {
    visualization_msgs::Marker v_trajectory;
    v_trajectory.header.frame_id = ROBOT_FRAME;
    v_trajectory.header.stamp = ros::Time::now();
    v_trajectory.ns = pub.getTopic();
    v_trajectory.type = visualization_msgs::Marker::LINE_STRIP;
    v_trajectory.action = visualization_msgs::Marker::DELETE;
    v_trajectory.id = (int)count;
    v_trajectory.lifetime = ros::Duration();
    v_trajectories.markers.push_back(v_trajectory);
    count++;
  }
  pub.publish(v_trajectories);
}

void Differential_DWAPlanner::visualize_trajectory(const std::vector<State> &trajectory, const double r, const double g, const double b, const ros::Publisher &pub) {
  visualization_msgs::Marker v_trajectory;
  v_trajectory.header.frame_id = ROBOT_FRAME;
  v_trajectory.header.stamp = ros::Time::now();
  v_trajectory.color.r = r; v_trajectory.color.g = g; v_trajectory.color.b = b; v_trajectory.color.a = 0.8;
  v_trajectory.ns = pub.getTopic();
  v_trajectory.type = visualization_msgs::Marker::LINE_STRIP;
  v_trajectory.action = visualization_msgs::Marker::ADD;
  v_trajectory.scale.x = 0.05;
  geometry_msgs::Pose pose; pose.orientation.w = 1; v_trajectory.pose = pose;
  nav_msgs::Path local_path;
  for (const auto &state : trajectory) {
    geometry_msgs::Point p; p.x = state.x; p.y = state.y;
    v_trajectory.points.push_back(p);
    geometry_msgs::PoseStamped point;
    point.pose.position.x = state.x; point.pose.position.y = state.y;
    local_path.poses.push_back(point);
  }
  pub.publish(v_trajectory);
  local_path.header.frame_id = ROBOT_FRAME;
  local_path.header.stamp = ros::Time::now();
  localPathPub.publish(local_path);
}

void Differential_DWAPlanner::visual_VisitedNode(ros::Publisher pathPublish, std::vector<Eigen::Vector2d> visitnodes,
float a_set, float r_set, float g_set, float b_set, float length) {
  visualization_msgs::Marker node_vis;
  node_vis.header.frame_id = "map";
  node_vis.header.stamp = ros::Time::now();
  node_vis.color.a = a_set; node_vis.color.r = r_set; node_vis.color.g = g_set; node_vis.color.b = b_set;
  node_vis.ns = "differential_dwa";
  node_vis.type = visualization_msgs::Marker::CUBE_LIST;
  node_vis.action = visualization_msgs::Marker::ADD;
  node_vis.id = 0;
  node_vis.pose.orientation.w = 1.0;
  node_vis.scale.x = node_vis.scale.y = node_vis.scale.z = 0.05 * length;
  for (size_t i = 0; i < visitnodes.size(); i++) {
    geometry_msgs::Point pt; pt.x = visitnodes[i][0]; pt.y = visitnodes[i][1];
    node_vis.points.push_back(pt);
  }
  pathPublish.publish(node_vis);
}