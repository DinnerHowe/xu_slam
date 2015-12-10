; Auto-generated. Do not edit!


(cl:in-package web_map-msg)


;//! \htmlinclude ort2D.msg.html

(cl:defclass <ort2D> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0))
)

(cl:defclass ort2D (<ort2D>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ort2D>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ort2D)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name web_map-msg:<ort2D> is deprecated: use web_map-msg:ort2D instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <ort2D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader web_map-msg:x-val is deprecated.  Use web_map-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <ort2D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader web_map-msg:y-val is deprecated.  Use web_map-msg:y instead.")
  (y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ort2D>) ostream)
  "Serializes a message object of type '<ort2D>"
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
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ort2D>) istream)
  "Deserializes a message object of type '<ort2D>"
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
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ort2D>)))
  "Returns string type for a message object of type '<ort2D>"
  "web_map/ort2D")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ort2D)))
  "Returns string type for a message object of type 'ort2D"
  "web_map/ort2D")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ort2D>)))
  "Returns md5sum for a message object of type '<ort2D>"
  "ff8d7d66dd3e4b731ef14a45d38888b6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ort2D)))
  "Returns md5sum for a message object of type 'ort2D"
  "ff8d7d66dd3e4b731ef14a45d38888b6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ort2D>)))
  "Returns full string definition for message of type '<ort2D>"
  (cl:format cl:nil "float32 x~%float32 y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ort2D)))
  "Returns full string definition for message of type 'ort2D"
  (cl:format cl:nil "float32 x~%float32 y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ort2D>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ort2D>))
  "Converts a ROS message object to a list"
  (cl:list 'ort2D
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
))
