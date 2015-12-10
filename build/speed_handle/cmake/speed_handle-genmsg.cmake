# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "speed_handle: 2 messages, 1 services")

set(MSG_I_FLAGS "-Ispeed_handle:/home/turtlebot2/xu_slam/src/speed_handle/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(speed_handle_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/turtlebot2/xu_slam/src/speed_handle/msg/speed.msg" NAME_WE)
add_custom_target(_speed_handle_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "speed_handle" "/home/turtlebot2/xu_slam/src/speed_handle/msg/speed.msg" "speed_handle/Victor"
)

get_filename_component(_filename "/home/turtlebot2/xu_slam/src/speed_handle/msg/Victor.msg" NAME_WE)
add_custom_target(_speed_handle_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "speed_handle" "/home/turtlebot2/xu_slam/src/speed_handle/msg/Victor.msg" ""
)

get_filename_component(_filename "/home/turtlebot2/xu_slam/src/speed_handle/srv/Speed.srv" NAME_WE)
add_custom_target(_speed_handle_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "speed_handle" "/home/turtlebot2/xu_slam/src/speed_handle/srv/Speed.srv" "speed_handle/Victor"
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(speed_handle
  "/home/turtlebot2/xu_slam/src/speed_handle/msg/speed.msg"
  "${MSG_I_FLAGS}"
  "/home/turtlebot2/xu_slam/src/speed_handle/msg/Victor.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/speed_handle
)
_generate_msg_cpp(speed_handle
  "/home/turtlebot2/xu_slam/src/speed_handle/msg/Victor.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/speed_handle
)

### Generating Services
_generate_srv_cpp(speed_handle
  "/home/turtlebot2/xu_slam/src/speed_handle/srv/Speed.srv"
  "${MSG_I_FLAGS}"
  "/home/turtlebot2/xu_slam/src/speed_handle/msg/Victor.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/speed_handle
)

### Generating Module File
_generate_module_cpp(speed_handle
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/speed_handle
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(speed_handle_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(speed_handle_generate_messages speed_handle_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/turtlebot2/xu_slam/src/speed_handle/msg/speed.msg" NAME_WE)
add_dependencies(speed_handle_generate_messages_cpp _speed_handle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot2/xu_slam/src/speed_handle/msg/Victor.msg" NAME_WE)
add_dependencies(speed_handle_generate_messages_cpp _speed_handle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot2/xu_slam/src/speed_handle/srv/Speed.srv" NAME_WE)
add_dependencies(speed_handle_generate_messages_cpp _speed_handle_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(speed_handle_gencpp)
add_dependencies(speed_handle_gencpp speed_handle_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS speed_handle_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(speed_handle
  "/home/turtlebot2/xu_slam/src/speed_handle/msg/speed.msg"
  "${MSG_I_FLAGS}"
  "/home/turtlebot2/xu_slam/src/speed_handle/msg/Victor.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/speed_handle
)
_generate_msg_lisp(speed_handle
  "/home/turtlebot2/xu_slam/src/speed_handle/msg/Victor.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/speed_handle
)

### Generating Services
_generate_srv_lisp(speed_handle
  "/home/turtlebot2/xu_slam/src/speed_handle/srv/Speed.srv"
  "${MSG_I_FLAGS}"
  "/home/turtlebot2/xu_slam/src/speed_handle/msg/Victor.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/speed_handle
)

### Generating Module File
_generate_module_lisp(speed_handle
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/speed_handle
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(speed_handle_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(speed_handle_generate_messages speed_handle_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/turtlebot2/xu_slam/src/speed_handle/msg/speed.msg" NAME_WE)
add_dependencies(speed_handle_generate_messages_lisp _speed_handle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot2/xu_slam/src/speed_handle/msg/Victor.msg" NAME_WE)
add_dependencies(speed_handle_generate_messages_lisp _speed_handle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot2/xu_slam/src/speed_handle/srv/Speed.srv" NAME_WE)
add_dependencies(speed_handle_generate_messages_lisp _speed_handle_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(speed_handle_genlisp)
add_dependencies(speed_handle_genlisp speed_handle_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS speed_handle_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(speed_handle
  "/home/turtlebot2/xu_slam/src/speed_handle/msg/speed.msg"
  "${MSG_I_FLAGS}"
  "/home/turtlebot2/xu_slam/src/speed_handle/msg/Victor.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/speed_handle
)
_generate_msg_py(speed_handle
  "/home/turtlebot2/xu_slam/src/speed_handle/msg/Victor.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/speed_handle
)

### Generating Services
_generate_srv_py(speed_handle
  "/home/turtlebot2/xu_slam/src/speed_handle/srv/Speed.srv"
  "${MSG_I_FLAGS}"
  "/home/turtlebot2/xu_slam/src/speed_handle/msg/Victor.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/speed_handle
)

### Generating Module File
_generate_module_py(speed_handle
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/speed_handle
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(speed_handle_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(speed_handle_generate_messages speed_handle_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/turtlebot2/xu_slam/src/speed_handle/msg/speed.msg" NAME_WE)
add_dependencies(speed_handle_generate_messages_py _speed_handle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot2/xu_slam/src/speed_handle/msg/Victor.msg" NAME_WE)
add_dependencies(speed_handle_generate_messages_py _speed_handle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot2/xu_slam/src/speed_handle/srv/Speed.srv" NAME_WE)
add_dependencies(speed_handle_generate_messages_py _speed_handle_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(speed_handle_genpy)
add_dependencies(speed_handle_genpy speed_handle_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS speed_handle_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/speed_handle)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/speed_handle
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(speed_handle_generate_messages_cpp std_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/speed_handle)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/speed_handle
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(speed_handle_generate_messages_lisp std_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/speed_handle)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/speed_handle\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/speed_handle
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(speed_handle_generate_messages_py std_msgs_generate_messages_py)
