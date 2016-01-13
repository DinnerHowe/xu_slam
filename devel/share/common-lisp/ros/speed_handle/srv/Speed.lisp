; Auto-generated. Do not edit!


(cl:in-package speed_handle-srv)


;//! \htmlinclude Speed-request.msg.html

(cl:defclass <Speed-request> (roslisp-msg-protocol:ros-message)
  ((linear
    :reader linear
    :initarg :linear
    :type speed_handle-msg:Victor
    :initform (cl:make-instance 'speed_handle-msg:Victor))
   (angular
    :reader angular
    :initarg :angular
    :type speed_handle-msg:Victor
    :initform (cl:make-instance 'speed_handle-msg:Victor)))
)

(cl:defclass Speed-request (<Speed-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Speed-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Speed-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name speed_handle-srv:<Speed-request> is deprecated: use speed_handle-srv:Speed-request instead.")))

(cl:ensure-generic-function 'linear-val :lambda-list '(m))
(cl:defmethod linear-val ((m <Speed-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader speed_handle-srv:linear-val is deprecated.  Use speed_handle-srv:linear instead.")
  (linear m))

(cl:ensure-generic-function 'angular-val :lambda-list '(m))
(cl:defmethod angular-val ((m <Speed-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader speed_handle-srv:angular-val is deprecated.  Use speed_handle-srv:angular instead.")
  (angular m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Speed-request>) ostream)
  "Serializes a message object of type '<Speed-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'linear) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'angular) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Speed-request>) istream)
  "Deserializes a message object of type '<Speed-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'linear) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'angular) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Speed-request>)))
  "Returns string type for a service object of type '<Speed-request>"
  "speed_handle/SpeedRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Speed-request)))
  "Returns string type for a service object of type 'Speed-request"
  "speed_handle/SpeedRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Speed-request>)))
  "Returns md5sum for a message object of type '<Speed-request>"
  "c61d132b79de8e81697fdcc375c6df44")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Speed-request)))
  "Returns md5sum for a message object of type 'Speed-request"
  "c61d132b79de8e81697fdcc375c6df44")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Speed-request>)))
  "Returns full string definition for message of type '<Speed-request>"
  (cl:format cl:nil "Victor linear~%Victor angular~%~%================================================================================~%MSG: speed_handle/Victor~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Speed-request)))
  "Returns full string definition for message of type 'Speed-request"
  (cl:format cl:nil "Victor linear~%Victor angular~%~%================================================================================~%MSG: speed_handle/Victor~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Speed-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'linear))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'angular))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Speed-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Speed-request
    (cl:cons ':linear (linear msg))
    (cl:cons ':angular (angular msg))
))
;//! \htmlinclude Speed-response.msg.html

(cl:defclass <Speed-response> (roslisp-msg-protocol:ros-message)
  ((status
    :reader status
    :initarg :status
    :type cl:string
    :initform ""))
)

(cl:defclass Speed-response (<Speed-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Speed-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Speed-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name speed_handle-srv:<Speed-response> is deprecated: use speed_handle-srv:Speed-response instead.")))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <Speed-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader speed_handle-srv:status-val is deprecated.  Use speed_handle-srv:status instead.")
  (status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Speed-response>) ostream)
  "Serializes a message object of type '<Speed-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'status))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'status))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Speed-response>) istream)
  "Deserializes a message object of type '<Speed-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'status) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'status) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Speed-response>)))
  "Returns string type for a service object of type '<Speed-response>"
  "speed_handle/SpeedResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Speed-response)))
  "Returns string type for a service object of type 'Speed-response"
  "speed_handle/SpeedResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Speed-response>)))
  "Returns md5sum for a message object of type '<Speed-response>"
  "c61d132b79de8e81697fdcc375c6df44")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Speed-response)))
  "Returns md5sum for a message object of type 'Speed-response"
  "c61d132b79de8e81697fdcc375c6df44")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Speed-response>)))
  "Returns full string definition for message of type '<Speed-response>"
  (cl:format cl:nil "string status~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Speed-response)))
  "Returns full string definition for message of type 'Speed-response"
  (cl:format cl:nil "string status~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Speed-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'status))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Speed-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Speed-response
    (cl:cons ':status (status msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Speed)))
  'Speed-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Speed)))
  'Speed-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Speed)))
  "Returns string type for a service object of type '<Speed>"
  "speed_handle/Speed")