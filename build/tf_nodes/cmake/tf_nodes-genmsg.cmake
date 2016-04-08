# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "tf_nodes: 1 messages, 5 services")

set(MSG_I_FLAGS "-Itf_nodes:/home/turtlebot/xu_slam/src/tf_nodes/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg;-Itf:/opt/ros/indigo/share/tf/cmake/../msg;-Igeometry_msgs:/opt/ros/indigo/share/geometry_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/indigo/share/sensor_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(tf_nodes_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/turtlebot/xu_slam/src/tf_nodes/srv/SetPen.srv" NAME_WE)
add_custom_target(_tf_nodes_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "tf_nodes" "/home/turtlebot/xu_slam/src/tf_nodes/srv/SetPen.srv" ""
)

get_filename_component(_filename "/home/turtlebot/xu_slam/src/tf_nodes/srv/TeleportAbsolute.srv" NAME_WE)
add_custom_target(_tf_nodes_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "tf_nodes" "/home/turtlebot/xu_slam/src/tf_nodes/srv/TeleportAbsolute.srv" ""
)

get_filename_component(_filename "/home/turtlebot/xu_slam/src/tf_nodes/srv/Spawn.srv" NAME_WE)
add_custom_target(_tf_nodes_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "tf_nodes" "/home/turtlebot/xu_slam/src/tf_nodes/srv/Spawn.srv" ""
)

get_filename_component(_filename "/home/turtlebot/xu_slam/src/tf_nodes/srv/TeleportRelative.srv" NAME_WE)
add_custom_target(_tf_nodes_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "tf_nodes" "/home/turtlebot/xu_slam/src/tf_nodes/srv/TeleportRelative.srv" ""
)

get_filename_component(_filename "/home/turtlebot/xu_slam/src/tf_nodes/srv/Kill.srv" NAME_WE)
add_custom_target(_tf_nodes_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "tf_nodes" "/home/turtlebot/xu_slam/src/tf_nodes/srv/Kill.srv" ""
)

