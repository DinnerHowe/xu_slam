; Auto-generated. Do not edit!


(cl:in-package rfid_handle-msg)


;//! \htmlinclude probability.msg.html

(cl:defclass <probability> (roslisp-msg-protocol:ros-message)
  ((probability
    :reader probability
    :initarg :probability
    :type cl:string
    :initform ""))
)

(cl:defclass probability (<probability>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <probability>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'probability)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rfid_handle-msg:<probability> is deprecated: use rfid_handle-msg:probability instead.")))

(cl:ensure-generic-function 'probability-val :lambda-list '(m))
(cl:defmethod probability-val ((m <probability>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rfid_handle-msg:probability-val is deprecated.  Use rfid_handle-msg:probability instead.")
  (probability m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <probability>) ostream)
  "Serializes a message object of type '<probability>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'probability))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'probability))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <probability>) istream)
  "Deserializes a message object of type '<probability>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'probability) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'probability) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<probability>)))
  "Returns string type for a message object of type '<probability>"
  "rfid_handle/probability")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'probability)))
  "Returns string type for a message object of type 'probability"
  "rfid_handle/probability")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<probability>)))
  "Returns md5sum for a message object of type '<probability>"
  "bd9bfe66ae445cc5d5c104507b89168d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'probability)))
  "Returns md5sum for a message object of type 'probability"
  "bd9bfe66ae445cc5d5c104507b89168d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<probability>)))
  "Returns full string definition for message of type '<probability>"
  (cl:format cl:nil "string probability~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'probability)))
  "Returns full string definition for message of type 'probability"
  (cl:format cl:nil "string probability~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <probability>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'probability))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <probability>))
  "Converts a ROS message object to a list"
  (cl:list 'probability
    (cl:cons ':probability (probability msg))
))
