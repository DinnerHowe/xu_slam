cmake_minimum_required(VERSION 2.8.3)
project(web_map)

find_package(catkin REQUIRED COMPONENTS rospy std_msgs geometry_msgs nav_msgs message_generation)

add_message_files(FILES web_map.msg web_odom.msg ort2D.msg)

generate_messages(DEPENDENCIES geometry_msgs nav_msgs std_msgs)

catkin_package(CATKIN_DEPENDS rospy geometry_msgs std_msgs message_runtime)

