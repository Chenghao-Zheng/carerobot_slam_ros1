#include "local_plan/differential_dwa.h"
#include <angles/angles.h>
#include <limits>

// ========== State 和 Window 构造函数实现 ==========
Differential_DWAPlanner::State::State(double _x, double _y, double _yaw, double _velocity, double _yawrate)
    : x(_x), y(_y), yaw(_yaw), velocity(_velocity), yawrate(_yawrate) {}

Differential_DWAPlanner::Window::Window(void)
    : min_velocity(0.0), max_velocity(0.0), min_yawrate(0.0), max_yawrate(0.0) {}

Differential_DWAPlanner::Window::Window(const double min_v, const double max_v, const double min_y, const double max_y)
    : min_velocity(min_v), max_velocity(max_v), min_yawrate(min_y), max_yawrate(max_y) {}

// ------------------------------------------------------------
// 构造函数
// ------------------------------------------------------------
Differential_DWAPlanner::Differential_DWAPlanner(void)
    : local_nh("~"), local_goal_subscribed(false), scan_updated(false),
      local_map_updated(false), odom_updated(false), final_reached_(false),
      current_path_index_(0)
{
  // 加载参数
  local_nh.param("HZ", HZ, 20.0);
  local_nh.param("ROBOT_FRAME", ROBOT_FRAME, std::string("base_link"));
  local_nh.param("TARGET_VELOCITY", TARGET_VELOCITY, 0.8);
  local_nh.param("MAX_VELOCITY", MAX_VELOCITY, 1.0);
  local_nh.param("MIN_VELOCITY", MIN_VELOCITY, 0.0);
  local_nh.param("MAX_YAWRATE", MAX_YAWRATE, 1.5);
  local_nh.param("MAX_ACCELERATION", MAX_ACCELERATION, 0.6);
  local_nh.param("MAX_D_YAWRATE", MAX_D_YAWRATE, 3.0);
  local_nh.param("MAX_DIST", MAX_DIST, 5.0);
  local_nh.param("VELOCITY_RESOLUTION", VELOCITY_RESOLUTION, 0.05);
  local_nh.param("YAWRATE_RESOLUTION", YAWRATE_RESOLUTION, 0.05);
  local_nh.param("ANGLE_RESOLUTION", ANGLE_RESOLUTION, 0.0087);
  local_nh.param("PREDICT_TIME", PREDICT_TIME, 2.0);
  local_nh.param("TO_GOAL_COST_GAIN", TO_GOAL_COST_GAIN, 0.3);
  local_nh.param("SPEED_COST_GAIN", SPEED_COST_GAIN, 0.2);
  local_nh.param("OBSTACLE_COST_GAIN", OBSTACLE_COST_GAIN, 10.0);
  // ========== 移除强制置零的测试代码和警告 ==========
  // 现在 OBSTACLE_COST_GAIN 正常从参数读取
  // ================================================
  local_nh.param("GOAL_THRESHOLD", GOAL_THRESHOLD, 0.2);
  local_nh.param("TURN_DIRECTION_THRESHOLD", TURN_DIRECTION_THRESHOLD, 0.1);
  local_nh.param("TEMP_GOAL_RADIUS", TEMP_GOAL_RADIUS, 1.5);
  local_nh.param("ROBOT_RADIUS", ROBOT_RADIUS, 0.265);
  local_nh.param("SAFETY_MARGIN", SAFETY_MARGIN, 0.035);
  local_nh.param("LASER_MAX_RANGE", laser_max_range_, 3.0);
  local_nh.param("LOOKAHEAD_DIST", LOOKAHEAD_DIST, 0.65);

  DT = 1.0 / HZ;

  // 发布器
  candidate_trajectories_pub = local_nh.advertise<visualization_msgs::MarkerArray>("candidate_trajectories", 1);
  selected_trajectory_pub = local_nh.advertise<visualization_msgs::Marker>("selected_trajectory", 1);
  localPathPub = local_nh.advertise<nav_msgs::Path>("/local_path", 1);
  chassCtlPub = local_nh.advertise<geometry_msgs::Twist>("/cmd_vel_auto", 1, true);
  localgoalPub = nh.advertise<visualization_msgs::Marker>("/local_goal_vis", 10);

  // 订阅
  local_goal_sub = nh.subscribe("/local_goal", 1, &Differential_DWAPlanner::local_goal_callback, this);
  local_map_sub = nh.subscribe("/local_map_inflate", 1, &Differential_DWAPlanner::local_map_callback, this);
  odom_sub = nh.subscribe("/carto_odom", 1, &Differential_DWAPlanner::odom_callback, this);
  target_velocity_sub = nh.subscribe("/velocity_control", 1, &Differential_DWAPlanner::target_velocity_callback, this);
  pathSub = nh.subscribe("/opt_path", 10, &Differential_DWAPlanner::pathCallback, this);
  scan_sub = nh.subscribe("/not_true_scan", 1, &Differential_DWAPlanner::scan_callback, this);

  // PID（保留但实际未使用，仅为兼容）
  pidFollow.Init();
  anglePID[0]=10.0; anglePID[1]=0.0; anglePID[2]=0.0; anglePID[3]=3.0; anglePID[4]=-3.0; anglePID[5]=0.05;
  pidFollow.SetPIDParameter(&pidFollow.gyro_pid, anglePID);

  ROS_INFO("DWA local planner (ROS1 C++ with laser-based DWA) started.");
}

