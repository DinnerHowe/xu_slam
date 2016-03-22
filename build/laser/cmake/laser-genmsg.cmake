# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "laser: 2 messages, 0 services")

set(MSG_I_FLAGS "-Ilaser:/home/turtlebot/xu_slam/src/laser/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(laser_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/turtlebot/xu_slam/src/laser/msg/LaserLikihood.msg" NAME_WE)
add_custom_target(_laser_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "laser" "/home/turtlebot/xu_slam/src/laser/msg/LaserLikihood.msg" ""
)

get_filename_component(_filename "/home/turtlebot/xu_slam/src/laser/msg/warning.msg" NAME_WE)
add_custom_target(_laser_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "laser" "/home/turtlebot/xu_slam/src/laser/msg/warning.msg" ""
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(laser
  "/home/turtlebot/xu_slam/src/laser/msg/warning.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/laser
)
_generate_msg_cpp(laser
  "/home/turtlebot/xu_slam/src/laser/msg/LaserLikihood.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/laser
)

### Generating Services

### Generating Module File
_generate_module_cpp(laser
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/laser
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(laser_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(laser_generate_messages laser_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/turtlebot/xu_slam/src/laser/msg/LaserLikihood.msg" NAME_WE)
add_dependencies(laser_generate_messages_cpp _laser_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot/xu_slam/src/laser/msg/warning.msg" NAME_WE)
add_dependencies(laser_generate_messages_cpp _laser_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(laser_gencpp)
add_dependencies(laser_gencpp laser_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS laser_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(laser
  "/home/turtlebot/xu_slam/src/laser/msg/warning.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/laser
)
_generate_msg_lisp(laser
  "/home/turtlebot/xu_slam/src/laser/msg/LaserLikihood.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/laser
)

### Generating Services

### Generating Module File
_generate_module_lisp(laser
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/laser
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(laser_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(laser_generate_messages laser_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/turtlebot/xu_slam/src/laser/msg/LaserLikihood.msg" NAME_WE)
add_dependencies(laser_generate_messages_lisp _laser_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot/xu_slam/src/laser/msg/warning.msg" NAME_WE)
add_dependencies(laser_generate_messages_lisp _laser_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(laser_genlisp)
add_dependencies(laser_genlisp laser_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS laser_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(laser
  "/home/turtlebot/xu_slam/src/laser/msg/warning.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/laser
)
_generate_msg_py(laser
  "/home/turtlebot/xu_slam/src/laser/msg/LaserLikihood.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/laser
)

### Generating Services

### Generating Module File
_generate_module_py(laser
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/laser
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(laser_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(laser_generate_messages laser_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/turtlebot/xu_slam/src/laser/msg/LaserLikihood.msg" NAME_WE)
add_dependencies(laser_generate_messages_py _laser_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot/xu_slam/src/laser/msg/warning.msg" NAME_WE)
add_dependencies(laser_generate_messages_py _laser_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(laser_genpy)
add_dependencies(laser_genpy laser_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS laser_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/laser)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/laser
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(laser_generate_messages_cpp std_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/laser)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/laser
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(laser_generate_messages_lisp std_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/laser)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/laser\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/laser
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(laser_generate_messages_py std_msgs_generate_messages_py)
