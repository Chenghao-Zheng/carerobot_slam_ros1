cmake_minimum_required(VERSION 3.0.2)
project(diff_drive_gazebo)

#cmake 编译配置
SET(CMAKE_BUILD_TYPE "Release")
SET(CMAKE_CXX_FLAGS_RELEASE "$ENV{CXXFLAGS} -O3 -Wall")
add_compile_options(-std=c++14)
add_definitions(-std=c++14)

set( ROS_CXX_DEPENDENCIES
  gazebo_plugins
  gazebo_ros
  gazebo_ros_control
  geometry_msgs
  message_generation
  nav_msgs
  rosbag
  roscpp
  rospy
  sensor_msgs
  std_msgs
  std_srvs
  tf
  tf2
  tf2_geometry_msgs
  tf2_ros
  urdf
  visualization_msgs
  xacro
  map_server
)

find_package(catkin REQUIRED COMPONENTS ${ROS_CXX_DEPENDENCIES} )
include_directories(include ${catkin_INCLUDE_DIRS})
catkin_package()