// ------------------------------------------------------------
// 回调函数实现（无修改，保持原样）
// ------------------------------------------------------------
void Differential_DWAPlanner::local_goal_callback(const robot_communication::goalConstPtr &msg) {
  local_goal = *msg;
  local_goal_subscribed = true;
}

void Differential_DWAPlanner::local_map_callback(const nav_msgs::OccupancyGridConstPtr &msg) {
  local_map = *msg;
  local_map_updated = true;
  map_origin_x_ = msg->info.origin.position.x;
  map_origin_y_ = msg->info.origin.position.y;
}

void Differential_DWAPlanner::odom_callback(const nav_msgs::OdometryConstPtr &msg) {
  current_velocity = msg->twist.twist;
  nowposition[0] = msg->pose.pose.position.x;
  nowposition[1] = msg->pose.pose.position.y;
  tf::Quaternion q(msg->pose.pose.orientation.x, msg->pose.pose.orientation.y,
                   msg->pose.pose.orientation.z, msg->pose.pose.orientation.w);
  double roll, pitch, yaw;
  tf::Matrix3x3(q).getRPY(roll, pitch, yaw);
  nowposition[2] = yaw;
  odom_updated = true;
}

void Differential_DWAPlanner::target_velocity_callback(const geometry_msgs::TwistConstPtr &msg) {
  TARGET_VELOCITY = sqrt(msg->linear.x*msg->linear.x + msg->linear.y*msg->linear.y);
}

void Differential_DWAPlanner::scan_callback(const sensor_msgs::LaserScanConstPtr &msg) {
  scan_points_.clear();
  double range_min = msg->range_min;
  for (size_t i = 0; i < msg->ranges.size(); ++i) {
    double r = msg->ranges[i];
    if (!std::isfinite(r) || r < range_min || r > laser_max_range_) continue;
    double angle = msg->angle_min + i * msg->angle_increment;
    scan_points_.push_back({r * cos(angle), r * sin(angle)});
  }
  scan_updated = true;
}

void Differential_DWAPlanner::pathCallback(const nav_msgs::PathConstPtr &path) {
  nav_msgs::Path tempath = *path;
  int new_size = tempath.poses.size();
  ROS_INFO("pathCallback received, size=%d", new_size);
  if (new_size <= 0) {
    ROS_WARN("Received empty path, ignoring.");
    return;
  }

  bool path_updated = (new_size != last_path_nodes_num);
  if (!path_updated && new_size == last_path_nodes_num) {
    Vector2d new_end(tempath.poses.back().pose.position.x, tempath.poses.back().pose.position.y);
    if (trajpath.size() > 0 && calPointLength(trajpath.back(), new_end) > 0.1) {
      path_updated = true;
    }
  }

  if (path_updated) {
    trajpath.clear();
    visitPath.clear();
    for (int i = 0; i < new_size; ++i) {
      Vector2d pt(tempath.poses[i].pose.position.x, tempath.poses[i].pose.position.y);
      trajpath.push_back(pt);
      visitPath.push_back({0, pt});
    }
    current_path_index_ = 0;
    final_reached_ = false;
    last_path_nodes_num = new_size;
    compute_lookahead_target(nowposition[0], nowposition[1],
                             localposition[0], localposition[1], localposition[2]);
    local_goal_subscribed = true;
    ROS_INFO("Path updated, local_goal_subscribed set to true.");
    return;
  }

  if (!trajpath.empty()) {
    update_path_index(nowposition[0], nowposition[1]);
    compute_lookahead_target(nowposition[0], nowposition[1],
                             localposition[0], localposition[1], localposition[2]);
    local_goal_subscribed = true;
    ROS_INFO("Path not updated, but local_goal_subscribed set to true.");
  }

  vector<Vector2d> tempvec = {Vector2d(localposition[0], localposition[1])};
  visual_VisitedNode(localgoalPub, tempvec, 1.0, 0.0, 1.0, 0.5, 5.0);
}

