# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "rfid_handle: 1 messages, 1 services")

set(MSG_I_FLAGS "-Irfid_handle:/home/turtlebot/xu_slam/src/rfid_handle/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(rfid_handle_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/turtlebot/xu_slam/src/rfid_handle/msg/probability.msg" NAME_WE)
add_custom_target(_rfid_handle_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rfid_handle" "/home/turtlebot/xu_slam/src/rfid_handle/msg/probability.msg" ""
)

get_filename_component(_filename "/home/turtlebot/xu_slam/src/rfid_handle/srv/ClassifiedData.srv" NAME_WE)
add_custom_target(_rfid_handle_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rfid_handle" "/home/turtlebot/xu_slam/src/rfid_handle/srv/ClassifiedData.srv" ""
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(rfid_handle
  "/home/turtlebot/xu_slam/src/rfid_handle/msg/probability.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rfid_handle
)

### Generating Services
_generate_srv_cpp(rfid_handle
  "/home/turtlebot/xu_slam/src/rfid_handle/srv/ClassifiedData.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rfid_handle
)

### Generating Module File
_generate_module_cpp(rfid_handle
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rfid_handle
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(rfid_handle_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(rfid_handle_generate_messages rfid_handle_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/turtlebot/xu_slam/src/rfid_handle/msg/probability.msg" NAME_WE)
add_dependencies(rfid_handle_generate_messages_cpp _rfid_handle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot/xu_slam/src/rfid_handle/srv/ClassifiedData.srv" NAME_WE)
add_dependencies(rfid_handle_generate_messages_cpp _rfid_handle_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rfid_handle_gencpp)
add_dependencies(rfid_handle_gencpp rfid_handle_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rfid_handle_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(rfid_handle
  "/home/turtlebot/xu_slam/src/rfid_handle/msg/probability.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rfid_handle
)

### Generating Services
_generate_srv_lisp(rfid_handle
  "/home/turtlebot/xu_slam/src/rfid_handle/srv/ClassifiedData.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rfid_handle
)

### Generating Module File
_generate_module_lisp(rfid_handle
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rfid_handle
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(rfid_handle_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(rfid_handle_generate_messages rfid_handle_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/turtlebot/xu_slam/src/rfid_handle/msg/probability.msg" NAME_WE)
add_dependencies(rfid_handle_generate_messages_lisp _rfid_handle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot/xu_slam/src/rfid_handle/srv/ClassifiedData.srv" NAME_WE)
add_dependencies(rfid_handle_generate_messages_lisp _rfid_handle_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rfid_handle_genlisp)
add_dependencies(rfid_handle_genlisp rfid_handle_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rfid_handle_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(rfid_handle
  "/home/turtlebot/xu_slam/src/rfid_handle/msg/probability.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rfid_handle
)

### Generating Services
_generate_srv_py(rfid_handle
  "/home/turtlebot/xu_slam/src/rfid_handle/srv/ClassifiedData.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rfid_handle
)

### Generating Module File
_generate_module_py(rfid_handle
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rfid_handle
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(rfid_handle_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(rfid_handle_generate_messages rfid_handle_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/turtlebot/xu_slam/src/rfid_handle/msg/probability.msg" NAME_WE)
add_dependencies(rfid_handle_generate_messages_py _rfid_handle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot/xu_slam/src/rfid_handle/srv/ClassifiedData.srv" NAME_WE)
add_dependencies(rfid_handle_generate_messages_py _rfid_handle_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rfid_handle_genpy)
add_dependencies(rfid_handle_genpy rfid_handle_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rfid_handle_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rfid_handle)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rfid_handle
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(rfid_handle_generate_messages_cpp std_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rfid_handle)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rfid_handle
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(rfid_handle_generate_messages_lisp std_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rfid_handle)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rfid_handle\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rfid_handle
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(rfid_handle_generate_messages_py std_msgs_generate_messages_py)
