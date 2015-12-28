cmake_minimum_required(VERSION 2.8.3)
project(cruise)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  tf
 message_generation
)

roslaunch_add_file_check(launch)

 generate_messages(
   DEPENDENCIES
   std_msgs  # Or other packages containing msgs
 )

catkin_package(
  LIBRARIES base_motion_module
  CATKIN_DEPENDS roscpp rospy tf  message_runtime
  DEPENDS system_lib
)

include_directories(
  ${catkin_INCLUDE_DIRS}
)


