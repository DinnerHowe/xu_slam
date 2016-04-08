; Auto-generated. Do not edit!


(cl:in-package web_map-msg)


;//! \htmlinclude web_map.msg.html

(cl:defclass <web_map> (roslisp-msg-protocol:ros-message)
  ((clear_area
    :reader clear_area
    :initarg :clear_area
    :type cl:string
    :initform "")
   (block_area
    :reader block_area
    :initarg :block_area
    :type cl:string
    :initform ""))
)

(cl:defclass web_map (<web_map>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <web_map>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'web_map)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name web_map-msg:<web_map> is deprecated: use web_map-msg:web_map instead.")))

(cl:ensure-generic-function 'clear_area-val :lambda-list '(m))
(cl:defmethod clear_area-val ((m <web_map>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader web_map-msg:clear_area-val is deprecated.  Use web_map-msg:clear_area instead.")
  (clear_area m))

(cl:ensure-generic-function 'block_area-val :lambda-list '(m))
(cl:defmethod block_area-val ((m <web_map>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader web_map-msg:block_area-val is deprecated.  Use web_map-msg:block_area instead.")
  (block_area m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <web_map>) ostream)
  "Serializes a message object of type '<web_map>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'clear_area))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'clear_area))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'block_area))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'block_area))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <web_map>) istream)
  "Deserializes a message object of type '<web_map>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'clear_area) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'clear_area) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'block_area) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'block_area) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<web_map>)))
  "Returns string type for a message object of type '<web_map>"
  "web_map/web_map")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'web_map)))
  "Returns string type for a message object of type 'web_map"
  "web_map/web_map")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<web_map>)))
  "Returns md5sum for a message object of type '<web_map>"
  "38e94daf928ada60065df6e7dff9e4cb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'web_map)))
  "Returns md5sum for a message object of type 'web_map"
  "38e94daf928ada60065df6e7dff9e4cb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<web_map>)))
  "Returns full string definition for message of type '<web_map>"
  (cl:format cl:nil "string clear_area~%string block_area~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'web_map)))
  "Returns full string definition for message of type 'web_map"
  (cl:format cl:nil "string clear_area~%string block_area~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <web_map>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'clear_area))
     4 (cl:length (cl:slot-value msg 'block_area))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <web_map>))
  "Converts a ROS message object to a list"
  (cl:list 'web_map
    (cl:cons ':clear_area (clear_area msg))
    (cl:cons ':block_area (block_area msg))
))
