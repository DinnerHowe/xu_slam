; Auto-generated. Do not edit!


(cl:in-package rfid-msg)


;//! \htmlinclude TransferData.msg.html

(cl:defclass <TransferData> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (rssi
    :reader rssi
    :initarg :rssi
    :type cl:fixnum
    :initform 0)
   (ID
    :reader ID
    :initarg :ID
    :type cl:string
    :initform ""))
)

(cl:defclass TransferData (<TransferData>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TransferData>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TransferData)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rfid-msg:<TransferData> is deprecated: use rfid-msg:TransferData instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <TransferData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rfid-msg:header-val is deprecated.  Use rfid-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'rssi-val :lambda-list '(m))
(cl:defmethod rssi-val ((m <TransferData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rfid-msg:rssi-val is deprecated.  Use rfid-msg:rssi instead.")
  (rssi m))

(cl:ensure-generic-function 'ID-val :lambda-list '(m))
(cl:defmethod ID-val ((m <TransferData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rfid-msg:ID-val is deprecated.  Use rfid-msg:ID instead.")
  (ID m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TransferData>) ostream)
  "Serializes a message object of type '<TransferData>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'rssi)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'ID))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'ID))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TransferData>) istream)
  "Deserializes a message object of type '<TransferData>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'rssi) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ID) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'ID) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TransferData>)))
  "Returns string type for a message object of type '<TransferData>"
  "rfid/TransferData")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TransferData)))
  "Returns string type for a message object of type 'TransferData"
  "rfid/TransferData")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TransferData>)))
  "Returns md5sum for a message object of type '<TransferData>"
  "68d70907a1877460194ed3fc27b773d8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TransferData)))
  "Returns md5sum for a message object of type 'TransferData"
  "68d70907a1877460194ed3fc27b773d8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TransferData>)))
  "Returns full string definition for message of type '<TransferData>"
  (cl:format cl:nil "Header header~%int16 rssi~%string ID~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TransferData)))
  "Returns full string definition for message of type 'TransferData"
  (cl:format cl:nil "Header header~%int16 rssi~%string ID~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TransferData>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     2
     4 (cl:length (cl:slot-value msg 'ID))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TransferData>))
  "Converts a ROS message object to a list"
  (cl:list 'TransferData
    (cl:cons ':header (header msg))
    (cl:cons ':rssi (rssi msg))
    (cl:cons ':ID (ID msg))
))
