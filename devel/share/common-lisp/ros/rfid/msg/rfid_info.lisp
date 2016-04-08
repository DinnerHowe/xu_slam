; Auto-generated. Do not edit!


(cl:in-package rfid-msg)


;//! \htmlinclude rfid_info.msg.html

(cl:defclass <rfid_info> (roslisp-msg-protocol:ros-message)
  ((count
    :reader count
    :initarg :count
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0))
   (ID
    :reader ID
    :initarg :ID
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
   (num
    :reader num
    :initarg :num
    :type cl:fixnum
    :initform 0))
)

(cl:defclass rfid_info (<rfid_info>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <rfid_info>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'rfid_info)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rfid-msg:<rfid_info> is deprecated: use rfid-msg:rfid_info instead.")))

(cl:ensure-generic-function 'count-val :lambda-list '(m))
(cl:defmethod count-val ((m <rfid_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rfid-msg:count-val is deprecated.  Use rfid-msg:count instead.")
  (count m))

(cl:ensure-generic-function 'ID-val :lambda-list '(m))
(cl:defmethod ID-val ((m <rfid_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rfid-msg:ID-val is deprecated.  Use rfid-msg:ID instead.")
  (ID m))

(cl:ensure-generic-function 'num-val :lambda-list '(m))
(cl:defmethod num-val ((m <rfid_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rfid-msg:num-val is deprecated.  Use rfid-msg:num instead.")
  (num m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <rfid_info>) ostream)
  "Serializes a message object of type '<rfid_info>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'count))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    ))
   (cl:slot-value msg 'count))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'ID))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'ID))
  (cl:let* ((signed (cl:slot-value msg 'num)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <rfid_info>) istream)
  "Deserializes a message object of type '<rfid_info>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'count) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'count)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536)))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'ID) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'ID)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'num) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<rfid_info>)))
  "Returns string type for a message object of type '<rfid_info>"
  "rfid/rfid_info")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'rfid_info)))
  "Returns string type for a message object of type 'rfid_info"
  "rfid/rfid_info")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<rfid_info>)))
  "Returns md5sum for a message object of type '<rfid_info>"
  "8b199d3773e1c40cbc71ad015148b4c3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'rfid_info)))
  "Returns md5sum for a message object of type 'rfid_info"
  "8b199d3773e1c40cbc71ad015148b4c3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<rfid_info>)))
  "Returns full string definition for message of type '<rfid_info>"
  (cl:format cl:nil "int16[] count~%string[] ID~%int16 num~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'rfid_info)))
  "Returns full string definition for message of type 'rfid_info"
  (cl:format cl:nil "int16[] count~%string[] ID~%int16 num~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <rfid_info>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'count) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'ID) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <rfid_info>))
  "Converts a ROS message object to a list"
  (cl:list 'rfid_info
    (cl:cons ':count (count msg))
    (cl:cons ':ID (ID msg))
    (cl:cons ':num (num msg))
))
