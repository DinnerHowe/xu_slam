; Auto-generated. Do not edit!


(cl:in-package robot_status-srv)


;//! \htmlinclude launch_amcl-request.msg.html

(cl:defclass <launch_amcl-request> (roslisp-msg-protocol:ros-message)
  ((start
    :reader start
    :initarg :start
    :type cl:string
    :initform ""))
)

(cl:defclass launch_amcl-request (<launch_amcl-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <launch_amcl-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'launch_amcl-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_status-srv:<launch_amcl-request> is deprecated: use robot_status-srv:launch_amcl-request instead.")))

(cl:ensure-generic-function 'start-val :lambda-list '(m))
(cl:defmethod start-val ((m <launch_amcl-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_status-srv:start-val is deprecated.  Use robot_status-srv:start instead.")
  (start m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <launch_amcl-request>) ostream)
  "Serializes a message object of type '<launch_amcl-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'start))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'start))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <launch_amcl-request>) istream)
  "Deserializes a message object of type '<launch_amcl-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'start) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'start) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<launch_amcl-request>)))
  "Returns string type for a service object of type '<launch_amcl-request>"
  "robot_status/launch_amclRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'launch_amcl-request)))
  "Returns string type for a service object of type 'launch_amcl-request"
  "robot_status/launch_amclRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<launch_amcl-request>)))
  "Returns md5sum for a message object of type '<launch_amcl-request>"
  "fa28e77b8a1dcde11cf9b68339ca8216")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'launch_amcl-request)))
  "Returns md5sum for a message object of type 'launch_amcl-request"
  "fa28e77b8a1dcde11cf9b68339ca8216")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<launch_amcl-request>)))
  "Returns full string definition for message of type '<launch_amcl-request>"
  (cl:format cl:nil "string start~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'launch_amcl-request)))
  "Returns full string definition for message of type 'launch_amcl-request"
  (cl:format cl:nil "string start~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <launch_amcl-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'start))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <launch_amcl-request>))
  "Converts a ROS message object to a list"
  (cl:list 'launch_amcl-request
    (cl:cons ':start (start msg))
))
;//! \htmlinclude launch_amcl-response.msg.html

(cl:defclass <launch_amcl-response> (roslisp-msg-protocol:ros-message)
  ((finish
    :reader finish
    :initarg :finish
    :type cl:string
    :initform ""))
)

(cl:defclass launch_amcl-response (<launch_amcl-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <launch_amcl-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'launch_amcl-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_status-srv:<launch_amcl-response> is deprecated: use robot_status-srv:launch_amcl-response instead.")))

(cl:ensure-generic-function 'finish-val :lambda-list '(m))
(cl:defmethod finish-val ((m <launch_amcl-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_status-srv:finish-val is deprecated.  Use robot_status-srv:finish instead.")
  (finish m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <launch_amcl-response>) ostream)
  "Serializes a message object of type '<launch_amcl-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'finish))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'finish))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <launch_amcl-response>) istream)
  "Deserializes a message object of type '<launch_amcl-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'finish) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'finish) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<launch_amcl-response>)))
  "Returns string type for a service object of type '<launch_amcl-response>"
  "robot_status/launch_amclResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'launch_amcl-response)))
  "Returns string type for a service object of type 'launch_amcl-response"
  "robot_status/launch_amclResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<launch_amcl-response>)))
  "Returns md5sum for a message object of type '<launch_amcl-response>"
  "fa28e77b8a1dcde11cf9b68339ca8216")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'launch_amcl-response)))
  "Returns md5sum for a message object of type 'launch_amcl-response"
  "fa28e77b8a1dcde11cf9b68339ca8216")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<launch_amcl-response>)))
  "Returns full string definition for message of type '<launch_amcl-response>"
  (cl:format cl:nil "string finish~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'launch_amcl-response)))
  "Returns full string definition for message of type 'launch_amcl-response"
  (cl:format cl:nil "string finish~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <launch_amcl-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'finish))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <launch_amcl-response>))
  "Converts a ROS message object to a list"
  (cl:list 'launch_amcl-response
    (cl:cons ':finish (finish msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'launch_amcl)))
  'launch_amcl-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'launch_amcl)))
  'launch_amcl-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'launch_amcl)))
  "Returns string type for a service object of type '<launch_amcl>"
  "robot_status/launch_amcl")