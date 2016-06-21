cmake_minimum_required(VERSION 2.8.3)
project(actionlib_python)

find_package(catkin REQUIRED COMPONENTS
  rospy
  message_generation 
  std_msgs
)

## Generate messages in the 'msg' folder
 add_message_files(
   FILES
   GoalID.msg
   GoalStatus.msg
   GoalStatusArray.msg
 )

## Generate added messages and services with any dependencies listed here
 generate_messages(
   DEPENDENCIES
   std_msgs  # Or other packages containing msgs
 )

catkin_package(
#  INCLUDE_DIRS include
  LIBRARIES actionlib_python
  CATKIN_DEPENDS rospy message_runtime std_msgs
  DEPENDS system_lib
)

include_directories(
  ${catkin_INCLUDE_DIRS}
)

