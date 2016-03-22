# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "web_map: 3 messages, 0 services")

set(MSG_I_FLAGS "-Iweb_map:/home/turtlebot/xu_slam/src/web_map/msg;-Igeometry_msgs:/opt/ros/indigo/share/geometry_msgs/cmake/../msg;-Inav_msgs:/opt/ros/indigo/share/nav_msgs/cmake/../msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/indigo/share/actionlib_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(web_map_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/turtlebot/xu_slam/src/web_map/msg/web_odom.msg" NAME_WE)
add_custom_target(_web_map_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "web_map" "/home/turtlebot/xu_slam/src/web_map/msg/web_odom.msg" "web_map/ort2D:geometry_msgs/Pose2D"
)

get_filename_component(_filename "/home/turtlebot/xu_slam/src/web_map/msg/ort2D.msg" NAME_WE)
add_custom_target(_web_map_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "web_map" "/home/turtlebot/xu_slam/src/web_map/msg/ort2D.msg" ""
)

get_filename_component(_filename "/home/turtlebot/xu_slam/src/web_map/msg/web_map.msg" NAME_WE)
add_custom_target(_web_map_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "web_map" "/home/turtlebot/xu_slam/src/web_map/msg/web_map.msg" ""
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(web_map
  "/home/turtlebot/xu_slam/src/web_map/msg/web_odom.msg"
  "${MSG_I_FLAGS}"
  "/home/turtlebot/xu_slam/src/web_map/msg/ort2D.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/web_map
)
_generate_msg_cpp(web_map
  "/home/turtlebot/xu_slam/src/web_map/msg/ort2D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/web_map
)
_generate_msg_cpp(web_map
  "/home/turtlebot/xu_slam/src/web_map/msg/web_map.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/web_map
)

### Generating Services

### Generating Module File
_generate_module_cpp(web_map
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/web_map
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(web_map_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(web_map_generate_messages web_map_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/turtlebot/xu_slam/src/web_map/msg/web_odom.msg" NAME_WE)
add_dependencies(web_map_generate_messages_cpp _web_map_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot/xu_slam/src/web_map/msg/ort2D.msg" NAME_WE)
add_dependencies(web_map_generate_messages_cpp _web_map_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot/xu_slam/src/web_map/msg/web_map.msg" NAME_WE)
add_dependencies(web_map_generate_messages_cpp _web_map_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(web_map_gencpp)
add_dependencies(web_map_gencpp web_map_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS web_map_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(web_map
  "/home/turtlebot/xu_slam/src/web_map/msg/web_odom.msg"
  "${MSG_I_FLAGS}"
  "/home/turtlebot/xu_slam/src/web_map/msg/ort2D.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/web_map
)
_generate_msg_lisp(web_map
  "/home/turtlebot/xu_slam/src/web_map/msg/ort2D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/web_map
)
_generate_msg_lisp(web_map
  "/home/turtlebot/xu_slam/src/web_map/msg/web_map.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/web_map
)

### Generating Services

### Generating Module File
_generate_module_lisp(web_map
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/web_map
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(web_map_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(web_map_generate_messages web_map_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/turtlebot/xu_slam/src/web_map/msg/web_odom.msg" NAME_WE)
add_dependencies(web_map_generate_messages_lisp _web_map_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot/xu_slam/src/web_map/msg/ort2D.msg" NAME_WE)
add_dependencies(web_map_generate_messages_lisp _web_map_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot/xu_slam/src/web_map/msg/web_map.msg" NAME_WE)
add_dependencies(web_map_generate_messages_lisp _web_map_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(web_map_genlisp)
add_dependencies(web_map_genlisp web_map_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS web_map_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(web_map
  "/home/turtlebot/xu_slam/src/web_map/msg/web_odom.msg"
  "${MSG_I_FLAGS}"
  "/home/turtlebot/xu_slam/src/web_map/msg/ort2D.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/web_map
)
_generate_msg_py(web_map
  "/home/turtlebot/xu_slam/src/web_map/msg/ort2D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/web_map
)
_generate_msg_py(web_map
  "/home/turtlebot/xu_slam/src/web_map/msg/web_map.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/web_map
)

### Generating Services

### Generating Module File
_generate_module_py(web_map
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/web_map
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(web_map_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(web_map_generate_messages web_map_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/turtlebot/xu_slam/src/web_map/msg/web_odom.msg" NAME_WE)
add_dependencies(web_map_generate_messages_py _web_map_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot/xu_slam/src/web_map/msg/ort2D.msg" NAME_WE)
add_dependencies(web_map_generate_messages_py _web_map_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot/xu_slam/src/web_map/msg/web_map.msg" NAME_WE)
add_dependencies(web_map_generate_messages_py _web_map_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(web_map_genpy)
add_dependencies(web_map_genpy web_map_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS web_map_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/web_map)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/web_map
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(web_map_generate_messages_cpp geometry_msgs_generate_messages_cpp)
add_dependencies(web_map_generate_messages_cpp nav_msgs_generate_messages_cpp)
add_dependencies(web_map_generate_messages_cpp std_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/web_map)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/web_map
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(web_map_generate_messages_lisp geometry_msgs_generate_messages_lisp)
add_dependencies(web_map_generate_messages_lisp nav_msgs_generate_messages_lisp)
add_dependencies(web_map_generate_messages_lisp std_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/web_map)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/web_map\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/web_map
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(web_map_generate_messages_py geometry_msgs_generate_messages_py)
add_dependencies(web_map_generate_messages_py nav_msgs_generate_messages_py)
add_dependencies(web_map_generate_messages_py std_msgs_generate_messages_py)
