#!/usr/bin/env bash
source ~/.bashrc

set -e

# 1) 清理旧进程（允许失败）
rosnode kill -a 2>/dev/null || true
killall -9 gzserver gzclient 2>/dev/null || true
killall -9 roscore rosmaster 2>/dev/null || true

yes | rosclean purge

sleep 2

# 2) 启动 roscore
#ros_term "roscore" "roscore"
gnome-terminal --title="roscore" -- bash -c "roscore"

# 等待 roscore 就绪
until rostopic list >/dev/null 2>&1; do
  sleep 0.2
done

# 3) 启动 Gazebo + robot
gnome-terminal --title="gazebo_start" -- bash -c "source ~/carerobot_slam_ros1/devel/setup.bash; roslaunch diff_drive_gazebo sim_gazebo_rviz.launch"

# 等待 Gazebo 节点起来（/gazebo/model_states 出现再继续）
until rostopic list 2>/dev/null | grep -q "/gazebo/model_states"; do
  sleep 1.5
done

# 5）启动地图节点
gnome-terminal -t "map start" -- bash -lc "source ~/carerobot_slam_ros1/devel/setup.bash; roslaunch robot_costmap map_deal.launch;exec bash"

# 6) 运动规划节点
gnome-terminal -t "motion Plan start" -- bash -lc "source ~/carerobot_slam_ros1/devel/setup.bash; roslaunch robot_navigation motionPlan_sim.launch"

# 7) 雷达点云转换成point-cloud2
gnome-terminal -t "laser to cloud" -- bash -lc "source ~/carerobot_slam_ros1/devel/setup.bash; roslaunch read_laser_data laser_to_cloud.launch; exec bash"

# 8）局部规划d算法***********
# gnome-terminal -t "PID_control" -- bash -c \
# "source ~/carerobot_slam_ros1/devel/setup.bash; 
# roslaunch robot_pid_local_planner differential_PID.launch; exec bash"

gnome-terminal -t "PID_control" -- bash -c \
"source ~/carerobot_slam_ros1/devel/setup.bash; 
roslaunch robot_navigation Differential_DWA.launch; exec bash"


### 当重新编译工作空间的时候，需要先编译通信包catkin_make --pkg robot_communication