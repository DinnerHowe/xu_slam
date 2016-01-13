; Auto-generated. Do not edit!


(cl:in-package web_map-msg)


;//! \htmlinclude web_odom.msg.html

(cl:defclass <web_odom> (roslisp-msg-protocol:ros-message)
  ((orta_pose
    :reader orta_pose
    :initarg :orta_pose
    :type web_map-msg:ort2D
    :initform (cl:make-instance 'web_map-msg:ort2D))
   (pose
    :reader pose
    :initarg :pose
    :type geometry_msgs-msg:Pose2D
    :initform (cl:make-instance 'geometry_msgs-msg:Pose2D)))
)

(cl:defclass web_odom (<web_odom>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <web_odom>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'web_odom)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name web_map-msg:<web_odom> is deprecated: use web_map-msg:web_odom instead.")))

(cl:ensure-generic-function 'orta_pose-val :lambda-list '(m))
(cl:defmethod orta_pose-val ((m <web_odom>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader web_map-msg:orta_pose-val is deprecated.  Use web_map-msg:orta_pose instead.")
  (orta_pose m))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <web_odom>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader web_map-msg:pose-val is deprecated.  Use web_map-msg:pose instead.")
  (pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <web_odom>) ostream)
  "Serializes a message object of type '<web_odom>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'orta_pose) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <web_odom>) istream)
  "Deserializes a message object of type '<web_odom>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'orta_pose) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<web_odom>)))
  "Returns string type for a message object of type '<web_odom>"
  "web_map/web_odom")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'web_odom)))
  "Returns string type for a message object of type 'web_odom"
  "web_map/web_odom")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<web_odom>)))
  "Returns md5sum for a message object of type '<web_odom>"
  "2144b540a38501e83ba7565dedbdbe49")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'web_odom)))
  "Returns md5sum for a message object of type 'web_odom"
  "2144b540a38501e83ba7565dedbdbe49")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<web_odom>)))
  "Returns full string definition for message of type '<web_odom>"
  (cl:format cl:nil "web_map/ort2D orta_pose~%geometry_msgs/Pose2D pose~%~%================================================================================~%MSG: web_map/ort2D~%float32 x~%float32 y~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'web_odom)))
  "Returns full string definition for message of type 'web_odom"
  (cl:format cl:nil "web_map/ort2D orta_pose~%geometry_msgs/Pose2D pose~%~%================================================================================~%MSG: web_map/ort2D~%float32 x~%float32 y~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <web_odom>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'orta_pose))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <web_odom>))
  "Converts a ROS message object to a list"
  (cl:list 'web_odom
    (cl:cons ':orta_pose (orta_pose msg))
    (cl:cons ':pose (pose msg))
))
