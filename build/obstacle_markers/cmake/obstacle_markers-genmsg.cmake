# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(WARNING "Invoking generate_messages() without having added any message or service file before.
You should either add add_message_files() and/or add_service_files() calls or remove the invocation of generate_messages().")
message(STATUS "obstacle_markers: 0 messages, 0 services")

set(MSG_I_FLAGS "-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/indigo/share/geometry_msgs/cmake/../msg;-Ivisualization_msgs:/opt/ros/indigo/share/visualization_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(obstacle_markers_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services

### Generating Module File
_generate_module_cpp(obstacle_markers
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/obstacle_markers
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(obstacle_markers_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(obstacle_markers_generate_messages obstacle_markers_generate_messages_cpp)

# add dependencies to all check dependencies targets

# target for backward compatibility
add_custom_target(obstacle_markers_gencpp)
add_dependencies(obstacle_markers_gencpp obstacle_markers_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS obstacle_markers_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services

### Generating Module File
_generate_module_lisp(obstacle_markers
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/obstacle_markers
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(obstacle_markers_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(obstacle_markers_generate_messages obstacle_markers_generate_messages_lisp)

# add dependencies to all check dependencies targets

# target for backward compatibility
add_custom_target(obstacle_markers_genlisp)
add_dependencies(obstacle_markers_genlisp obstacle_markers_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS obstacle_markers_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages

### Generating Services

### Generating Module File
_generate_module_py(obstacle_markers
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/obstacle_markers
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(obstacle_markers_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(obstacle_markers_generate_messages obstacle_markers_generate_messages_py)

# add dependencies to all check dependencies targets

# target for backward compatibility
add_custom_target(obstacle_markers_genpy)
add_dependencies(obstacle_markers_genpy obstacle_markers_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS obstacle_markers_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/obstacle_markers)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/obstacle_markers
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(obstacle_markers_generate_messages_cpp std_msgs_generate_messages_cpp)
add_dependencies(obstacle_markers_generate_messages_cpp geometry_msgs_generate_messages_cpp)
add_dependencies(obstacle_markers_generate_messages_cpp visualization_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/obstacle_markers)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/obstacle_markers
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(obstacle_markers_generate_messages_lisp std_msgs_generate_messages_lisp)
add_dependencies(obstacle_markers_generate_messages_lisp geometry_msgs_generate_messages_lisp)
add_dependencies(obstacle_markers_generate_messages_lisp visualization_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/obstacle_markers)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/obstacle_markers\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/obstacle_markers
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(obstacle_markers_generate_messages_py std_msgs_generate_messages_py)
add_dependencies(obstacle_markers_generate_messages_py geometry_msgs_generate_messages_py)
add_dependencies(obstacle_markers_generate_messages_py visualization_msgs_generate_messages_py)
