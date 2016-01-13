; Auto-generated. Do not edit!


(cl:in-package slam_main-msg)


;//! \htmlinclude orientation.msg.html

(cl:defclass <orientation> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
   (z
    :reader z
    :initarg :z
    :type cl:float
    :initform 0.0)
   (w
    :reader w
    :initarg :w
    :type cl:float
    :initform 0.0))
)

(cl:defclass orientation (<orientation>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <orientation>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'orientation)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name slam_main-msg:<orientation> is deprecated: use slam_main-msg:orientation instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <orientation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slam_main-msg:x-val is deprecated.  Use slam_main-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <orientation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slam_main-msg:y-val is deprecated.  Use slam_main-msg:y instead.")
  (y m))

(cl:ensure-generic-function 'z-val :lambda-list '(m))
(cl:defmethod z-val ((m <orientation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slam_main-msg:z-val is deprecated.  Use slam_main-msg:z instead.")
  (z m))

(cl:ensure-generic-function 'w-val :lambda-list '(m))
(cl:defmethod w-val ((m <orientation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slam_main-msg:w-val is deprecated.  Use slam_main-msg:w instead.")
  (w m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <orientation>) ostream)
  "Serializes a message object of type '<orientation>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'w))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <orientation>) istream)
  "Deserializes a message object of type '<orientation>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'z) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'w) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<orientation>)))
  "Returns string type for a message object of type '<orientation>"
  "slam_main/orientation")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'orientation)))
  "Returns string type for a message object of type 'orientation"
  "slam_main/orientation")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<orientation>)))
  "Returns md5sum for a message object of type '<orientation>"
  "c3a70de85a9dd451c31fa86cab10a939")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'orientation)))
  "Returns md5sum for a message object of type 'orientation"
  "c3a70de85a9dd451c31fa86cab10a939")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<orientation>)))
  "Returns full string definition for message of type '<orientation>"
  (cl:format cl:nil "float32 x~%float32 y~%float32 z~%float32 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'orientation)))
  "Returns full string definition for message of type 'orientation"
  (cl:format cl:nil "float32 x~%float32 y~%float32 z~%float32 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <orientation>))
  (cl:+ 0
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <orientation>))
  "Converts a ROS message object to a list"
  (cl:list 'orientation
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':z (z msg))
    (cl:cons ':w (w msg))
))
