cmake_minimum_required(VERSION 2.8.3)
project(obstacle_warning)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
)

catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES obstacle_detect
#  CATKIN_DEPENDS roscpp rospy std_msgs
#  DEPENDS system_lib
)


include_directories(
  ${catkin_INCLUDE_DIRS}
)



add_executable(detect src/detect.cpp)
target_link_libraries(detect ${catkin_LIBRARIES})
add_dependencies(detect obstacle_detect_generate_messages_cpp)
