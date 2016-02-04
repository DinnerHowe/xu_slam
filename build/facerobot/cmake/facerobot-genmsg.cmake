# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "facerobot: 4 messages, 0 services")

set(MSG_I_FLAGS "-Ifacerobot:/home/turtlebot2/xu_slam/src/facerobot/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(facerobot_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/turtlebot2/xu_slam/src/facerobot/msg/Navigation.msg" NAME_WE)
add_custom_target(_facerobot_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "facerobot" "/home/turtlebot2/xu_slam/src/facerobot/msg/Navigation.msg" ""
)

get_filename_component(_filename "/home/turtlebot2/xu_slam/src/facerobot/msg/Transmit.msg" NAME_WE)
add_custom_target(_facerobot_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "facerobot" "/home/turtlebot2/xu_slam/src/facerobot/msg/Transmit.msg" ""
)

get_filename_component(_filename "/home/turtlebot2/xu_slam/src/facerobot/msg/Command.msg" NAME_WE)
add_custom_target(_facerobot_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "facerobot" "/home/turtlebot2/xu_slam/src/facerobot/msg/Command.msg" "facerobot/Transmit:facerobot/Motion:facerobot/Navigation"
)

get_filename_component(_filename "/home/turtlebot2/xu_slam/src/facerobot/msg/Motion.msg" NAME_WE)
add_custom_target(_facerobot_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "facerobot" "/home/turtlebot2/xu_slam/src/facerobot/msg/Motion.msg" ""
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(facerobot
  "/home/turtlebot2/xu_slam/src/facerobot/msg/Navigation.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/facerobot
)
_generate_msg_cpp(facerobot
  "/home/turtlebot2/xu_slam/src/facerobot/msg/Transmit.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/facerobot
)
_generate_msg_cpp(facerobot
  "/home/turtlebot2/xu_slam/src/facerobot/msg/Command.msg"
  "${MSG_I_FLAGS}"
  "/home/turtlebot2/xu_slam/src/facerobot/msg/Transmit.msg;/home/turtlebot2/xu_slam/src/facerobot/msg/Motion.msg;/home/turtlebot2/xu_slam/src/facerobot/msg/Navigation.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/facerobot
)
_generate_msg_cpp(facerobot
  "/home/turtlebot2/xu_slam/src/facerobot/msg/Motion.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/facerobot
)

### Generating Services

### Generating Module File
_generate_module_cpp(facerobot
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/facerobot
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(facerobot_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(facerobot_generate_messages facerobot_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/turtlebot2/xu_slam/src/facerobot/msg/Navigation.msg" NAME_WE)
add_dependencies(facerobot_generate_messages_cpp _facerobot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot2/xu_slam/src/facerobot/msg/Transmit.msg" NAME_WE)
add_dependencies(facerobot_generate_messages_cpp _facerobot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot2/xu_slam/src/facerobot/msg/Command.msg" NAME_WE)
add_dependencies(facerobot_generate_messages_cpp _facerobot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot2/xu_slam/src/facerobot/msg/Motion.msg" NAME_WE)
add_dependencies(facerobot_generate_messages_cpp _facerobot_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(facerobot_gencpp)
add_dependencies(facerobot_gencpp facerobot_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS facerobot_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(facerobot
  "/home/turtlebot2/xu_slam/src/facerobot/msg/Navigation.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/facerobot
)
_generate_msg_lisp(facerobot
  "/home/turtlebot2/xu_slam/src/facerobot/msg/Transmit.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/facerobot
)
_generate_msg_lisp(facerobot
  "/home/turtlebot2/xu_slam/src/facerobot/msg/Command.msg"
  "${MSG_I_FLAGS}"
  "/home/turtlebot2/xu_slam/src/facerobot/msg/Transmit.msg;/home/turtlebot2/xu_slam/src/facerobot/msg/Motion.msg;/home/turtlebot2/xu_slam/src/facerobot/msg/Navigation.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/facerobot
)
_generate_msg_lisp(facerobot
  "/home/turtlebot2/xu_slam/src/facerobot/msg/Motion.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/facerobot
)

### Generating Services

### Generating Module File
_generate_module_lisp(facerobot
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/facerobot
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(facerobot_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(facerobot_generate_messages facerobot_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/turtlebot2/xu_slam/src/facerobot/msg/Navigation.msg" NAME_WE)
add_dependencies(facerobot_generate_messages_lisp _facerobot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot2/xu_slam/src/facerobot/msg/Transmit.msg" NAME_WE)
add_dependencies(facerobot_generate_messages_lisp _facerobot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot2/xu_slam/src/facerobot/msg/Command.msg" NAME_WE)
add_dependencies(facerobot_generate_messages_lisp _facerobot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot2/xu_slam/src/facerobot/msg/Motion.msg" NAME_WE)
add_dependencies(facerobot_generate_messages_lisp _facerobot_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(facerobot_genlisp)
add_dependencies(facerobot_genlisp facerobot_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS facerobot_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(facerobot
  "/home/turtlebot2/xu_slam/src/facerobot/msg/Navigation.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/facerobot
)
_generate_msg_py(facerobot
  "/home/turtlebot2/xu_slam/src/facerobot/msg/Transmit.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/facerobot
)
_generate_msg_py(facerobot
  "/home/turtlebot2/xu_slam/src/facerobot/msg/Command.msg"
  "${MSG_I_FLAGS}"
  "/home/turtlebot2/xu_slam/src/facerobot/msg/Transmit.msg;/home/turtlebot2/xu_slam/src/facerobot/msg/Motion.msg;/home/turtlebot2/xu_slam/src/facerobot/msg/Navigation.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/facerobot
)
_generate_msg_py(facerobot
  "/home/turtlebot2/xu_slam/src/facerobot/msg/Motion.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/facerobot
)

### Generating Services

### Generating Module File
_generate_module_py(facerobot
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/facerobot
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(facerobot_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(facerobot_generate_messages facerobot_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/turtlebot2/xu_slam/src/facerobot/msg/Navigation.msg" NAME_WE)
add_dependencies(facerobot_generate_messages_py _facerobot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot2/xu_slam/src/facerobot/msg/Transmit.msg" NAME_WE)
add_dependencies(facerobot_generate_messages_py _facerobot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot2/xu_slam/src/facerobot/msg/Command.msg" NAME_WE)
add_dependencies(facerobot_generate_messages_py _facerobot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot2/xu_slam/src/facerobot/msg/Motion.msg" NAME_WE)
add_dependencies(facerobot_generate_messages_py _facerobot_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(facerobot_genpy)
add_dependencies(facerobot_genpy facerobot_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS facerobot_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/facerobot)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/facerobot
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(facerobot_generate_messages_cpp std_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/facerobot)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/facerobot
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(facerobot_generate_messages_lisp std_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/facerobot)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/facerobot\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/facerobot
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(facerobot_generate_messages_py std_msgs_generate_messages_py)
