# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "robot_communication: 13 messages, 0 services")

set(MSG_I_FLAGS "-Irobot_communication:/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg;-Irobot_communication:/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Inav_msgs:/opt/ros/noetic/share/nav_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/noetic/share/actionlib_msgs/cmake/../msg;-Iactionlib:/opt/ros/noetic/share/actionlib/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(robot_communication_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/localizationInfoBroadcast.msg" NAME_WE)
add_custom_target(_robot_communication_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_communication" "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/localizationInfoBroadcast.msg" ""
)

get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/chassisControl.msg" NAME_WE)
add_custom_target(_robot_communication_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_communication" "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/chassisControl.msg" ""
)

get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/sensorData.msg" NAME_WE)
add_custom_target(_robot_communication_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_communication" "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/sensorData.msg" ""
)

get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/Bspline.msg" NAME_WE)
add_custom_target(_robot_communication_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_communication" "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/Bspline.msg" "geometry_msgs/Point"
)

get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/ESDFmap.msg" NAME_WE)
add_custom_target(_robot_communication_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_communication" "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/ESDFmap.msg" ""
)

get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/goal.msg" NAME_WE)
add_custom_target(_robot_communication_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_communication" "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/goal.msg" ""
)

get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesAction.msg" NAME_WE)
add_custom_target(_robot_communication_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_communication" "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesAction.msg" "robot_communication/DoDishesGoal:actionlib_msgs/GoalID:robot_communication/DoDishesActionResult:robot_communication/DoDishesResult:robot_communication/DoDishesActionFeedback:robot_communication/DoDishesFeedback:std_msgs/Header:actionlib_msgs/GoalStatus:robot_communication/DoDishesActionGoal"
)

get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesActionGoal.msg" NAME_WE)
add_custom_target(_robot_communication_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_communication" "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesActionGoal.msg" "robot_communication/DoDishesGoal:actionlib_msgs/GoalID:std_msgs/Header"
)

get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesActionResult.msg" NAME_WE)
add_custom_target(_robot_communication_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_communication" "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesActionResult.msg" "robot_communication/DoDishesResult:actionlib_msgs/GoalID:std_msgs/Header:actionlib_msgs/GoalStatus"
)

get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesActionFeedback.msg" NAME_WE)
add_custom_target(_robot_communication_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_communication" "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesActionFeedback.msg" "robot_communication/DoDishesFeedback:actionlib_msgs/GoalID:std_msgs/Header:actionlib_msgs/GoalStatus"
)

get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesGoal.msg" NAME_WE)
add_custom_target(_robot_communication_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_communication" "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesGoal.msg" ""
)

get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesResult.msg" NAME_WE)
add_custom_target(_robot_communication_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_communication" "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesResult.msg" ""
)

get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesFeedback.msg" NAME_WE)
add_custom_target(_robot_communication_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_communication" "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesFeedback.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/localizationInfoBroadcast.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_communication
)
_generate_msg_cpp(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/chassisControl.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_communication
)
_generate_msg_cpp(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/sensorData.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_communication
)
_generate_msg_cpp(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/Bspline.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_communication
)
_generate_msg_cpp(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/ESDFmap.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_communication
)
_generate_msg_cpp(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/goal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_communication
)
_generate_msg_cpp(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesAction.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesActionResult.msg;/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesResult.msg;/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesActionFeedback.msg;/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesActionGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_communication
)
_generate_msg_cpp(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_communication
)
_generate_msg_cpp(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_communication
)
_generate_msg_cpp(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_communication
)
_generate_msg_cpp(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_communication
)
_generate_msg_cpp(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_communication
)
_generate_msg_cpp(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_communication
)

### Generating Services

