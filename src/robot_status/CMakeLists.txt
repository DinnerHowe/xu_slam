cmake_minimum_required(VERSION 2.8.3)
project(robot_status)

find_package(catkin REQUIRED COMPONENTS rospy std_msgs geometry_msgs nav_msgs tf message_generation)

add_message_files(FILES robot_odom.msg map_odom.msg mapdata.msg)

add_service_files(FILES launch_amcl.srv)

generate_messages(DEPENDENCIES geometry_msgs nav_msgs std_msgs)

catkin_package(CATKIN_DEPENDS rospy tf geometry_msgs std_msgs  message_runtime)

