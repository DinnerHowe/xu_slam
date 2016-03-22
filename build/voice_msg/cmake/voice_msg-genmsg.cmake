# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "voice_msg: 5 messages, 0 services")

set(MSG_I_FLAGS "-Ivoice_msg:/home/turtlebot/xu_slam/src/voice_msg/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg;-Ivoice_msg:/home/turtlebot/xu_slam/src/voice_msg/msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(voice_msg_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/turtlebot/xu_slam/src/voice_msg/msg/Motion.msg" NAME_WE)
add_custom_target(_voice_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "voice_msg" "/home/turtlebot/xu_slam/src/voice_msg/msg/Motion.msg" ""
)

get_filename_component(_filename "/home/turtlebot/xu_slam/src/voice_msg/msg/Navigation.msg" NAME_WE)
add_custom_target(_voice_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "voice_msg" "/home/turtlebot/xu_slam/src/voice_msg/msg/Navigation.msg" ""
)

get_filename_component(_filename "/home/turtlebot/xu_slam/src/voice_msg/msg/Command.msg" NAME_WE)
add_custom_target(_voice_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "voice_msg" "/home/turtlebot/xu_slam/src/voice_msg/msg/Command.msg" "voice_msg/Transmit:voice_msg/Navigation:voice_msg/Motion"
)

get_filename_component(_filename "/home/turtlebot/xu_slam/src/voice_msg/msg/recog_result.msg" NAME_WE)
add_custom_target(_voice_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "voice_msg" "/home/turtlebot/xu_slam/src/voice_msg/msg/recog_result.msg" ""
)

