; Auto-generated. Do not edit!


(cl:in-package facerobot-srv)


;//! \htmlinclude sound_synthesis-request.msg.html

(cl:defclass <sound_synthesis-request> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform ""))
)

(cl:defclass sound_synthesis-request (<sound_synthesis-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <sound_synthesis-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'sound_synthesis-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name facerobot-srv:<sound_synthesis-request> is deprecated: use facerobot-srv:sound_synthesis-request instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <sound_synthesis-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader facerobot-srv:name-val is deprecated.  Use facerobot-srv:name instead.")
  (name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <sound_synthesis-request>) ostream)
  "Serializes a message object of type '<sound_synthesis-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <sound_synthesis-request>) istream)
  "Deserializes a message object of type '<sound_synthesis-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<sound_synthesis-request>)))
  "Returns string type for a service object of type '<sound_synthesis-request>"
  "facerobot/sound_synthesisRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'sound_synthesis-request)))
  "Returns string type for a service object of type 'sound_synthesis-request"
  "facerobot/sound_synthesisRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<sound_synthesis-request>)))
  "Returns md5sum for a message object of type '<sound_synthesis-request>"
  "0bac347fe4d77e1d1284a23a97504d84")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'sound_synthesis-request)))
  "Returns md5sum for a message object of type 'sound_synthesis-request"
  "0bac347fe4d77e1d1284a23a97504d84")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<sound_synthesis-request>)))
  "Returns full string definition for message of type '<sound_synthesis-request>"
  (cl:format cl:nil "string name~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'sound_synthesis-request)))
  "Returns full string definition for message of type 'sound_synthesis-request"
  (cl:format cl:nil "string name~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <sound_synthesis-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <sound_synthesis-request>))
  "Converts a ROS message object to a list"
  (cl:list 'sound_synthesis-request
    (cl:cons ':name (name msg))
))
;//! \htmlinclude sound_synthesis-response.msg.html

(cl:defclass <sound_synthesis-response> (roslisp-msg-protocol:ros-message)
  ((Heared
    :reader Heared
    :initarg :Heared
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass sound_synthesis-response (<sound_synthesis-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <sound_synthesis-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'sound_synthesis-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name facerobot-srv:<sound_synthesis-response> is deprecated: use facerobot-srv:sound_synthesis-response instead.")))

(cl:ensure-generic-function 'Heared-val :lambda-list '(m))
(cl:defmethod Heared-val ((m <sound_synthesis-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader facerobot-srv:Heared-val is deprecated.  Use facerobot-srv:Heared instead.")
  (Heared m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <sound_synthesis-response>) ostream)
  "Serializes a message object of type '<sound_synthesis-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'Heared) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <sound_synthesis-response>) istream)
  "Deserializes a message object of type '<sound_synthesis-response>"
    (cl:setf (cl:slot-value msg 'Heared) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<sound_synthesis-response>)))
  "Returns string type for a service object of type '<sound_synthesis-response>"
  "facerobot/sound_synthesisResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'sound_synthesis-response)))
  "Returns string type for a service object of type 'sound_synthesis-response"
  "facerobot/sound_synthesisResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<sound_synthesis-response>)))
  "Returns md5sum for a message object of type '<sound_synthesis-response>"
  "0bac347fe4d77e1d1284a23a97504d84")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'sound_synthesis-response)))
  "Returns md5sum for a message object of type 'sound_synthesis-response"
  "0bac347fe4d77e1d1284a23a97504d84")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<sound_synthesis-response>)))
  "Returns full string definition for message of type '<sound_synthesis-response>"
  (cl:format cl:nil "bool Heared~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'sound_synthesis-response)))
  "Returns full string definition for message of type 'sound_synthesis-response"
  (cl:format cl:nil "bool Heared~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <sound_synthesis-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <sound_synthesis-response>))
  "Converts a ROS message object to a list"
  (cl:list 'sound_synthesis-response
    (cl:cons ':Heared (Heared msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'sound_synthesis)))
  'sound_synthesis-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'sound_synthesis)))
  'sound_synthesis-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'sound_synthesis)))
  "Returns string type for a service object of type '<sound_synthesis>"
  "facerobot/sound_synthesis")