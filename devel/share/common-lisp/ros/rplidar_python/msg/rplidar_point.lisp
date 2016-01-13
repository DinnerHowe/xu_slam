; Auto-generated. Do not edit!


(cl:in-package rplidar_python-msg)


;//! \htmlinclude rplidar_point.msg.html

(cl:defclass <rplidar_point> (roslisp-msg-protocol:ros-message)
  ((point
    :reader point
    :initarg :point
    :type cl:string
    :initform "")
   (frame
    :reader frame
    :initarg :frame
    :type cl:integer
    :initform 0))
)

(cl:defclass rplidar_point (<rplidar_point>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <rplidar_point>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'rplidar_point)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rplidar_python-msg:<rplidar_point> is deprecated: use rplidar_python-msg:rplidar_point instead.")))

(cl:ensure-generic-function 'point-val :lambda-list '(m))
(cl:defmethod point-val ((m <rplidar_point>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rplidar_python-msg:point-val is deprecated.  Use rplidar_python-msg:point instead.")
  (point m))

(cl:ensure-generic-function 'frame-val :lambda-list '(m))
(cl:defmethod frame-val ((m <rplidar_point>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rplidar_python-msg:frame-val is deprecated.  Use rplidar_python-msg:frame instead.")
  (frame m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <rplidar_point>) ostream)
  "Serializes a message object of type '<rplidar_point>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'point))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'point))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'frame)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'frame)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'frame)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'frame)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'frame)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'frame)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'frame)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'frame)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <rplidar_point>) istream)
  "Deserializes a message object of type '<rplidar_point>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'point) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'point) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'frame)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'frame)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'frame)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'frame)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'frame)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'frame)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'frame)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'frame)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<rplidar_point>)))
  "Returns string type for a message object of type '<rplidar_point>"
  "rplidar_python/rplidar_point")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'rplidar_point)))
  "Returns string type for a message object of type 'rplidar_point"
  "rplidar_python/rplidar_point")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<rplidar_point>)))
  "Returns md5sum for a message object of type '<rplidar_point>"
  "aa899acdbb1820f1c69580996b2593eb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'rplidar_point)))
  "Returns md5sum for a message object of type 'rplidar_point"
  "aa899acdbb1820f1c69580996b2593eb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<rplidar_point>)))
  "Returns full string definition for message of type '<rplidar_point>"
  (cl:format cl:nil "string point~%uint64 frame~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'rplidar_point)))
  "Returns full string definition for message of type 'rplidar_point"
  (cl:format cl:nil "string point~%uint64 frame~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <rplidar_point>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'point))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <rplidar_point>))
  "Converts a ROS message object to a list"
  (cl:list 'rplidar_point
    (cl:cons ':point (point msg))
    (cl:cons ':frame (frame msg))
))
