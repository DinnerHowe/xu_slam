; Auto-generated. Do not edit!


(cl:in-package robot_status-msg)


;//! \htmlinclude robot_odom.msg.html

(cl:defclass <robot_odom> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (position
    :reader position
    :initarg :position
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (rotation
    :reader rotation
    :initarg :rotation
    :type geometry_msgs-msg:Quaternion
    :initform (cl:make-instance 'geometry_msgs-msg:Quaternion)))
)

(cl:defclass robot_odom (<robot_odom>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <robot_odom>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'robot_odom)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_status-msg:<robot_odom> is deprecated: use robot_status-msg:robot_odom instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <robot_odom>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_status-msg:header-val is deprecated.  Use robot_status-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <robot_odom>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_status-msg:position-val is deprecated.  Use robot_status-msg:position instead.")
  (position m))

(cl:ensure-generic-function 'rotation-val :lambda-list '(m))
(cl:defmethod rotation-val ((m <robot_odom>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_status-msg:rotation-val is deprecated.  Use robot_status-msg:rotation instead.")
  (rotation m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <robot_odom>) ostream)
  "Serializes a message object of type '<robot_odom>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'position) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'rotation) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <robot_odom>) istream)
  "Deserializes a message object of type '<robot_odom>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'position) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'rotation) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<robot_odom>)))
  "Returns string type for a message object of type '<robot_odom>"
  "robot_status/robot_odom")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'robot_odom)))
  "Returns string type for a message object of type 'robot_odom"
  "robot_status/robot_odom")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<robot_odom>)))
  "Returns md5sum for a message object of type '<robot_odom>"
  "1fbdeee4d83cf4eba146c1188932aaee")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'robot_odom)))
  "Returns md5sum for a message object of type 'robot_odom"
  "1fbdeee4d83cf4eba146c1188932aaee")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<robot_odom>)))
  "Returns full string definition for message of type '<robot_odom>"
  (cl:format cl:nil "std_msgs/Header header~%geometry_msgs/Point position~%geometry_msgs/Quaternion rotation~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'robot_odom)))
  "Returns full string definition for message of type 'robot_odom"
  (cl:format cl:nil "std_msgs/Header header~%geometry_msgs/Point position~%geometry_msgs/Quaternion rotation~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <robot_odom>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'position))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'rotation))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <robot_odom>))
  "Converts a ROS message object to a list"
  (cl:list 'robot_odom
    (cl:cons ':header (header msg))
    (cl:cons ':position (position msg))
    (cl:cons ':rotation (rotation msg))
))
