cmake_minimum_required(VERSION 2.8.3)
project(viechle_urdf)
find_package(catkin REQUIRED COMPONENTS
  geometry_msgs
  sensor_msgs
  urdf
  tf
  rospy
  roscpp
  std_msgs
  roslaunch
)

include_directories( include
  ${catkin_INCLUDE_DIRS}
)
add_executable(parser src/parser.cpp)
target_link_libraries(parser ${catkin_LIBRARIES})

add_executable(viechle_state_publisher src/viechle_state_publisher.cpp)
target_link_libraries(viechle_state_publisher ${catkin_LIBRARIES})

roslaunch_add_file_check(launch)
