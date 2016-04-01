cmake_minimum_required(VERSION 2.8.3)
project(marker)

find_package(catkin REQUIRED COMPONENTS
  rospy
  std_msgs
  geometry_msgs
  visualization_msgs
  message_generation
)


 generate_messages(
   DEPENDENCIES
   std_msgs geometry_msgs visualization_msgs# Or other packages containing msgs
 )


catkin_package(
#  INCLUDE_DIRS include
  LIBRARIES marker
  CATKIN_DEPENDS rospy message_runtime std_msgs geometry_msgs visualization_msgs
  DEPENDS system_lib
)

include_directories(
  ${catkin_INCLUDE_DIRS}
)

