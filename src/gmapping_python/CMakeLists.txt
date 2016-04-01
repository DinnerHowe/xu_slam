cmake_minimum_required(VERSION 2.8.3)
project(gmapping_python)

find_package(catkin REQUIRED COMPONENTS
  message_generation
  nav_msgs
  rospy
  sensor_msgs
  std_msgs
  tf
)


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
   nav_msgs sensor_msgs std_msgs 
 )

################################################
## Declare ROS dynamic reconfigure parameters ##
################################################

## To declare and build dynamic reconfigure parameters within this
## package, follow these steps:
## * In the file package.xml:
##   * add a build_depend and a run_depend tag for "dynamic_reconfigure"
## * In this file (CMakeLists.txt):
##   * add "dynamic_reconfigure" to
##     find_package(catkin REQUIRED COMPONENTS ...)
##   * uncomment the "generate_dynamic_reconfigure_options" section below
##     and list every .cfg file to be processed

## Generate dynamic reconfigure parameters in the 'cfg' folder
# generate_dynamic_reconfigure_options(
#   cfg/DynReconf1.cfg
#   cfg/DynReconf2.cfg
# )


catkin_package(
  #INCLUDE_DIRS include
  LIBRARIES gmapping_python
  CATKIN_DEPENDS nav_msgs rospy sensor_msgs std_msgs tf message_runtime
  DEPENDS system_lib
)


include_directories(
  ${catkin_INCLUDE_DIRS}
)


