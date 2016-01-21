# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "voice_interface: 4 messages, 0 services")

set(MSG_I_FLAGS "-Ivoice_interface:/home/turtlebot2/xu_slam/src/voice_interface/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(voice_interface_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/turtlebot2/xu_slam/src/voice_interface/msg/Command.msg" NAME_WE)
add_custom_target(_voice_interface_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "voice_interface" "/home/turtlebot2/xu_slam/src/voice_interface/msg/Command.msg" "voice_interface/Navigation:voice_interface/Transmit:voice_interface/Motion"
)

get_filename_component(_filename "/home/turtlebot2/xu_slam/src/voice_interface/msg/Navigation.msg" NAME_WE)
add_custom_target(_voice_interface_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "voice_interface" "/home/turtlebot2/xu_slam/src/voice_interface/msg/Navigation.msg" ""
)

get_filename_component(_filename "/home/turtlebot2/xu_slam/src/voice_interface/msg/Transmit.msg" NAME_WE)
add_custom_target(_voice_interface_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "voice_interface" "/home/turtlebot2/xu_slam/src/voice_interface/msg/Transmit.msg" ""
)

get_filename_component(_filename "/home/turtlebot2/xu_slam/src/voice_interface/msg/Motion.msg" NAME_WE)
add_custom_target(_voice_interface_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "voice_interface" "/home/turtlebot2/xu_slam/src/voice_interface/msg/Motion.msg" ""
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(voice_interface
  "/home/turtlebot2/xu_slam/src/voice_interface/msg/Navigation.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/voice_interface
)
_generate_msg_cpp(voice_interface
  "/home/turtlebot2/xu_slam/src/voice_interface/msg/Motion.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/voice_interface
)
_generate_msg_cpp(voice_interface
  "/home/turtlebot2/xu_slam/src/voice_interface/msg/Transmit.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/voice_interface
)
_generate_msg_cpp(voice_interface
  "/home/turtlebot2/xu_slam/src/voice_interface/msg/Command.msg"
  "${MSG_I_FLAGS}"
  "/home/turtlebot2/xu_slam/src/voice_interface/msg/Navigation.msg;/home/turtlebot2/xu_slam/src/voice_interface/msg/Transmit.msg;/home/turtlebot2/xu_slam/src/voice_interface/msg/Motion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/voice_interface
)

### Generating Services

### Generating Module File
_generate_module_cpp(voice_interface
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/voice_interface
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(voice_interface_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(voice_interface_generate_messages voice_interface_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/turtlebot2/xu_slam/src/voice_interface/msg/Command.msg" NAME_WE)
add_dependencies(voice_interface_generate_messages_cpp _voice_interface_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot2/xu_slam/src/voice_interface/msg/Navigation.msg" NAME_WE)
add_dependencies(voice_interface_generate_messages_cpp _voice_interface_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot2/xu_slam/src/voice_interface/msg/Transmit.msg" NAME_WE)
add_dependencies(voice_interface_generate_messages_cpp _voice_interface_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot2/xu_slam/src/voice_interface/msg/Motion.msg" NAME_WE)
add_dependencies(voice_interface_generate_messages_cpp _voice_interface_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(voice_interface_gencpp)
add_dependencies(voice_interface_gencpp voice_interface_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS voice_interface_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(voice_interface
  "/home/turtlebot2/xu_slam/src/voice_interface/msg/Navigation.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/voice_interface
)
_generate_msg_lisp(voice_interface
  "/home/turtlebot2/xu_slam/src/voice_interface/msg/Motion.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/voice_interface
)
_generate_msg_lisp(voice_interface
  "/home/turtlebot2/xu_slam/src/voice_interface/msg/Transmit.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/voice_interface
)
_generate_msg_lisp(voice_interface
  "/home/turtlebot2/xu_slam/src/voice_interface/msg/Command.msg"
  "${MSG_I_FLAGS}"
  "/home/turtlebot2/xu_slam/src/voice_interface/msg/Navigation.msg;/home/turtlebot2/xu_slam/src/voice_interface/msg/Transmit.msg;/home/turtlebot2/xu_slam/src/voice_interface/msg/Motion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/voice_interface
)

### Generating Services

### Generating Module File
_generate_module_lisp(voice_interface
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/voice_interface
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(voice_interface_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(voice_interface_generate_messages voice_interface_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/turtlebot2/xu_slam/src/voice_interface/msg/Command.msg" NAME_WE)
add_dependencies(voice_interface_generate_messages_lisp _voice_interface_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot2/xu_slam/src/voice_interface/msg/Navigation.msg" NAME_WE)
add_dependencies(voice_interface_generate_messages_lisp _voice_interface_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot2/xu_slam/src/voice_interface/msg/Transmit.msg" NAME_WE)
add_dependencies(voice_interface_generate_messages_lisp _voice_interface_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot2/xu_slam/src/voice_interface/msg/Motion.msg" NAME_WE)
add_dependencies(voice_interface_generate_messages_lisp _voice_interface_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(voice_interface_genlisp)
add_dependencies(voice_interface_genlisp voice_interface_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS voice_interface_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(voice_interface
  "/home/turtlebot2/xu_slam/src/voice_interface/msg/Navigation.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/voice_interface
)
_generate_msg_py(voice_interface
  "/home/turtlebot2/xu_slam/src/voice_interface/msg/Motion.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/voice_interface
)
_generate_msg_py(voice_interface
  "/home/turtlebot2/xu_slam/src/voice_interface/msg/Transmit.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/voice_interface
)
_generate_msg_py(voice_interface
  "/home/turtlebot2/xu_slam/src/voice_interface/msg/Command.msg"
  "${MSG_I_FLAGS}"
  "/home/turtlebot2/xu_slam/src/voice_interface/msg/Navigation.msg;/home/turtlebot2/xu_slam/src/voice_interface/msg/Transmit.msg;/home/turtlebot2/xu_slam/src/voice_interface/msg/Motion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/voice_interface
)

### Generating Services

### Generating Module File
_generate_module_py(voice_interface
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/voice_interface
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(voice_interface_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(voice_interface_generate_messages voice_interface_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/turtlebot2/xu_slam/src/voice_interface/msg/Command.msg" NAME_WE)
add_dependencies(voice_interface_generate_messages_py _voice_interface_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot2/xu_slam/src/voice_interface/msg/Navigation.msg" NAME_WE)
add_dependencies(voice_interface_generate_messages_py _voice_interface_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot2/xu_slam/src/voice_interface/msg/Transmit.msg" NAME_WE)
add_dependencies(voice_interface_generate_messages_py _voice_interface_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot2/xu_slam/src/voice_interface/msg/Motion.msg" NAME_WE)
add_dependencies(voice_interface_generate_messages_py _voice_interface_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(voice_interface_genpy)
add_dependencies(voice_interface_genpy voice_interface_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS voice_interface_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/voice_interface)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/voice_interface
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(voice_interface_generate_messages_cpp std_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/voice_interface)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/voice_interface
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(voice_interface_generate_messages_lisp std_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/voice_interface)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/voice_interface\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/voice_interface
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(voice_interface_generate_messages_py std_msgs_generate_messages_py)
