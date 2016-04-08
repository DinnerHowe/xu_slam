; Auto-generated. Do not edit!


(cl:in-package robot_status-msg)


;//! \htmlinclude map_odom.msg.html

(cl:defclass <map_odom> (roslisp-msg-protocol:ros-message)
  ((data
    :reader data
    :initarg :data
    :type cl:string
    :initform "")
   (pose
    :reader pose
    :initarg :pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose)))
)

(cl:defclass map_odom (<map_odom>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <map_odom>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'map_odom)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_status-msg:<map_odom> is deprecated: use robot_status-msg:map_odom instead.")))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <map_odom>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_status-msg:data-val is deprecated.  Use robot_status-msg:data instead.")
  (data m))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <map_odom>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_status-msg:pose-val is deprecated.  Use robot_status-msg:pose instead.")
  (pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <map_odom>) ostream)
  "Serializes a message object of type '<map_odom>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'data))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <map_odom>) istream)
  "Deserializes a message object of type '<map_odom>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'data) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'data) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<map_odom>)))
  "Returns string type for a message object of type '<map_odom>"
  "robot_status/map_odom")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'map_odom)))
  "Returns string type for a message object of type 'map_odom"
  "robot_status/map_odom")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<map_odom>)))
  "Returns md5sum for a message object of type '<map_odom>"
  "77e2ff6a5052345f4a4bd7f9d49276c8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'map_odom)))
  "Returns md5sum for a message object of type 'map_odom"
  "77e2ff6a5052345f4a4bd7f9d49276c8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<map_odom>)))
  "Returns full string definition for message of type '<map_odom>"
  (cl:format cl:nil "string data~%geometry_msgs/Pose pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'map_odom)))
  "Returns full string definition for message of type 'map_odom"
  (cl:format cl:nil "string data~%geometry_msgs/Pose pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <map_odom>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'data))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <map_odom>))
  "Converts a ROS message object to a list"
  (cl:list 'map_odom
    (cl:cons ':data (data msg))
    (cl:cons ':pose (pose msg))
))
