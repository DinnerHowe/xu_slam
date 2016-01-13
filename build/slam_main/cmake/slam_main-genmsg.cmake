# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "slam_main: 3 messages, 0 services")

set(MSG_I_FLAGS "-Islam_main:/home/turtlebot2/xu_slam/src/slam_main/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/indigo/share/geometry_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/indigo/share/actionlib_msgs/cmake/../msg;-Imove_base_msgs:/opt/ros/indigo/share/move_base_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(slam_main_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/turtlebot2/xu_slam/src/slam_main/msg/orientation.msg" NAME_WE)
add_custom_target(_slam_main_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "slam_main" "/home/turtlebot2/xu_slam/src/slam_main/msg/orientation.msg" ""
)

get_filename_component(_filename "/home/turtlebot2/xu_slam/src/slam_main/msg/position.msg" NAME_WE)
add_custom_target(_slam_main_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "slam_main" "/home/turtlebot2/xu_slam/src/slam_main/msg/position.msg" ""
)

get_filename_component(_filename "/home/turtlebot2/xu_slam/src/slam_main/msg/pose.msg" NAME_WE)
add_custom_target(_slam_main_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "slam_main" "/home/turtlebot2/xu_slam/src/slam_main/msg/pose.msg" "slam_main/orientation:slam_main/position"
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(slam_main
  "/home/turtlebot2/xu_slam/src/slam_main/msg/orientation.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/slam_main
)
_generate_msg_cpp(slam_main
  "/home/turtlebot2/xu_slam/src/slam_main/msg/position.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/slam_main
)
_generate_msg_cpp(slam_main
  "/home/turtlebot2/xu_slam/src/slam_main/msg/pose.msg"
  "${MSG_I_FLAGS}"
  "/home/turtlebot2/xu_slam/src/slam_main/msg/orientation.msg;/home/turtlebot2/xu_slam/src/slam_main/msg/position.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/slam_main
)

### Generating Services

### Generating Module File
_generate_module_cpp(slam_main
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/slam_main
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(slam_main_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(slam_main_generate_messages slam_main_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/turtlebot2/xu_slam/src/slam_main/msg/orientation.msg" NAME_WE)
add_dependencies(slam_main_generate_messages_cpp _slam_main_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot2/xu_slam/src/slam_main/msg/position.msg" NAME_WE)
add_dependencies(slam_main_generate_messages_cpp _slam_main_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot2/xu_slam/src/slam_main/msg/pose.msg" NAME_WE)
add_dependencies(slam_main_generate_messages_cpp _slam_main_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(slam_main_gencpp)
add_dependencies(slam_main_gencpp slam_main_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS slam_main_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(slam_main
  "/home/turtlebot2/xu_slam/src/slam_main/msg/orientation.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/slam_main
)
_generate_msg_lisp(slam_main
  "/home/turtlebot2/xu_slam/src/slam_main/msg/position.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/slam_main
)
_generate_msg_lisp(slam_main
  "/home/turtlebot2/xu_slam/src/slam_main/msg/pose.msg"
  "${MSG_I_FLAGS}"
  "/home/turtlebot2/xu_slam/src/slam_main/msg/orientation.msg;/home/turtlebot2/xu_slam/src/slam_main/msg/position.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/slam_main
)

### Generating Services

### Generating Module File
_generate_module_lisp(slam_main
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/slam_main
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(slam_main_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(slam_main_generate_messages slam_main_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/turtlebot2/xu_slam/src/slam_main/msg/orientation.msg" NAME_WE)
add_dependencies(slam_main_generate_messages_lisp _slam_main_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot2/xu_slam/src/slam_main/msg/position.msg" NAME_WE)
add_dependencies(slam_main_generate_messages_lisp _slam_main_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot2/xu_slam/src/slam_main/msg/pose.msg" NAME_WE)
add_dependencies(slam_main_generate_messages_lisp _slam_main_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(slam_main_genlisp)
add_dependencies(slam_main_genlisp slam_main_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS slam_main_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(slam_main
  "/home/turtlebot2/xu_slam/src/slam_main/msg/orientation.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/slam_main
)
_generate_msg_py(slam_main
  "/home/turtlebot2/xu_slam/src/slam_main/msg/position.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/slam_main
)
_generate_msg_py(slam_main
  "/home/turtlebot2/xu_slam/src/slam_main/msg/pose.msg"
  "${MSG_I_FLAGS}"
  "/home/turtlebot2/xu_slam/src/slam_main/msg/orientation.msg;/home/turtlebot2/xu_slam/src/slam_main/msg/position.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/slam_main
)

### Generating Services

### Generating Module File
_generate_module_py(slam_main
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/slam_main
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(slam_main_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(slam_main_generate_messages slam_main_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/turtlebot2/xu_slam/src/slam_main/msg/orientation.msg" NAME_WE)
add_dependencies(slam_main_generate_messages_py _slam_main_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot2/xu_slam/src/slam_main/msg/position.msg" NAME_WE)
add_dependencies(slam_main_generate_messages_py _slam_main_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot2/xu_slam/src/slam_main/msg/pose.msg" NAME_WE)
add_dependencies(slam_main_generate_messages_py _slam_main_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(slam_main_genpy)
add_dependencies(slam_main_genpy slam_main_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS slam_main_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/slam_main)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/slam_main
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(slam_main_generate_messages_cpp std_msgs_generate_messages_cpp)
add_dependencies(slam_main_generate_messages_cpp geometry_msgs_generate_messages_cpp)
add_dependencies(slam_main_generate_messages_cpp actionlib_msgs_generate_messages_cpp)
add_dependencies(slam_main_generate_messages_cpp move_base_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/slam_main)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/slam_main
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(slam_main_generate_messages_lisp std_msgs_generate_messages_lisp)
add_dependencies(slam_main_generate_messages_lisp geometry_msgs_generate_messages_lisp)
add_dependencies(slam_main_generate_messages_lisp actionlib_msgs_generate_messages_lisp)
add_dependencies(slam_main_generate_messages_lisp move_base_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/slam_main)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/slam_main\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/slam_main
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(slam_main_generate_messages_py std_msgs_generate_messages_py)
add_dependencies(slam_main_generate_messages_py geometry_msgs_generate_messages_py)
add_dependencies(slam_main_generate_messages_py actionlib_msgs_generate_messages_py)
add_dependencies(slam_main_generate_messages_py move_base_msgs_generate_messages_py)