void Differential_DWAPlanner::update_path_index(double rx, double ry) {
  if (trajpath.empty() || current_path_index_ >= (int)trajpath.size()-1) return;

  const int max_steps = 20;
  for (int step = 0; step < max_steps; ++step) {
    if (current_path_index_ >= (int)trajpath.size()-1) break;
    int idx = current_path_index_;
    double x0 = trajpath[idx][0], y0 = trajpath[idx][1];
    double x1 = trajpath[idx+1][0], y1 = trajpath[idx+1][1];
    double sx = x1 - x0, sy = y1 - y0;
    double len_sq = sx*sx + sy*sy;
    if (len_sq < 1e-9) {
      current_path_index_++;
      continue;
    }
    double proj = ((rx - x0)*sx + (ry - y0)*sy) / len_sq;
    double dist_to_next = hypot(rx - x1, ry - y1);
    double dist_to_curr = hypot(rx - x0, ry - y0);
    if (proj >= 0.5 || dist_to_next < dist_to_curr || dist_to_next < 0.09) {
      current_path_index_++;
    } else {
      break;
    }
  }
}

void Differential_DWAPlanner::compute_lookahead_target(double rx, double ry,
                                                       double &gx, double &gy, double &g_yaw) {
  if (trajpath.empty()) {
    gx = rx; gy = ry; g_yaw = nowposition[2];
    return;
  }

  int start_idx = std::min(current_path_index_, (int)trajpath.size()-1);
  double accumulated = 0.0;
  int target_idx = start_idx;
  double current_speed = fabs(current_velocity.linear.x);
  double lookahead = LOOKAHEAD_DIST + 0.5 * current_speed;
  lookahead = std::max(0.3, std::min(lookahead, TEMP_GOAL_RADIUS));

  for (int i = start_idx; i < (int)trajpath.size()-1; ++i) {
    double seg = hypot(trajpath[i+1][0] - trajpath[i][0],
                       trajpath[i+1][1] - trajpath[i][1]);
    if (accumulated + seg >= lookahead) {
      target_idx = i+1;
      break;
    }
    accumulated += seg;
    target_idx = i+1;
  }
  target_idx = std::min(target_idx, (int)trajpath.size()-1);
  gx = trajpath[target_idx][0];
  gy = trajpath[target_idx][1];
  if (target_idx < (int)trajpath.size()-1) {
    double dx = trajpath[target_idx+1][0] - trajpath[target_idx][0];
    double dy = trajpath[target_idx+1][1] - trajpath[target_idx][1];
    g_yaw = atan2(dy, dx);
  } else {
    g_yaw = atan2(gy - ry, gx - rx);
  }
  double dist_to_final = hypot(trajpath.back()[0] - rx, trajpath.back()[1] - ry);
  if (dist_to_final < GOAL_THRESHOLD || target_idx == (int)trajpath.size()-1) {
    if (!final_reached_) {
      final_reached_ = true;
      final_goal_ = trajpath.back();
      if (trajpath.size() >= 2) {
        Vector2d last_dir = trajpath.back() - trajpath[trajpath.size()-2];
        goal_yaw_ = atan2(last_dir[1], last_dir[0]);
      } else {
        goal_yaw_ = atan2(final_goal_[1] - ry, final_goal_[0] - rx);
      }
    }
    gx = final_goal_[0];
    gy = final_goal_[1];
    g_yaw = goal_yaw_;
  }
}

