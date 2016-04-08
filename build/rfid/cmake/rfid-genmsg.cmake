# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "rfid: 4 messages, 0 services")

set(MSG_I_FLAGS "-Irfid:/home/turtlebot/xu_slam/src/rfid/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg;-Inav_msgs:/opt/ros/indigo/share/nav_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/indigo/share/geometry_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/indigo/share/actionlib_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(rfid_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/turtlebot/xu_slam/src/rfid/msg/TransferData.msg" NAME_WE)
add_custom_target(_rfid_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rfid" "/home/turtlebot/xu_slam/src/rfid/msg/TransferData.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/turtlebot/xu_slam/src/rfid/msg/RFIDreadRow.msg" NAME_WE)
add_custom_target(_rfid_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rfid" "/home/turtlebot/xu_slam/src/rfid/msg/RFIDreadRow.msg" ""
)

get_filename_component(_filename "/home/turtlebot/xu_slam/src/rfid/msg/rfid_odom.msg" NAME_WE)
add_custom_target(_rfid_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rfid" "/home/turtlebot/xu_slam/src/rfid/msg/rfid_odom.msg" "geometry_msgs/Quaternion:geometry_msgs/Point:geometry_msgs/Pose"
)

get_filename_component(_filename "/home/turtlebot/xu_slam/src/rfid/msg/rfid_info.msg" NAME_WE)
add_custom_target(_rfid_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rfid" "/home/turtlebot/xu_slam/src/rfid/msg/rfid_info.msg" ""
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(rfid
  "/home/turtlebot/xu_slam/src/rfid/msg/rfid_info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rfid
)
_generate_msg_cpp(rfid
  "/home/turtlebot/xu_slam/src/rfid/msg/rfid_odom.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rfid
)
_generate_msg_cpp(rfid
  "/home/turtlebot/xu_slam/src/rfid/msg/RFIDreadRow.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rfid
)
_generate_msg_cpp(rfid
  "/home/turtlebot/xu_slam/src/rfid/msg/TransferData.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rfid
)

### Generating Services

### Generating Module File
_generate_module_cpp(rfid
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rfid
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(rfid_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(rfid_generate_messages rfid_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/turtlebot/xu_slam/src/rfid/msg/TransferData.msg" NAME_WE)
add_dependencies(rfid_generate_messages_cpp _rfid_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot/xu_slam/src/rfid/msg/RFIDreadRow.msg" NAME_WE)
add_dependencies(rfid_generate_messages_cpp _rfid_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot/xu_slam/src/rfid/msg/rfid_odom.msg" NAME_WE)
add_dependencies(rfid_generate_messages_cpp _rfid_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot/xu_slam/src/rfid/msg/rfid_info.msg" NAME_WE)
add_dependencies(rfid_generate_messages_cpp _rfid_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rfid_gencpp)
add_dependencies(rfid_gencpp rfid_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rfid_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(rfid
  "/home/turtlebot/xu_slam/src/rfid/msg/rfid_info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rfid
)
_generate_msg_lisp(rfid
  "/home/turtlebot/xu_slam/src/rfid/msg/rfid_odom.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rfid
)
_generate_msg_lisp(rfid
  "/home/turtlebot/xu_slam/src/rfid/msg/RFIDreadRow.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rfid
)
_generate_msg_lisp(rfid
  "/home/turtlebot/xu_slam/src/rfid/msg/TransferData.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rfid
)

### Generating Services

### Generating Module File
_generate_module_lisp(rfid
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rfid
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(rfid_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(rfid_generate_messages rfid_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/turtlebot/xu_slam/src/rfid/msg/TransferData.msg" NAME_WE)
add_dependencies(rfid_generate_messages_lisp _rfid_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot/xu_slam/src/rfid/msg/RFIDreadRow.msg" NAME_WE)
add_dependencies(rfid_generate_messages_lisp _rfid_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot/xu_slam/src/rfid/msg/rfid_odom.msg" NAME_WE)
add_dependencies(rfid_generate_messages_lisp _rfid_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot/xu_slam/src/rfid/msg/rfid_info.msg" NAME_WE)
add_dependencies(rfid_generate_messages_lisp _rfid_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rfid_genlisp)
add_dependencies(rfid_genlisp rfid_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rfid_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(rfid
  "/home/turtlebot/xu_slam/src/rfid/msg/rfid_info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rfid
)
_generate_msg_py(rfid
  "/home/turtlebot/xu_slam/src/rfid/msg/rfid_odom.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rfid
)
_generate_msg_py(rfid
  "/home/turtlebot/xu_slam/src/rfid/msg/RFIDreadRow.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rfid
)
_generate_msg_py(rfid
  "/home/turtlebot/xu_slam/src/rfid/msg/TransferData.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rfid
)

### Generating Services

### Generating Module File
_generate_module_py(rfid
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rfid
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(rfid_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(rfid_generate_messages rfid_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/turtlebot/xu_slam/src/rfid/msg/TransferData.msg" NAME_WE)
add_dependencies(rfid_generate_messages_py _rfid_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot/xu_slam/src/rfid/msg/RFIDreadRow.msg" NAME_WE)
add_dependencies(rfid_generate_messages_py _rfid_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot/xu_slam/src/rfid/msg/rfid_odom.msg" NAME_WE)
add_dependencies(rfid_generate_messages_py _rfid_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/turtlebot/xu_slam/src/rfid/msg/rfid_info.msg" NAME_WE)
add_dependencies(rfid_generate_messages_py _rfid_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rfid_genpy)
add_dependencies(rfid_genpy rfid_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rfid_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rfid)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rfid
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(rfid_generate_messages_cpp std_msgs_generate_messages_cpp)
add_dependencies(rfid_generate_messages_cpp nav_msgs_generate_messages_cpp)
add_dependencies(rfid_generate_messages_cpp geometry_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rfid)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rfid
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(rfid_generate_messages_lisp std_msgs_generate_messages_lisp)
add_dependencies(rfid_generate_messages_lisp nav_msgs_generate_messages_lisp)
add_dependencies(rfid_generate_messages_lisp geometry_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rfid)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rfid\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rfid
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(rfid_generate_messages_py std_msgs_generate_messages_py)
add_dependencies(rfid_generate_messages_py nav_msgs_generate_messages_py)
add_dependencies(rfid_generate_messages_py geometry_msgs_generate_messages_py)