get_filename_component(_filename "/home/turtlebot/xu_slam/src/voice_msg/msg/Transmit.msg" NAME_WE)
add_custom_target(_voice_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "voice_msg" "/home/turtlebot/xu_slam/src/voice_msg/msg/Transmit.msg" ""
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(voice_msg
  "/home/turtlebot/xu_slam/src/voice_msg/msg/Motion.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/voice_msg
)
_generate_msg_cpp(voice_msg
  "/home/turtlebot/xu_slam/src/voice_msg/msg/Navigation.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/voice_msg
)
_generate_msg_cpp(voice_msg
  "/home/turtlebot/xu_slam/src/voice_msg/msg/Command.msg"
  "${MSG_I_FLAGS}"
  "/home/turtlebot/xu_slam/src/voice_msg/msg/Transmit.msg;/home/turtlebot/xu_slam/src/voice_msg/msg/Navigation.msg;/home/turtlebot/xu_slam/src/voice_msg/msg/Motion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/voice_msg
)
_generate_msg_cpp(voice_msg
  "/home/turtlebot/xu_slam/src/voice_msg/msg/recog_result.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/voice_msg
)
_generate_msg_cpp(voice_msg
  "/home/turtlebot/xu_slam/src/voice_msg/msg/Transmit.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/voice_msg
)

### Generating Services

### Generating Module File
_generate_module_cpp(voice_msg
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/voice_msg
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(voice_msg_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(voice_msg_generate_messages voice_msg_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/turtlebot/xu_slam/src/voice_msg/msg/Motion.msg" NAME_WE)
add_dependencies(voice_msg_generate_messages_cpp _voice_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot/xu_slam/src/voice_msg/msg/Navigation.msg" NAME_WE)
add_dependencies(voice_msg_generate_messages_cpp _voice_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot/xu_slam/src/voice_msg/msg/Command.msg" NAME_WE)
add_dependencies(voice_msg_generate_messages_cpp _voice_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot/xu_slam/src/voice_msg/msg/recog_result.msg" NAME_WE)
add_dependencies(voice_msg_generate_messages_cpp _voice_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot/xu_slam/src/voice_msg/msg/Transmit.msg" NAME_WE)
add_dependencies(voice_msg_generate_messages_cpp _voice_msg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(voice_msg_gencpp)
add_dependencies(voice_msg_gencpp voice_msg_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS voice_msg_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(voice_msg
  "/home/turtlebot/xu_slam/src/voice_msg/msg/Motion.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/voice_msg
)
_generate_msg_lisp(voice_msg
  "/home/turtlebot/xu_slam/src/voice_msg/msg/Navigation.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/voice_msg
)
_generate_msg_lisp(voice_msg
  "/home/turtlebot/xu_slam/src/voice_msg/msg/Command.msg"
  "${MSG_I_FLAGS}"
  "/home/turtlebot/xu_slam/src/voice_msg/msg/Transmit.msg;/home/turtlebot/xu_slam/src/voice_msg/msg/Navigation.msg;/home/turtlebot/xu_slam/src/voice_msg/msg/Motion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/voice_msg
)
_generate_msg_lisp(voice_msg
  "/home/turtlebot/xu_slam/src/voice_msg/msg/recog_result.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/voice_msg
)
_generate_msg_lisp(voice_msg
  "/home/turtlebot/xu_slam/src/voice_msg/msg/Transmit.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/voice_msg
)

### Generating Services

### Generating Module File
_generate_module_lisp(voice_msg
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/voice_msg
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(voice_msg_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(voice_msg_generate_messages voice_msg_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/turtlebot/xu_slam/src/voice_msg/msg/Motion.msg" NAME_WE)
add_dependencies(voice_msg_generate_messages_lisp _voice_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot/xu_slam/src/voice_msg/msg/Navigation.msg" NAME_WE)
add_dependencies(voice_msg_generate_messages_lisp _voice_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot/xu_slam/src/voice_msg/msg/Command.msg" NAME_WE)
add_dependencies(voice_msg_generate_messages_lisp _voice_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot/xu_slam/src/voice_msg/msg/recog_result.msg" NAME_WE)
add_dependencies(voice_msg_generate_messages_lisp _voice_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot/xu_slam/src/voice_msg/msg/Transmit.msg" NAME_WE)
add_dependencies(voice_msg_generate_messages_lisp _voice_msg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(voice_msg_genlisp)
add_dependencies(voice_msg_genlisp voice_msg_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS voice_msg_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(voice_msg
  "/home/turtlebot/xu_slam/src/voice_msg/msg/Motion.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/voice_msg
)
_generate_msg_py(voice_msg
  "/home/turtlebot/xu_slam/src/voice_msg/msg/Navigation.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/voice_msg
)
_generate_msg_py(voice_msg
  "/home/turtlebot/xu_slam/src/voice_msg/msg/Command.msg"
  "${MSG_I_FLAGS}"
  "/home/turtlebot/xu_slam/src/voice_msg/msg/Transmit.msg;/home/turtlebot/xu_slam/src/voice_msg/msg/Navigation.msg;/home/turtlebot/xu_slam/src/voice_msg/msg/Motion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/voice_msg
)
_generate_msg_py(voice_msg
  "/home/turtlebot/xu_slam/src/voice_msg/msg/recog_result.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/voice_msg
)
_generate_msg_py(voice_msg
  "/home/turtlebot/xu_slam/src/voice_msg/msg/Transmit.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/voice_msg
)

### Generating Services

### Generating Module File
_generate_module_py(voice_msg
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/voice_msg
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(voice_msg_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(voice_msg_generate_messages voice_msg_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/turtlebot/xu_slam/src/voice_msg/msg/Motion.msg" NAME_WE)
add_dependencies(voice_msg_generate_messages_py _voice_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot/xu_slam/src/voice_msg/msg/Navigation.msg" NAME_WE)
add_dependencies(voice_msg_generate_messages_py _voice_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot/xu_slam/src/voice_msg/msg/Command.msg" NAME_WE)
add_dependencies(voice_msg_generate_messages_py _voice_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot/xu_slam/src/voice_msg/msg/recog_result.msg" NAME_WE)
add_dependencies(voice_msg_generate_messages_py _voice_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot/xu_slam/src/voice_msg/msg/Transmit.msg" NAME_WE)
add_dependencies(voice_msg_generate_messages_py _voice_msg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(voice_msg_genpy)
add_dependencies(voice_msg_genpy voice_msg_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS voice_msg_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/voice_msg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/voice_msg
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(voice_msg_generate_messages_cpp std_msgs_generate_messages_cpp)
add_dependencies(voice_msg_generate_messages_cpp voice_msg_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/voice_msg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/voice_msg
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(voice_msg_generate_messages_lisp std_msgs_generate_messages_lisp)
add_dependencies(voice_msg_generate_messages_lisp voice_msg_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/voice_msg)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/voice_msg\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/voice_msg
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(voice_msg_generate_messages_py std_msgs_generate_messages_py)
add_dependencies(voice_msg_generate_messages_py voice_msg_generate_messages_py)