### Generating Module File
_generate_module_cpp(robot_communication
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_communication
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(robot_communication_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(robot_communication_generate_messages robot_communication_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/localizationInfoBroadcast.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_cpp _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/chassisControl.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_cpp _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/sensorData.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_cpp _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/Bspline.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_cpp _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/ESDFmap.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_cpp _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/goal.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_cpp _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesAction.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_cpp _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesActionGoal.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_cpp _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesActionResult.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_cpp _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesActionFeedback.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_cpp _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesGoal.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_cpp _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesResult.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_cpp _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesFeedback.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_cpp _robot_communication_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robot_communication_gencpp)
add_dependencies(robot_communication_gencpp robot_communication_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robot_communication_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/localizationInfoBroadcast.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_communication
)
_generate_msg_eus(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/chassisControl.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_communication
)
_generate_msg_eus(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/sensorData.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_communication
)
_generate_msg_eus(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/Bspline.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_communication
)
_generate_msg_eus(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/ESDFmap.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_communication
)
_generate_msg_eus(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/goal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_communication
)
_generate_msg_eus(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesAction.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesActionResult.msg;/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesResult.msg;/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesActionFeedback.msg;/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesActionGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_communication
)
_generate_msg_eus(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_communication
)
_generate_msg_eus(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_communication
)
_generate_msg_eus(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_communication
)
_generate_msg_eus(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_communication
)
_generate_msg_eus(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_communication
)
_generate_msg_eus(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_communication
)

### Generating Services

### Generating Module File
_generate_module_eus(robot_communication
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_communication
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(robot_communication_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(robot_communication_generate_messages robot_communication_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/localizationInfoBroadcast.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_eus _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/chassisControl.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_eus _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/sensorData.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_eus _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/Bspline.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_eus _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/ESDFmap.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_eus _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/goal.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_eus _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesAction.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_eus _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesActionGoal.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_eus _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesActionResult.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_eus _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesActionFeedback.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_eus _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesGoal.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_eus _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesResult.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_eus _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesFeedback.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_eus _robot_communication_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robot_communication_geneus)
add_dependencies(robot_communication_geneus robot_communication_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robot_communication_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/localizationInfoBroadcast.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_communication
)
_generate_msg_lisp(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/chassisControl.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_communication
)
_generate_msg_lisp(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/sensorData.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_communication
)
_generate_msg_lisp(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/Bspline.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_communication
)
_generate_msg_lisp(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/ESDFmap.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_communication
)
_generate_msg_lisp(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/goal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_communication
)
_generate_msg_lisp(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesAction.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesActionResult.msg;/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesResult.msg;/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesActionFeedback.msg;/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesActionGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_communication
)
_generate_msg_lisp(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_communication
)
_generate_msg_lisp(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_communication
)
_generate_msg_lisp(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_communication
)
_generate_msg_lisp(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_communication
)
_generate_msg_lisp(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_communication
)
_generate_msg_lisp(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_communication
)

### Generating Services

### Generating Module File
_generate_module_lisp(robot_communication
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_communication
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(robot_communication_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(robot_communication_generate_messages robot_communication_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/localizationInfoBroadcast.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_lisp _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/chassisControl.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_lisp _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/sensorData.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_lisp _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/Bspline.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_lisp _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/ESDFmap.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_lisp _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/goal.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_lisp _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesAction.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_lisp _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesActionGoal.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_lisp _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesActionResult.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_lisp _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesActionFeedback.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_lisp _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesGoal.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_lisp _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesResult.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_lisp _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesFeedback.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_lisp _robot_communication_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robot_communication_genlisp)
add_dependencies(robot_communication_genlisp robot_communication_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robot_communication_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/localizationInfoBroadcast.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_communication
)
_generate_msg_nodejs(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/chassisControl.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_communication
)
_generate_msg_nodejs(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/sensorData.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_communication
)
_generate_msg_nodejs(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/Bspline.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_communication
)
_generate_msg_nodejs(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/ESDFmap.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_communication
)
_generate_msg_nodejs(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/goal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_communication
)
_generate_msg_nodejs(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesAction.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesActionResult.msg;/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesResult.msg;/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesActionFeedback.msg;/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesActionGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_communication
)
_generate_msg_nodejs(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_communication
)
_generate_msg_nodejs(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_communication
)
_generate_msg_nodejs(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_communication
)
_generate_msg_nodejs(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_communication
)
_generate_msg_nodejs(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_communication
)
_generate_msg_nodejs(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_communication
)

### Generating Services

### Generating Module File
_generate_module_nodejs(robot_communication
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_communication
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(robot_communication_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(robot_communication_generate_messages robot_communication_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/localizationInfoBroadcast.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_nodejs _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/chassisControl.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_nodejs _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/sensorData.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_nodejs _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/Bspline.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_nodejs _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/ESDFmap.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_nodejs _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/goal.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_nodejs _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesAction.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_nodejs _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesActionGoal.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_nodejs _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesActionResult.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_nodejs _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesActionFeedback.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_nodejs _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesGoal.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_nodejs _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesResult.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_nodejs _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesFeedback.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_nodejs _robot_communication_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robot_communication_gennodejs)
add_dependencies(robot_communication_gennodejs robot_communication_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robot_communication_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/localizationInfoBroadcast.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_communication
)
_generate_msg_py(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/chassisControl.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_communication
)
_generate_msg_py(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/sensorData.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_communication
)
_generate_msg_py(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/Bspline.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_communication
)
_generate_msg_py(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/ESDFmap.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_communication
)
_generate_msg_py(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/goal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_communication
)
_generate_msg_py(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesAction.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesActionResult.msg;/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesResult.msg;/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesActionFeedback.msg;/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesActionGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_communication
)
_generate_msg_py(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_communication
)
_generate_msg_py(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_communication
)
_generate_msg_py(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_communication
)
_generate_msg_py(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_communication
)
_generate_msg_py(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_communication
)
_generate_msg_py(robot_communication
  "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_communication
)

### Generating Services

### Generating Module File
_generate_module_py(robot_communication
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_communication
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(robot_communication_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(robot_communication_generate_messages robot_communication_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/localizationInfoBroadcast.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_py _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/chassisControl.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_py _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/sensorData.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_py _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/Bspline.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_py _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/ESDFmap.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_py _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/goal.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_py _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesAction.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_py _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesActionGoal.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_py _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesActionResult.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_py _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesActionFeedback.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_py _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesGoal.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_py _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesResult.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_py _robot_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesFeedback.msg" NAME_WE)
add_dependencies(robot_communication_generate_messages_py _robot_communication_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robot_communication_genpy)
add_dependencies(robot_communication_genpy robot_communication_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robot_communication_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_communication)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_communication
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(robot_communication_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(robot_communication_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET nav_msgs_generate_messages_cpp)
  add_dependencies(robot_communication_generate_messages_cpp nav_msgs_generate_messages_cpp)
endif()
if(TARGET actionlib_msgs_generate_messages_cpp)
  add_dependencies(robot_communication_generate_messages_cpp actionlib_msgs_generate_messages_cpp)
endif()
if(TARGET actionlib_generate_messages_cpp)
  add_dependencies(robot_communication_generate_messages_cpp actionlib_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_communication)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_communication
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(robot_communication_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(robot_communication_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET nav_msgs_generate_messages_eus)
  add_dependencies(robot_communication_generate_messages_eus nav_msgs_generate_messages_eus)
endif()
if(TARGET actionlib_msgs_generate_messages_eus)
  add_dependencies(robot_communication_generate_messages_eus actionlib_msgs_generate_messages_eus)
endif()
if(TARGET actionlib_generate_messages_eus)
  add_dependencies(robot_communication_generate_messages_eus actionlib_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_communication)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_communication
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(robot_communication_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(robot_communication_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET nav_msgs_generate_messages_lisp)
  add_dependencies(robot_communication_generate_messages_lisp nav_msgs_generate_messages_lisp)
endif()
if(TARGET actionlib_msgs_generate_messages_lisp)
  add_dependencies(robot_communication_generate_messages_lisp actionlib_msgs_generate_messages_lisp)
endif()
if(TARGET actionlib_generate_messages_lisp)
  add_dependencies(robot_communication_generate_messages_lisp actionlib_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_communication)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_communication
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(robot_communication_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(robot_communication_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET nav_msgs_generate_messages_nodejs)
  add_dependencies(robot_communication_generate_messages_nodejs nav_msgs_generate_messages_nodejs)
endif()
if(TARGET actionlib_msgs_generate_messages_nodejs)
  add_dependencies(robot_communication_generate_messages_nodejs actionlib_msgs_generate_messages_nodejs)
endif()
if(TARGET actionlib_generate_messages_nodejs)
  add_dependencies(robot_communication_generate_messages_nodejs actionlib_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_communication)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_communication\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_communication
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(robot_communication_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(robot_communication_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET nav_msgs_generate_messages_py)
  add_dependencies(robot_communication_generate_messages_py nav_msgs_generate_messages_py)
endif()
if(TARGET actionlib_msgs_generate_messages_py)
  add_dependencies(robot_communication_generate_messages_py actionlib_msgs_generate_messages_py)
endif()
if(TARGET actionlib_generate_messages_py)
  add_dependencies(robot_communication_generate_messages_py actionlib_generate_messages_py)
endif()
