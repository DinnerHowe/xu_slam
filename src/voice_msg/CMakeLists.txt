cmake_minimum_required(VERSION 2.8.3)
project(voice_msg)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  tf
 message_generation
)

add_message_files(FILES Command.msg Motion.msg Navigation.msg Transmit.msg recog_result.msg)


 generate_messages(
   DEPENDENCIES
   std_msgs
   voice_msg 
 )

catkin_package(
  LIBRARIES base_motion_module
  CATKIN_DEPENDS roscpp rospy tf  message_runtime
  DEPENDS system_lib
)

include_directories(
  ${catkin_INCLUDE_DIRS}
)