// ------------------------------------------------------------
// DWA 动态窗口计算 —— 恢复使用 eval_dt = 0.2 保证窗口大小
// ------------------------------------------------------------
Differential_DWAPlanner::Window Differential_DWAPlanner::calc_dynamic_window(const geometry_msgs::Twist &cur_velocity) {
  Window window(MIN_VELOCITY, MAX_VELOCITY, -MAX_YAWRATE, MAX_YAWRATE);
  // 使用 0.2s 的加速度时间步长，以保证动态窗口足够大，允许转向动作
  double eval_dt = 0.2;
  double accel_v = MAX_ACCELERATION * eval_dt;
  double accel_w = MAX_D_YAWRATE * eval_dt;

  window.min_velocity = std::max(cur_velocity.linear.x - accel_v, MIN_VELOCITY);
  if (window.min_velocity < 0.0) window.min_velocity = 0.0;
  window.max_velocity = std::min(cur_velocity.linear.x + accel_v, MAX_VELOCITY);
  window.min_yawrate = std::max(cur_velocity.angular.z - accel_w, -MAX_YAWRATE);
  window.max_yawrate = std::min(cur_velocity.angular.z + accel_w, MAX_YAWRATE);
  return window;
}

// ------------------------------------------------------------
// 代价函数 —— 保留航向误差但降低系数，同时考虑距离
// ------------------------------------------------------------
float Differential_DWAPlanner::calc_to_goal_cost(const std::vector<State> &traj, const Eigen::Vector3d &goal) {
  double end_x = traj.back().x;
  double end_y = traj.back().y;
  double end_yaw = traj.back().yaw;

  double dx = goal[0] - end_x;
  double dy = goal[1] - end_y;
  double dist_cost = hypot(dx, dy);

  double angle_to_goal = atan2(dy, dx);
  double heading_error = fabs(angles::shortest_angular_distance(end_yaw, angle_to_goal));

  // 降低航向误差的权重（从 2.0 降到 0.5），使小车转向不会受重罚，但仍保持一定方向性
  return dist_cost + 0.5 * heading_error;
}

float Differential_DWAPlanner::calc_speed_cost(const std::vector<State> &traj, const float target_velocity) {
  return fabs(target_velocity - traj.back().velocity);
}

// ------------------------------------------------------------
// 避障代价 —— 仅使用距离指数惩罚，不加方向因子，避免干扰路径跟踪
// ------------------------------------------------------------
float Differential_DWAPlanner::calc_obstacle_cost(std::vector<State> &traj,
                                                  const std::vector<std::pair<double,double>> &scan_points) {
    if (scan_points.empty()) return 0.0f;

    const float safety_dist = ROBOT_RADIUS + SAFETY_MARGIN;
    float total_cost = 0.0f;
    int valid_count = 0;

    for (const auto &state : traj) {
        float min_dist = std::numeric_limits<float>::max();
        for (const auto &pt : scan_points) {
            double dx = state.x - pt.first;
            double dy = state.y - pt.second;
            double dist = hypot(dx, dy);
            if (dist < min_dist) min_dist = dist;
        }
        if (min_dist < safety_dist) {
            // 指数惩罚，距离越近代价越高，但系数降为 5.0 使惩罚温和
            total_cost += exp(-(min_dist / safety_dist)) * 5.0;
        }
        valid_count++;
    }
    return (valid_count > 0) ? (total_cost / valid_count) : 0.0f;
}

// ------------------------------------------------------------
// 运动模型（不变）
// ------------------------------------------------------------
void Differential_DWAPlanner::motion(State &state, const double velocity, const double yawrate) {
  state.yaw += yawrate * DT;
  state.x += velocity * cos(state.yaw) * DT;
  state.y += velocity * sin(state.yaw) * DT;
  state.velocity = velocity;
  state.yawrate = yawrate;
}

