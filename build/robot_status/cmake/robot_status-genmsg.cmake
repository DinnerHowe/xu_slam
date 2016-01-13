# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "robot_status: 3 messages, 1 services")

set(MSG_I_FLAGS "-Irobot_status:/home/turtlebot2/xu_slam/src/robot_status/msg;-Igeometry_msgs:/opt/ros/indigo/share/geometry_msgs/cmake/../msg;-Inav_msgs:/opt/ros/indigo/share/nav_msgs/cmake/../msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/indigo/share/actionlib_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(robot_status_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/turtlebot2/xu_slam/src/robot_status/msg/mapdata.msg" NAME_WE)
add_custom_target(_robot_status_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_status" "/home/turtlebot2/xu_slam/src/robot_status/msg/mapdata.msg" "geometry_msgs/Point:robot_status/robot_odom:std_msgs/Header:geometry_msgs/Quaternion:nav_msgs/OccupancyGrid:nav_msgs/MapMetaData:geometry_msgs/Pose"
)

get_filename_component(_filename "/home/turtlebot2/xu_slam/src/robot_status/msg/robot_odom.msg" NAME_WE)
add_custom_target(_robot_status_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_status" "/home/turtlebot2/xu_slam/src/robot_status/msg/robot_odom.msg" "geometry_msgs/Quaternion:std_msgs/Header:geometry_msgs/Point"
)

get_filename_component(_filename "/home/turtlebot2/xu_slam/src/robot_status/srv/launch_amcl.srv" NAME_WE)
add_custom_target(_robot_status_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_status" "/home/turtlebot2/xu_slam/src/robot_status/srv/launch_amcl.srv" ""
)

