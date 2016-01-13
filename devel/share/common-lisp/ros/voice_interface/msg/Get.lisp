; Auto-generated. Do not edit!


(cl:in-package voice_interface-msg)


;//! \htmlinclude Get.msg.html

(cl:defclass <Get> (roslisp-msg-protocol:ros-message)
  ((get
    :reader get
    :initarg :get
    :type cl:boolean
    :initform cl:nil)
   (rencheng2
    :reader rencheng2
    :initarg :rencheng2
    :type cl:integer
    :initform 0)
   (operation
    :reader operation
    :initarg :operation
    :type cl:integer
    :initform 0)
   (object2
    :reader object2
    :initarg :object2
    :type cl:integer
    :initform 0)
   (action
    :reader action
    :initarg :action
    :type cl:integer
    :initform 0))
)

(cl:defclass Get (<Get>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Get>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Get)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name voice_interface-msg:<Get> is deprecated: use voice_interface-msg:Get instead.")))

(cl:ensure-generic-function 'get-val :lambda-list '(m))
(cl:defmethod get-val ((m <Get>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader voice_interface-msg:get-val is deprecated.  Use voice_interface-msg:get instead.")
  (get m))

(cl:ensure-generic-function 'rencheng2-val :lambda-list '(m))
(cl:defmethod rencheng2-val ((m <Get>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader voice_interface-msg:rencheng2-val is deprecated.  Use voice_interface-msg:rencheng2 instead.")
  (rencheng2 m))

(cl:ensure-generic-function 'operation-val :lambda-list '(m))
(cl:defmethod operation-val ((m <Get>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader voice_interface-msg:operation-val is deprecated.  Use voice_interface-msg:operation instead.")
  (operation m))

(cl:ensure-generic-function 'object2-val :lambda-list '(m))
(cl:defmethod object2-val ((m <Get>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader voice_interface-msg:object2-val is deprecated.  Use voice_interface-msg:object2 instead.")
  (object2 m))

(cl:ensure-generic-function 'action-val :lambda-list '(m))
(cl:defmethod action-val ((m <Get>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader voice_interface-msg:action-val is deprecated.  Use voice_interface-msg:action instead.")
  (action m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Get>) ostream)
  "Serializes a message object of type '<Get>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'get) 1 0)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'rencheng2)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'operation)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'object2)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'action)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Get>) istream)
  "Deserializes a message object of type '<Get>"
    (cl:setf (cl:slot-value msg 'get) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'rencheng2) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'operation) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'object2) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'action) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Get>)))
  "Returns string type for a message object of type '<Get>"
  "voice_interface/Get")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Get)))
  "Returns string type for a message object of type 'Get"
  "voice_interface/Get")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Get>)))
  "Returns md5sum for a message object of type '<Get>"
  "712d3f98ffc20e1bda6fa2b3c9033441")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Get)))
  "Returns md5sum for a message object of type 'Get"
  "712d3f98ffc20e1bda6fa2b3c9033441")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Get>)))
  "Returns full string definition for message of type '<Get>"
  (cl:format cl:nil "bool get~%int64 rencheng2~%int64 operation~%int64 object2~%int64 action~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Get)))
  "Returns full string definition for message of type 'Get"
  (cl:format cl:nil "bool get~%int64 rencheng2~%int64 operation~%int64 object2~%int64 action~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Get>))
  (cl:+ 0
     1
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Get>))
  "Converts a ROS message object to a list"
  (cl:list 'Get
    (cl:cons ':get (get msg))
    (cl:cons ':rencheng2 (rencheng2 msg))
    (cl:cons ':operation (operation msg))
    (cl:cons ':object2 (object2 msg))
    (cl:cons ':action (action msg))
))
