; Auto-generated. Do not edit!


(cl:in-package facerobot-srv)


;//! \htmlinclude greeting-request.msg.html

(cl:defclass <greeting-request> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform ""))
)

(cl:defclass greeting-request (<greeting-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <greeting-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'greeting-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name facerobot-srv:<greeting-request> is deprecated: use facerobot-srv:greeting-request instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <greeting-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader facerobot-srv:name-val is deprecated.  Use facerobot-srv:name instead.")
  (name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <greeting-request>) ostream)
  "Serializes a message object of type '<greeting-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <greeting-request>) istream)
  "Deserializes a message object of type '<greeting-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<greeting-request>)))
  "Returns string type for a service object of type '<greeting-request>"
  "facerobot/greetingRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'greeting-request)))
  "Returns string type for a service object of type 'greeting-request"
  "facerobot/greetingRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<greeting-request>)))
  "Returns md5sum for a message object of type '<greeting-request>"
  "0bac347fe4d77e1d1284a23a97504d84")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'greeting-request)))
  "Returns md5sum for a message object of type 'greeting-request"
  "0bac347fe4d77e1d1284a23a97504d84")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<greeting-request>)))
  "Returns full string definition for message of type '<greeting-request>"
  (cl:format cl:nil "string name~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'greeting-request)))
  "Returns full string definition for message of type 'greeting-request"
  (cl:format cl:nil "string name~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <greeting-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <greeting-request>))
  "Converts a ROS message object to a list"
  (cl:list 'greeting-request
    (cl:cons ':name (name msg))
))
;//! \htmlinclude greeting-response.msg.html

(cl:defclass <greeting-response> (roslisp-msg-protocol:ros-message)
  ((Heared
    :reader Heared
    :initarg :Heared
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass greeting-response (<greeting-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <greeting-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'greeting-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name facerobot-srv:<greeting-response> is deprecated: use facerobot-srv:greeting-response instead.")))

(cl:ensure-generic-function 'Heared-val :lambda-list '(m))
(cl:defmethod Heared-val ((m <greeting-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader facerobot-srv:Heared-val is deprecated.  Use facerobot-srv:Heared instead.")
  (Heared m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <greeting-response>) ostream)
  "Serializes a message object of type '<greeting-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'Heared) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <greeting-response>) istream)
  "Deserializes a message object of type '<greeting-response>"
    (cl:setf (cl:slot-value msg 'Heared) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<greeting-response>)))
  "Returns string type for a service object of type '<greeting-response>"
  "facerobot/greetingResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'greeting-response)))
  "Returns string type for a service object of type 'greeting-response"
  "facerobot/greetingResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<greeting-response>)))
  "Returns md5sum for a message object of type '<greeting-response>"
  "0bac347fe4d77e1d1284a23a97504d84")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'greeting-response)))
  "Returns md5sum for a message object of type 'greeting-response"
  "0bac347fe4d77e1d1284a23a97504d84")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<greeting-response>)))
  "Returns full string definition for message of type '<greeting-response>"
  (cl:format cl:nil "bool Heared~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'greeting-response)))
  "Returns full string definition for message of type 'greeting-response"
  (cl:format cl:nil "bool Heared~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <greeting-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <greeting-response>))
  "Converts a ROS message object to a list"
  (cl:list 'greeting-response
    (cl:cons ':Heared (Heared msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'greeting)))
  'greeting-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'greeting)))
  'greeting-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'greeting)))
  "Returns string type for a service object of type '<greeting>"
  "facerobot/greeting")