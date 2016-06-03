cmake_minimum_required(VERSION 2.8.3)
project(machine)

find_package(catkin REQUIRED COMPONENTS
  rospy
  roslaunch
)

catkin_package(
#  INCLUDE_DIRS include
  LIBRARIES machine
  CATKIN_DEPENDS rospy
  DEPENDS system_lib
)


include_directories(
  ${catkin_INCLUDE_DIRS}
)