// ------------------------------------------------------------
// DWA 规划核心（不变）
// ------------------------------------------------------------
std::vector<Differential_DWAPlanner::State>
Differential_DWAPlanner::dwa_planning(Window dynamic_window,
                                      Eigen::Vector3d goal,
                                      const std::vector<std::pair<double,double>> &scan_points,
                                      double target_velocity) {
  float min_cost = 1e6;
  std::vector<State> best_traj;

  for (float v = dynamic_window.min_velocity; v <= dynamic_window.max_velocity; v += VELOCITY_RESOLUTION) {
    for (float w = dynamic_window.min_yawrate; w <= dynamic_window.max_yawrate; w += YAWRATE_RESOLUTION) {
      State state(0.0, 0.0, 0.0, current_velocity.linear.x, current_velocity.angular.z);
      std::vector<State> traj;
      for (float t = 0; t <= PREDICT_TIME; t += DT) {
        motion(state, v, w);
        traj.push_back(state);
      }

      float to_goal = calc_to_goal_cost(traj, goal);
      float speed = calc_speed_cost(traj, target_velocity);
      float obstacle = calc_obstacle_cost(traj, scan_points);
      float final_cost = TO_GOAL_COST_GAIN * to_goal
                       + SPEED_COST_GAIN * speed
                       + OBSTACLE_COST_GAIN * obstacle;

      if (final_cost < min_cost) {
        min_cost = final_cost;
        best_traj = traj;
      }
    }
  }

  ROS_INFO_THROTTLE(1.0, "DWA min_cost: %.3f, best_traj size: %lu", min_cost, best_traj.size());

  if (min_cost == 1e6) {
    State state(0.0, 0.0, 0.0, 0.1, 0.0);
    best_traj.push_back(state);
    ROS_WARN("No valid trajectory found, using default speed 0.1 m/s.");
  }
  return best_traj;
}

// ------------------------------------------------------------
// 主循环（保持不变）
// ------------------------------------------------------------
void Differential_DWAPlanner::process(void) {
  ros::Rate loop_rate(HZ);

  while (ros::ok()) {
    if (!local_goal_subscribed && !trajpath.empty()) {
        local_goal_subscribed = true;
        ROS_INFO("local_goal_subscribed manually set because trajpath is not empty.");
    }

    if (local_map_updated && local_goal_subscribed && odom_updated && scan_updated) {
      Window dynamic_window = calc_dynamic_window(current_velocity);

      double cos_yaw = cos(nowposition[2]);
      double sin_yaw = sin(nowposition[2]);
      double dx = localposition[0] - nowposition[0];
      double dy = localposition[1] - nowposition[1];
      double local_goal_x =  dx * cos_yaw + dy * sin_yaw;
      double local_goal_y = -dx * sin_yaw + dy * cos_yaw;
      double local_goal_yaw = angles::shortest_angular_distance(nowposition[2], localposition[2]);

      Eigen::Vector3d goal(local_goal_x, local_goal_y, local_goal_yaw);
      double dist_to_goal = hypot(goal[0], goal[1]);

      // ----- 新增加速逻辑 -----
      geometry_msgs::Twist cmd_vel;

      // 1. 近距离：停车并调整航向
      if (dist_to_goal < GOAL_THRESHOLD) {
        cmd_vel.linear.x = 0.0;
        if (fabs(local_goal_yaw) < 0.1) {
          cmd_vel.angular.z = 0.0;
        } else {
          cmd_vel.angular.z = std::min(std::max(local_goal_yaw * 1.2, -MAX_YAWRATE), MAX_YAWRATE);
        }
        ROS_INFO_THROTTLE(1.0, "Stopping at goal, adjusting yaw: %.3f", local_goal_yaw);
      }
      // 2. 中距离：提前减速，最大速度随距离线性减小
      else if (dist_to_goal < 0.5) {   // 减速起始距离（可参数化）
        double max_vel = 0.1 + 0.5 * (dist_to_goal / 0.5);  // 0.1~0.6 m/s 线性插值
        double current_target_vel = std::min(TARGET_VELOCITY, max_vel);
        // 强制动态窗口最大速度不超过 current_target_vel
        dynamic_window.max_velocity = std::min(dynamic_window.max_velocity, current_target_vel);
        // 正常 DWA 规划
        std::vector<State> best_traj = dwa_planning(dynamic_window, goal, scan_points_, current_target_vel);
        if (!best_traj.empty()) {
          cmd_vel.linear.x = best_traj.back().velocity;
          cmd_vel.angular.z = best_traj.back().yawrate;
          visualize_trajectory(best_traj, 1.0, 0.0, 0.0, selected_trajectory_pub);
        } else {
          cmd_vel.linear.x = 0.05;
          cmd_vel.angular.z = 0.0;
        }
      }
      // 3. 远距离：正常 DWA
      else {
        double current_target_vel = TARGET_VELOCITY;
        // 原有的减速逻辑（当 dist_to_goal < GOAL_THRESHOLD*2 时仍生效，但此处已由新逻辑覆盖，可保留或移除）
        if (dist_to_goal < GOAL_THRESHOLD * 2.0) {
          current_target_vel *= (dist_to_goal / (GOAL_THRESHOLD * 2.0));
          dynamic_window.max_velocity = std::min(dynamic_window.max_velocity,
                                                 std::max(current_target_vel, 0.05));
        }
        std::vector<State> best_traj = dwa_planning(dynamic_window, goal, scan_points_, current_target_vel);
        if (!best_traj.empty()) {
          cmd_vel.linear.x = best_traj.back().velocity;
          cmd_vel.angular.z = best_traj.back().yawrate;
          visualize_trajectory(best_traj, 1.0, 0.0, 0.0, selected_trajectory_pub);
        } else {
          cmd_vel.linear.x = 0.05;
          cmd_vel.angular.z = 0.0;
        }
      }

      // 发布控制指令
      ROS_INFO_THROTTLE(1.0, "cmd_vel: v=%.3f, w=%.3f", cmd_vel.linear.x, cmd_vel.angular.z);
      chassCtlPub.publish(cmd_vel);
    } else {
      // 等待回调的警告...
    }

    ros::spinOnce();
    loop_rate.sleep();
  }
}