get_filename_component(_filename "/home/turtlebot2/xu_slam/src/robot_status/msg/map_odom.msg" NAME_WE)
add_custom_target(_robot_status_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_status" "/home/turtlebot2/xu_slam/src/robot_status/msg/map_odom.msg" "geometry_msgs/Quaternion:geometry_msgs/Point:geometry_msgs/Pose"
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(robot_status
  "/home/turtlebot2/xu_slam/src/robot_status/msg/mapdata.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/home/turtlebot2/xu_slam/src/robot_status/msg/robot_odom.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/nav_msgs/cmake/../msg/OccupancyGrid.msg;/opt/ros/indigo/share/nav_msgs/cmake/../msg/MapMetaData.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_status
)
_generate_msg_cpp(robot_status
  "/home/turtlebot2/xu_slam/src/robot_status/msg/robot_odom.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_status
)
_generate_msg_cpp(robot_status
  "/home/turtlebot2/xu_slam/src/robot_status/msg/map_odom.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_status
)

### Generating Services
_generate_srv_cpp(robot_status
  "/home/turtlebot2/xu_slam/src/robot_status/srv/launch_amcl.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_status
)

### Generating Module File
_generate_module_cpp(robot_status
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_status
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(robot_status_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(robot_status_generate_messages robot_status_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/turtlebot2/xu_slam/src/robot_status/msg/mapdata.msg" NAME_WE)
add_dependencies(robot_status_generate_messages_cpp _robot_status_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot2/xu_slam/src/robot_status/msg/robot_odom.msg" NAME_WE)
add_dependencies(robot_status_generate_messages_cpp _robot_status_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot2/xu_slam/src/robot_status/srv/launch_amcl.srv" NAME_WE)
add_dependencies(robot_status_generate_messages_cpp _robot_status_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot2/xu_slam/src/robot_status/msg/map_odom.msg" NAME_WE)
add_dependencies(robot_status_generate_messages_cpp _robot_status_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robot_status_gencpp)
add_dependencies(robot_status_gencpp robot_status_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robot_status_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(robot_status
  "/home/turtlebot2/xu_slam/src/robot_status/msg/mapdata.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/home/turtlebot2/xu_slam/src/robot_status/msg/robot_odom.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/nav_msgs/cmake/../msg/OccupancyGrid.msg;/opt/ros/indigo/share/nav_msgs/cmake/../msg/MapMetaData.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_status
)
_generate_msg_lisp(robot_status
  "/home/turtlebot2/xu_slam/src/robot_status/msg/robot_odom.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_status
)
_generate_msg_lisp(robot_status
  "/home/turtlebot2/xu_slam/src/robot_status/msg/map_odom.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_status
)

### Generating Services
_generate_srv_lisp(robot_status
  "/home/turtlebot2/xu_slam/src/robot_status/srv/launch_amcl.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_status
)

### Generating Module File
_generate_module_lisp(robot_status
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_status
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(robot_status_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(robot_status_generate_messages robot_status_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/turtlebot2/xu_slam/src/robot_status/msg/mapdata.msg" NAME_WE)
add_dependencies(robot_status_generate_messages_lisp _robot_status_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot2/xu_slam/src/robot_status/msg/robot_odom.msg" NAME_WE)
add_dependencies(robot_status_generate_messages_lisp _robot_status_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot2/xu_slam/src/robot_status/srv/launch_amcl.srv" NAME_WE)
add_dependencies(robot_status_generate_messages_lisp _robot_status_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot2/xu_slam/src/robot_status/msg/map_odom.msg" NAME_WE)
add_dependencies(robot_status_generate_messages_lisp _robot_status_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robot_status_genlisp)
add_dependencies(robot_status_genlisp robot_status_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robot_status_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(robot_status
  "/home/turtlebot2/xu_slam/src/robot_status/msg/mapdata.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/home/turtlebot2/xu_slam/src/robot_status/msg/robot_odom.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/nav_msgs/cmake/../msg/OccupancyGrid.msg;/opt/ros/indigo/share/nav_msgs/cmake/../msg/MapMetaData.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_status
)
_generate_msg_py(robot_status
  "/home/turtlebot2/xu_slam/src/robot_status/msg/robot_odom.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_status
)
_generate_msg_py(robot_status
  "/home/turtlebot2/xu_slam/src/robot_status/msg/map_odom.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_status
)

### Generating Services
_generate_srv_py(robot_status
  "/home/turtlebot2/xu_slam/src/robot_status/srv/launch_amcl.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_status
)

### Generating Module File
_generate_module_py(robot_status
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_status
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(robot_status_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(robot_status_generate_messages robot_status_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/turtlebot2/xu_slam/src/robot_status/msg/mapdata.msg" NAME_WE)
add_dependencies(robot_status_generate_messages_py _robot_status_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot2/xu_slam/src/robot_status/msg/robot_odom.msg" NAME_WE)
add_dependencies(robot_status_generate_messages_py _robot_status_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot2/xu_slam/src/robot_status/srv/launch_amcl.srv" NAME_WE)
add_dependencies(robot_status_generate_messages_py _robot_status_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot2/xu_slam/src/robot_status/msg/map_odom.msg" NAME_WE)
add_dependencies(robot_status_generate_messages_py _robot_status_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robot_status_genpy)
add_dependencies(robot_status_genpy robot_status_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robot_status_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_status)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_status
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(robot_status_generate_messages_cpp geometry_msgs_generate_messages_cpp)
add_dependencies(robot_status_generate_messages_cpp nav_msgs_generate_messages_cpp)
add_dependencies(robot_status_generate_messages_cpp std_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_status)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_status
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(robot_status_generate_messages_lisp geometry_msgs_generate_messages_lisp)
add_dependencies(robot_status_generate_messages_lisp nav_msgs_generate_messages_lisp)
add_dependencies(robot_status_generate_messages_lisp std_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_status)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_status\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_status
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(robot_status_generate_messages_py geometry_msgs_generate_messages_py)
add_dependencies(robot_status_generate_messages_py nav_msgs_generate_messages_py)
add_dependencies(robot_status_generate_messages_py std_msgs_generate_messages_py)
