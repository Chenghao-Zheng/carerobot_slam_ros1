# Install script for directory: /home/ubuntu/carerobot_slam_ros1/src/robot_communication

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/ubuntu/carerobot_slam_ros1/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robot_communication/msg" TYPE FILE FILES
    "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/localizationInfoBroadcast.msg"
    "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/chassisControl.msg"
    "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/sensorData.msg"
    "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/Bspline.msg"
    "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/ESDFmap.msg"
    "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/msg/goal.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robot_communication/action" TYPE FILE FILES "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/action/DoDishes.action")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robot_communication/msg" TYPE FILE FILES
    "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesAction.msg"
    "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesActionGoal.msg"
    "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesActionResult.msg"
    "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesActionFeedback.msg"
    "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesGoal.msg"
    "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesResult.msg"
    "/home/ubuntu/carerobot_slam_ros1/devel/share/robot_communication/msg/DoDishesFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robot_communication/cmake" TYPE FILE FILES "/home/ubuntu/carerobot_slam_ros1/build/robot_communication/catkin_generated/installspace/robot_communication-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/ubuntu/carerobot_slam_ros1/devel/include/robot_communication")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/ubuntu/carerobot_slam_ros1/devel/share/roseus/ros/robot_communication")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/ubuntu/carerobot_slam_ros1/devel/share/common-lisp/ros/robot_communication")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/ubuntu/carerobot_slam_ros1/devel/share/gennodejs/ros/robot_communication")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/ubuntu/carerobot_slam_ros1/devel/lib/python3/dist-packages/robot_communication")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/ubuntu/carerobot_slam_ros1/devel/lib/python3/dist-packages/robot_communication")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/ubuntu/carerobot_slam_ros1/build/robot_communication/catkin_generated/installspace/robot_communication.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robot_communication/cmake" TYPE FILE FILES "/home/ubuntu/carerobot_slam_ros1/build/robot_communication/catkin_generated/installspace/robot_communication-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robot_communication/cmake" TYPE FILE FILES
    "/home/ubuntu/carerobot_slam_ros1/build/robot_communication/catkin_generated/installspace/robot_communicationConfig.cmake"
    "/home/ubuntu/carerobot_slam_ros1/build/robot_communication/catkin_generated/installspace/robot_communicationConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robot_communication" TYPE FILE FILES "/home/ubuntu/carerobot_slam_ros1/src/robot_communication/package.xml")
endif()

