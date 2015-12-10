cmake_minimum_required(VERSION 2.8.3)
project(rfid)


find_package(catkin REQUIRED COMPONENTS
  message_generation
  rospy
  std_msgs
  roslaunch
  nav_msgs
  geometry_msgs
)

roslaunch_add_file_check(launch)

## Generate messages in the 'msg' folder
add_message_files(
  FILES
  TransferData.msg
  RFIDreadRow.msg
  rfid_odom.msg
  rfid_info.msg
 )

## Generate added messages and services with any dependencies listed here
generate_messages(
  DEPENDENCIES
  std_msgs nav_msgs geometry_msgs
)



catkin_package(
#INCLUDE_DIRS include
LIBRARIES rfid
CATKIN_DEPENDS rospy std_msgs message_runtime
DEPENDS system_lib
)

# include_directories(include)
include_directories(
  ${catkin_INCLUDE_DIRS}
)


 install(PROGRAMS
   rfid/src
   DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
 )

# Mark other files for installation (e.g. launch and bag files, etc.)
 install(FILES
  rfid_sensor.launch
   DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
 )


