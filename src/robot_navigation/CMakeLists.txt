cmake_minimum_required(VERSION 3.0.2)   #定义cmake需求版本和工程名称
project(robot_navigation)

#cmake 编译配置
SET(CMAKE_BUILD_TYPE "Release")
SET(CMAKE_CXX_FLAGS_RELEASE "$ENV{CXXFLAGS} -O3 -Wall")
add_compile_options(-std=c++14)
add_definitions(-std=c++14)

#第三方库配置
set(THIRD_PART_LIBRARIES "")

include(cmake/eigen.cmake)

# ROS配置
set(  ROS_CXX_DEPENDENCIES
  geometry_msgs
  nav_msgs
  roscpp
  rospy
  sensor_msgs
  std_msgs
  tf
  tf2
  tf2_geometry_msgs
  tf2_ros
  tf2_sensor_msgs
  pcl_conversions
  pcl_ros
  visualization_msgs
  robot_communication #添加自定义通讯包
  message_generation
  robot_costmap
)

find_package(catkin REQUIRED COMPONENTS ${ROS_CXX_DEPENDENCIES} )
find_package( OpenCV REQUIRED ) 

include_directories(include ${catkin_INCLUDE_DIRS})

catkin_package(
 INCLUDE_DIRS include
 CATKIN_DEPENDS robot_costmap
#  DEPENDS system_lib
)  

#自定义库设置
file(GLOB_RECURSE ALL_SRCS "*.cpp")
file(GLOB_RECURSE NODE_SRCS "src/nodes/*_node.cpp")
list(REMOVE_ITEM ALL_SRCS ${NODE_SRCS})           #当有多个node 文件的时候使用这句话


# 差速DWA 测试节点
# add_executable(Differential_DWA_node src/nodes/differential_DWA_node.cpp ${ALL_SRCS} )
# target_link_libraries(Differential_DWA_node 
#   ${catkin_LIBRARIES} 
#   /usr/local/lib/libnlopt.so 
#   ${THIRD_PART_LIBRARIES}
#   ${OpenCV_LIBS}
#   )

# 规划节点
add_executable(motionPlan_node src/nodes/motionPlan_node.cpp ${ALL_SRCS} )
target_link_libraries(motionPlan_node 
  ${catkin_LIBRARIES} 
  /usr/local/lib/libnlopt.so 
  ${THIRD_PART_LIBRARIES}
  ${OpenCV_LIBS}
  )

# 差速DWA 测试节点
add_executable(Differential_DWA_node src/nodes/differential_DWA_node.cpp ${ALL_SRCS} )
target_link_libraries(Differential_DWA_node 
  ${catkin_LIBRARIES} 
  /usr/local/lib/libnlopt.so 
  ${THIRD_PART_LIBRARIES}
  ${OpenCV_LIBS}
  )
