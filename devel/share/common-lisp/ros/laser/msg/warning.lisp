; Auto-generated. Do not edit!


(cl:in-package laser-msg)


;//! \htmlinclude warning.msg.html

(cl:defclass <warning> (roslisp-msg-protocol:ros-message)
  ((warning
    :reader warning
    :initarg :warning
    :type cl:string
    :initform ""))
)

(cl:defclass warning (<warning>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <warning>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'warning)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name laser-msg:<warning> is deprecated: use laser-msg:warning instead.")))

(cl:ensure-generic-function 'warning-val :lambda-list '(m))
(cl:defmethod warning-val ((m <warning>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser-msg:warning-val is deprecated.  Use laser-msg:warning instead.")
  (warning m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <warning>) ostream)
  "Serializes a message object of type '<warning>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'warning))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'warning))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <warning>) istream)
  "Deserializes a message object of type '<warning>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'warning) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'warning) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<warning>)))
  "Returns string type for a message object of type '<warning>"
  "laser/warning")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'warning)))
  "Returns string type for a message object of type 'warning"
  "laser/warning")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<warning>)))
  "Returns md5sum for a message object of type '<warning>"
  "dd40b7d5c92cc8716f9a8241b06333cd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'warning)))
  "Returns md5sum for a message object of type 'warning"
  "dd40b7d5c92cc8716f9a8241b06333cd")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<warning>)))
  "Returns full string definition for message of type '<warning>"
  (cl:format cl:nil "string warning~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'warning)))
  "Returns full string definition for message of type 'warning"
  (cl:format cl:nil "string warning~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <warning>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'warning))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <warning>))
  "Converts a ROS message object to a list"
  (cl:list 'warning
    (cl:cons ':warning (warning msg))
))
