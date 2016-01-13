; Auto-generated. Do not edit!


(cl:in-package rfid-msg)


;//! \htmlinclude rfid_odom.msg.html

(cl:defclass <rfid_odom> (roslisp-msg-protocol:ros-message)
  ((pose
    :reader pose
    :initarg :pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose))
   (id
    :reader id
    :initarg :id
    :type cl:string
    :initform ""))
)

(cl:defclass rfid_odom (<rfid_odom>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <rfid_odom>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'rfid_odom)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rfid-msg:<rfid_odom> is deprecated: use rfid-msg:rfid_odom instead.")))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <rfid_odom>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rfid-msg:pose-val is deprecated.  Use rfid-msg:pose instead.")
  (pose m))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <rfid_odom>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rfid-msg:id-val is deprecated.  Use rfid-msg:id instead.")
  (id m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <rfid_odom>) ostream)
  "Serializes a message object of type '<rfid_odom>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'id))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <rfid_odom>) istream)
  "Deserializes a message object of type '<rfid_odom>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<rfid_odom>)))
  "Returns string type for a message object of type '<rfid_odom>"
  "rfid/rfid_odom")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'rfid_odom)))
  "Returns string type for a message object of type 'rfid_odom"
  "rfid/rfid_odom")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<rfid_odom>)))
  "Returns md5sum for a message object of type '<rfid_odom>"
  "64492c0a6f5f2df870b5c1ef882b6e99")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'rfid_odom)))
  "Returns md5sum for a message object of type 'rfid_odom"
  "64492c0a6f5f2df870b5c1ef882b6e99")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<rfid_odom>)))
  "Returns full string definition for message of type '<rfid_odom>"
  (cl:format cl:nil "geometry_msgs/Pose pose~%string id~%~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'rfid_odom)))
  "Returns full string definition for message of type 'rfid_odom"
  (cl:format cl:nil "geometry_msgs/Pose pose~%string id~%~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <rfid_odom>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
     4 (cl:length (cl:slot-value msg 'id))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <rfid_odom>))
  "Converts a ROS message object to a list"
  (cl:list 'rfid_odom
    (cl:cons ':pose (pose msg))
    (cl:cons ':id (id msg))
))