get_filename_component(_filename "/home/turtlebot/xu_slam/src/tf_nodes/msg/Pose.msg" NAME_WE)
add_custom_target(_tf_nodes_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "tf_nodes" "/home/turtlebot/xu_slam/src/tf_nodes/msg/Pose.msg" ""
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(tf_nodes
  "/home/turtlebot/xu_slam/src/tf_nodes/msg/Pose.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tf_nodes
)

### Generating Services
_generate_srv_cpp(tf_nodes
  "/home/turtlebot/xu_slam/src/tf_nodes/srv/SetPen.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tf_nodes
)
_generate_srv_cpp(tf_nodes
  "/home/turtlebot/xu_slam/src/tf_nodes/srv/TeleportAbsolute.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tf_nodes
)
_generate_srv_cpp(tf_nodes
  "/home/turtlebot/xu_slam/src/tf_nodes/srv/Kill.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tf_nodes
)
_generate_srv_cpp(tf_nodes
  "/home/turtlebot/xu_slam/src/tf_nodes/srv/TeleportRelative.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tf_nodes
)
_generate_srv_cpp(tf_nodes
  "/home/turtlebot/xu_slam/src/tf_nodes/srv/Spawn.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tf_nodes
)

### Generating Module File
_generate_module_cpp(tf_nodes
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tf_nodes
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(tf_nodes_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(tf_nodes_generate_messages tf_nodes_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/turtlebot/xu_slam/src/tf_nodes/srv/SetPen.srv" NAME_WE)
add_dependencies(tf_nodes_generate_messages_cpp _tf_nodes_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot/xu_slam/src/tf_nodes/srv/TeleportAbsolute.srv" NAME_WE)
add_dependencies(tf_nodes_generate_messages_cpp _tf_nodes_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot/xu_slam/src/tf_nodes/srv/Spawn.srv" NAME_WE)
add_dependencies(tf_nodes_generate_messages_cpp _tf_nodes_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot/xu_slam/src/tf_nodes/srv/TeleportRelative.srv" NAME_WE)
add_dependencies(tf_nodes_generate_messages_cpp _tf_nodes_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot/xu_slam/src/tf_nodes/srv/Kill.srv" NAME_WE)
add_dependencies(tf_nodes_generate_messages_cpp _tf_nodes_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot/xu_slam/src/tf_nodes/msg/Pose.msg" NAME_WE)
add_dependencies(tf_nodes_generate_messages_cpp _tf_nodes_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(tf_nodes_gencpp)
add_dependencies(tf_nodes_gencpp tf_nodes_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS tf_nodes_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(tf_nodes
  "/home/turtlebot/xu_slam/src/tf_nodes/msg/Pose.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tf_nodes
)

### Generating Services
_generate_srv_lisp(tf_nodes
  "/home/turtlebot/xu_slam/src/tf_nodes/srv/SetPen.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tf_nodes
)
_generate_srv_lisp(tf_nodes
  "/home/turtlebot/xu_slam/src/tf_nodes/srv/TeleportAbsolute.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tf_nodes
)
_generate_srv_lisp(tf_nodes
  "/home/turtlebot/xu_slam/src/tf_nodes/srv/Kill.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tf_nodes
)
_generate_srv_lisp(tf_nodes
  "/home/turtlebot/xu_slam/src/tf_nodes/srv/TeleportRelative.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tf_nodes
)
_generate_srv_lisp(tf_nodes
  "/home/turtlebot/xu_slam/src/tf_nodes/srv/Spawn.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tf_nodes
)

### Generating Module File
_generate_module_lisp(tf_nodes
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tf_nodes
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(tf_nodes_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(tf_nodes_generate_messages tf_nodes_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/turtlebot/xu_slam/src/tf_nodes/srv/SetPen.srv" NAME_WE)
add_dependencies(tf_nodes_generate_messages_lisp _tf_nodes_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot/xu_slam/src/tf_nodes/srv/TeleportAbsolute.srv" NAME_WE)
add_dependencies(tf_nodes_generate_messages_lisp _tf_nodes_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot/xu_slam/src/tf_nodes/srv/Spawn.srv" NAME_WE)
add_dependencies(tf_nodes_generate_messages_lisp _tf_nodes_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot/xu_slam/src/tf_nodes/srv/TeleportRelative.srv" NAME_WE)
add_dependencies(tf_nodes_generate_messages_lisp _tf_nodes_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot/xu_slam/src/tf_nodes/srv/Kill.srv" NAME_WE)
add_dependencies(tf_nodes_generate_messages_lisp _tf_nodes_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot/xu_slam/src/tf_nodes/msg/Pose.msg" NAME_WE)
add_dependencies(tf_nodes_generate_messages_lisp _tf_nodes_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(tf_nodes_genlisp)
add_dependencies(tf_nodes_genlisp tf_nodes_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS tf_nodes_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(tf_nodes
  "/home/turtlebot/xu_slam/src/tf_nodes/msg/Pose.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tf_nodes
)

### Generating Services
_generate_srv_py(tf_nodes
  "/home/turtlebot/xu_slam/src/tf_nodes/srv/SetPen.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tf_nodes
)
_generate_srv_py(tf_nodes
  "/home/turtlebot/xu_slam/src/tf_nodes/srv/TeleportAbsolute.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tf_nodes
)
_generate_srv_py(tf_nodes
  "/home/turtlebot/xu_slam/src/tf_nodes/srv/Kill.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tf_nodes
)
_generate_srv_py(tf_nodes
  "/home/turtlebot/xu_slam/src/tf_nodes/srv/TeleportRelative.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tf_nodes
)
_generate_srv_py(tf_nodes
  "/home/turtlebot/xu_slam/src/tf_nodes/srv/Spawn.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tf_nodes
)

### Generating Module File
_generate_module_py(tf_nodes
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tf_nodes
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(tf_nodes_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(tf_nodes_generate_messages tf_nodes_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/turtlebot/xu_slam/src/tf_nodes/srv/SetPen.srv" NAME_WE)
add_dependencies(tf_nodes_generate_messages_py _tf_nodes_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot/xu_slam/src/tf_nodes/srv/TeleportAbsolute.srv" NAME_WE)
add_dependencies(tf_nodes_generate_messages_py _tf_nodes_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot/xu_slam/src/tf_nodes/srv/Spawn.srv" NAME_WE)
add_dependencies(tf_nodes_generate_messages_py _tf_nodes_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot/xu_slam/src/tf_nodes/srv/TeleportRelative.srv" NAME_WE)
add_dependencies(tf_nodes_generate_messages_py _tf_nodes_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot/xu_slam/src/tf_nodes/srv/Kill.srv" NAME_WE)
add_dependencies(tf_nodes_generate_messages_py _tf_nodes_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot/xu_slam/src/tf_nodes/msg/Pose.msg" NAME_WE)
add_dependencies(tf_nodes_generate_messages_py _tf_nodes_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(tf_nodes_genpy)
add_dependencies(tf_nodes_genpy tf_nodes_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS tf_nodes_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tf_nodes)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tf_nodes
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(tf_nodes_generate_messages_cpp std_msgs_generate_messages_cpp)
add_dependencies(tf_nodes_generate_messages_cpp tf_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tf_nodes)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tf_nodes
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(tf_nodes_generate_messages_lisp std_msgs_generate_messages_lisp)
add_dependencies(tf_nodes_generate_messages_lisp tf_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tf_nodes)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tf_nodes\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tf_nodes
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(tf_nodes_generate_messages_py std_msgs_generate_messages_py)
add_dependencies(tf_nodes_generate_messages_py tf_generate_messages_py)