// ------------------------------------------------------------
// 辅助函数（无修改）
// ------------------------------------------------------------
std::vector<std::vector<float>> Differential_DWAPlanner::raycast() {
  return std::vector<std::vector<float>>();
}
void Differential_DWAPlanner::GetRobotVelocity(Vector3d, Vector3d, Vector3d&) {}
void Differential_DWAPlanner::Deal_Super_Circle(double*, double*) {}
double Differential_DWAPlanner::calVectorAngle(Vector2d, Vector2d) { return 0.0; }
Vector2d Differential_DWAPlanner::calUnitvector(Vector2d v) { return v; }
Vector2d Differential_DWAPlanner::caLocalGoalPosition(vector<Vector2d>, Vector2d, double) { return Vector2d(0,0); }
void Differential_DWAPlanner::LIMIT_VECTOR_Velocity(double &velocity, double &yawrate) {
  if(velocity > MAX_VELOCITY) velocity = MAX_VELOCITY;
  if(velocity < MIN_VELOCITY) velocity = MIN_VELOCITY;
  if(yawrate > MAX_YAWRATE) yawrate = MAX_YAWRATE;
  if(yawrate < -MAX_YAWRATE) yawrate = -MAX_YAWRATE;
}
double Differential_DWAPlanner::calPointLength(const Vector2d &a, const Vector2d &b) {
  return hypot(a[0]-b[0], a[1]-b[1]);
}
void Differential_DWAPlanner::visualize_trajectory(const std::vector<State> &trajectory,
                                                   const double r, const double g, const double b,
                                                   const ros::Publisher &pub) {
  visualization_msgs::Marker v_trajectory;
  v_trajectory.header.frame_id = ROBOT_FRAME;
  v_trajectory.header.stamp = ros::Time::now();
  v_trajectory.color.r = r; v_trajectory.color.g = g; v_trajectory.color.b = b;
  v_trajectory.color.a = 0.8;
  v_trajectory.ns = pub.getTopic();
  v_trajectory.type = visualization_msgs::Marker::LINE_STRIP;
  v_trajectory.action = visualization_msgs::Marker::ADD;
  v_trajectory.scale.x = 0.05;
  geometry_msgs::Pose pose; pose.orientation.w = 1.0; v_trajectory.pose = pose;

  nav_msgs::Path local_path;
  local_path.header.frame_id = ROBOT_FRAME;
  local_path.header.stamp = ros::Time::now();

  for (const auto &state : trajectory) {
    geometry_msgs::Point p; p.x = state.x; p.y = state.y;
    v_trajectory.points.push_back(p);

    geometry_msgs::PoseStamped ps;
    ps.pose.position.x = state.x; ps.pose.position.y = state.y;
    local_path.poses.push_back(ps);
  }
  pub.publish(v_trajectory);
  localPathPub.publish(local_path);
}

void Differential_DWAPlanner::visual_VisitedNode(ros::Publisher pathPublish,
                                                 std::vector<Eigen::Vector2d> visitnodes,
                                                 float a_set, float r_set, float g_set,
                                                 float b_set, float length) {
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
  for (const auto &pt : visitnodes) {
    geometry_msgs::Point p; p.x = pt[0]; p.y = pt[1];
    node_vis.points.push_back(p);
  }
  pathPublish.publish(node_vis);
}