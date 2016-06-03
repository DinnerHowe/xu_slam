cmake_minimum_required(VERSION 2.8.3)
project(amcl_python)

find_package(catkin REQUIRED COMPONENTS
  rospy
  tf
  dynamic_reconfigure
  nav_msgs
)

find_package(Boost REQUIRED)

catkin_package(
#  INCLUDE_DIRS include
  LIBRARIES amcl_python
  CATKIN_DEPENDS rospy tf dynamic_reconfigure
  DEPENDS system_lib
)

include_directories(
  ${catkin_INCLUDE_DIRS}
)

