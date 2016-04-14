cmake_minimum_required(VERSION 2.8.3)
project(obstacle_markers)


find_package(catkin REQUIRED COMPONENTS
  rospy
  std_msgs
  geometry_msgs
  visualization_msgs
  message_generation
  roslaunch
)

roslaunch_add_file_check(launch)

## Generate messages in the 'msg' folder
# add_message_files(
#   FILES
#   Message1.msg
#   Message2.msg
# )

## Generate services in the 'srv' folder
# add_service_files(
#   FILES
#   Service1.srv
#   Service2.srv
# )

## Generate actions in the 'action' folder
# add_action_files(
#   FILES
#   Action1.action
#   Action2.action
# )

## Generate added messages and services with any dependencies listed here
 generate_messages(
   DEPENDENCIES
   std_msgs geometry_msgs visualization_msgs # Or other packages containing msgs
 )



catkin_package(
#  INCLUDE_DIRS include
  LIBRARIES obstacle_markers
  CATKIN_DEPENDS rospy message_runtime std_msgs geometry_msgs visualization_msgs
  DEPENDS system_lib
)


include_directories(
  ${catkin_INCLUDE_DIRS}
)

