cmake_minimum_required(VERSION 2.8.3)
project(tf_nodes)


find_package(catkin REQUIRED COMPONENTS
  rospy
  tf
)


 add_message_files(
   FILES
   Pose.msg
 )

 add_service_files(
   FILES
   Kill.srv
   SetPen.srv
   Spawn.srv
   TeleportAbsolute.srv
   TeleportRelative.srv
 )

 generate_messages(
   DEPENDENCIES
   std_msgs tf # Or other packages containing msgs
 )


catkin_package(
  INCLUDE_DIRS include
  LIBRARIES tf_nodes
  CATKIN_DEPENDS rospy tf
  DEPENDS system_lib
)

include_directories(
  ${catkin_INCLUDE_DIRS}
)

