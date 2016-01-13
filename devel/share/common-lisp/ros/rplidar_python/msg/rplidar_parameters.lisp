; Auto-generated. Do not edit!


(cl:in-package rplidar_python-msg)


;//! \htmlinclude rplidar_parameters.msg.html

(cl:defclass <rplidar_parameters> (roslisp-msg-protocol:ros-message)
  ((angle_max
    :reader angle_max
    :initarg :angle_max
    :type cl:float
    :initform 0.0)
   (angle_min
    :reader angle_min
    :initarg :angle_min
    :type cl:float
    :initform 0.0)
   (angle_increment
    :reader angle_increment
    :initarg :angle_increment
    :type cl:float
    :initform 0.0)
   (time_increment
    :reader time_increment
    :initarg :time_increment
    :type cl:float
    :initform 0.0)
   (scan_time
    :reader scan_time
    :initarg :scan_time
    :type cl:float
    :initform 0.0)
   (range_min
    :reader range_min
    :initarg :range_min
    :type cl:float
    :initform 0.0)
   (range_max
    :reader range_max
    :initarg :range_max
    :type cl:float
    :initform 0.0)
   (frame
    :reader frame
    :initarg :frame
    :type cl:integer
    :initform 0))
)

(cl:defclass rplidar_parameters (<rplidar_parameters>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <rplidar_parameters>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'rplidar_parameters)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rplidar_python-msg:<rplidar_parameters> is deprecated: use rplidar_python-msg:rplidar_parameters instead.")))

(cl:ensure-generic-function 'angle_max-val :lambda-list '(m))
(cl:defmethod angle_max-val ((m <rplidar_parameters>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rplidar_python-msg:angle_max-val is deprecated.  Use rplidar_python-msg:angle_max instead.")
  (angle_max m))

(cl:ensure-generic-function 'angle_min-val :lambda-list '(m))
(cl:defmethod angle_min-val ((m <rplidar_parameters>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rplidar_python-msg:angle_min-val is deprecated.  Use rplidar_python-msg:angle_min instead.")
  (angle_min m))

(cl:ensure-generic-function 'angle_increment-val :lambda-list '(m))
(cl:defmethod angle_increment-val ((m <rplidar_parameters>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rplidar_python-msg:angle_increment-val is deprecated.  Use rplidar_python-msg:angle_increment instead.")
  (angle_increment m))

(cl:ensure-generic-function 'time_increment-val :lambda-list '(m))
(cl:defmethod time_increment-val ((m <rplidar_parameters>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rplidar_python-msg:time_increment-val is deprecated.  Use rplidar_python-msg:time_increment instead.")
  (time_increment m))

(cl:ensure-generic-function 'scan_time-val :lambda-list '(m))
(cl:defmethod scan_time-val ((m <rplidar_parameters>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rplidar_python-msg:scan_time-val is deprecated.  Use rplidar_python-msg:scan_time instead.")
  (scan_time m))

(cl:ensure-generic-function 'range_min-val :lambda-list '(m))
(cl:defmethod range_min-val ((m <rplidar_parameters>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rplidar_python-msg:range_min-val is deprecated.  Use rplidar_python-msg:range_min instead.")
  (range_min m))

(cl:ensure-generic-function 'range_max-val :lambda-list '(m))
(cl:defmethod range_max-val ((m <rplidar_parameters>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rplidar_python-msg:range_max-val is deprecated.  Use rplidar_python-msg:range_max instead.")
  (range_max m))

(cl:ensure-generic-function 'frame-val :lambda-list '(m))
(cl:defmethod frame-val ((m <rplidar_parameters>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rplidar_python-msg:frame-val is deprecated.  Use rplidar_python-msg:frame instead.")
  (frame m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <rplidar_parameters>) ostream)
  "Serializes a message object of type '<rplidar_parameters>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angle_max))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angle_min))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angle_increment))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'time_increment))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'scan_time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'range_min))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'range_max))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'frame)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'frame)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'frame)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'frame)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'frame)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'frame)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'frame)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'frame)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <rplidar_parameters>) istream)
  "Deserializes a message object of type '<rplidar_parameters>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angle_max) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angle_min) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angle_increment) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'time_increment) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'scan_time) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'range_min) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'range_max) (roslisp-utils:decode-single-float-bits bits)))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<rplidar_parameters>)))
  "Returns string type for a message object of type '<rplidar_parameters>"
  "rplidar_python/rplidar_parameters")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'rplidar_parameters)))
  "Returns string type for a message object of type 'rplidar_parameters"
  "rplidar_python/rplidar_parameters")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<rplidar_parameters>)))
  "Returns md5sum for a message object of type '<rplidar_parameters>"
  "05c2b16c1f8f5bfc65f2cc4796b6a278")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'rplidar_parameters)))
  "Returns md5sum for a message object of type 'rplidar_parameters"
  "05c2b16c1f8f5bfc65f2cc4796b6a278")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<rplidar_parameters>)))
  "Returns full string definition for message of type '<rplidar_parameters>"
  (cl:format cl:nil "float32 angle_max~%float32 angle_min~%float32 angle_increment~%float32 time_increment~%float32 scan_time~%float32 range_min~%float32 range_max~%uint64 frame~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'rplidar_parameters)))
  "Returns full string definition for message of type 'rplidar_parameters"
  (cl:format cl:nil "float32 angle_max~%float32 angle_min~%float32 angle_increment~%float32 time_increment~%float32 scan_time~%float32 range_min~%float32 range_max~%uint64 frame~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <rplidar_parameters>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
     4
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <rplidar_parameters>))
  "Converts a ROS message object to a list"
  (cl:list 'rplidar_parameters
    (cl:cons ':angle_max (angle_max msg))
    (cl:cons ':angle_min (angle_min msg))
    (cl:cons ':angle_increment (angle_increment msg))
    (cl:cons ':time_increment (time_increment msg))
    (cl:cons ':scan_time (scan_time msg))
    (cl:cons ':range_min (range_min msg))
    (cl:cons ':range_max (range_max msg))
    (cl:cons ':frame (frame msg))
))
