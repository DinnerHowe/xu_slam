; Auto-generated. Do not edit!


(cl:in-package facerobot-srv)


;//! \htmlinclude voiceRecog-request.msg.html

(cl:defclass <voiceRecog-request> (roslisp-msg-protocol:ros-message)
  ((trigger
    :reader trigger
    :initarg :trigger
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass voiceRecog-request (<voiceRecog-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <voiceRecog-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'voiceRecog-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name facerobot-srv:<voiceRecog-request> is deprecated: use facerobot-srv:voiceRecog-request instead.")))

(cl:ensure-generic-function 'trigger-val :lambda-list '(m))
(cl:defmethod trigger-val ((m <voiceRecog-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader facerobot-srv:trigger-val is deprecated.  Use facerobot-srv:trigger instead.")
  (trigger m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <voiceRecog-request>) ostream)
  "Serializes a message object of type '<voiceRecog-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'trigger) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <voiceRecog-request>) istream)
  "Deserializes a message object of type '<voiceRecog-request>"
    (cl:setf (cl:slot-value msg 'trigger) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<voiceRecog-request>)))
  "Returns string type for a service object of type '<voiceRecog-request>"
  "facerobot/voiceRecogRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'voiceRecog-request)))
  "Returns string type for a service object of type 'voiceRecog-request"
  "facerobot/voiceRecogRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<voiceRecog-request>)))
  "Returns md5sum for a message object of type '<voiceRecog-request>"
  "4dbe3fedfe440cb743ba27bf8c422fe7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'voiceRecog-request)))
  "Returns md5sum for a message object of type 'voiceRecog-request"
  "4dbe3fedfe440cb743ba27bf8c422fe7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<voiceRecog-request>)))
  "Returns full string definition for message of type '<voiceRecog-request>"
  (cl:format cl:nil "bool trigger~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'voiceRecog-request)))
  "Returns full string definition for message of type 'voiceRecog-request"
  (cl:format cl:nil "bool trigger~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <voiceRecog-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <voiceRecog-request>))
  "Converts a ROS message object to a list"
  (cl:list 'voiceRecog-request
    (cl:cons ':trigger (trigger msg))
))
;//! \htmlinclude voiceRecog-response.msg.html

(cl:defclass <voiceRecog-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:string
    :initform ""))
)

(cl:defclass voiceRecog-response (<voiceRecog-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <voiceRecog-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'voiceRecog-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name facerobot-srv:<voiceRecog-response> is deprecated: use facerobot-srv:voiceRecog-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <voiceRecog-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader facerobot-srv:result-val is deprecated.  Use facerobot-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <voiceRecog-response>) ostream)
  "Serializes a message object of type '<voiceRecog-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'result))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'result))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <voiceRecog-response>) istream)
  "Deserializes a message object of type '<voiceRecog-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'result) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'result) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<voiceRecog-response>)))
  "Returns string type for a service object of type '<voiceRecog-response>"
  "facerobot/voiceRecogResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'voiceRecog-response)))
  "Returns string type for a service object of type 'voiceRecog-response"
  "facerobot/voiceRecogResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<voiceRecog-response>)))
  "Returns md5sum for a message object of type '<voiceRecog-response>"
  "4dbe3fedfe440cb743ba27bf8c422fe7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'voiceRecog-response)))
  "Returns md5sum for a message object of type 'voiceRecog-response"
  "4dbe3fedfe440cb743ba27bf8c422fe7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<voiceRecog-response>)))
  "Returns full string definition for message of type '<voiceRecog-response>"
  (cl:format cl:nil "string result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'voiceRecog-response)))
  "Returns full string definition for message of type 'voiceRecog-response"
  (cl:format cl:nil "string result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <voiceRecog-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'result))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <voiceRecog-response>))
  "Converts a ROS message object to a list"
  (cl:list 'voiceRecog-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'voiceRecog)))
  'voiceRecog-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'voiceRecog)))
  'voiceRecog-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'voiceRecog)))
  "Returns string type for a service object of type '<voiceRecog>"
  "facerobot/voiceRecog")