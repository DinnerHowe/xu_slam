; Auto-generated. Do not edit!


(cl:in-package voice_interface-msg)


;//! \htmlinclude Send.msg.html

(cl:defclass <Send> (roslisp-msg-protocol:ros-message)
  ((send
    :reader send
    :initarg :send
    :type cl:boolean
    :initform cl:nil)
   (song1
    :reader song1
    :initarg :song1
    :type cl:integer
    :initform 0)
   (object1
    :reader object1
    :initarg :object1
    :type cl:integer
    :initform 0)
   (dao1
    :reader dao1
    :initarg :dao1
    :type cl:integer
    :initform 0)
   (dd
    :reader dd
    :initarg :dd
    :type cl:integer
    :initform 0)
   (rencheng1
    :reader rencheng1
    :initarg :rencheng1
    :type cl:integer
    :initform 0))
)

(cl:defclass Send (<Send>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Send>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Send)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name voice_interface-msg:<Send> is deprecated: use voice_interface-msg:Send instead.")))

(cl:ensure-generic-function 'send-val :lambda-list '(m))
(cl:defmethod send-val ((m <Send>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader voice_interface-msg:send-val is deprecated.  Use voice_interface-msg:send instead.")
  (send m))

(cl:ensure-generic-function 'song1-val :lambda-list '(m))
(cl:defmethod song1-val ((m <Send>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader voice_interface-msg:song1-val is deprecated.  Use voice_interface-msg:song1 instead.")
  (song1 m))

(cl:ensure-generic-function 'object1-val :lambda-list '(m))
(cl:defmethod object1-val ((m <Send>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader voice_interface-msg:object1-val is deprecated.  Use voice_interface-msg:object1 instead.")
  (object1 m))

(cl:ensure-generic-function 'dao1-val :lambda-list '(m))
(cl:defmethod dao1-val ((m <Send>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader voice_interface-msg:dao1-val is deprecated.  Use voice_interface-msg:dao1 instead.")
  (dao1 m))

(cl:ensure-generic-function 'dd-val :lambda-list '(m))
(cl:defmethod dd-val ((m <Send>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader voice_interface-msg:dd-val is deprecated.  Use voice_interface-msg:dd instead.")
  (dd m))

(cl:ensure-generic-function 'rencheng1-val :lambda-list '(m))
(cl:defmethod rencheng1-val ((m <Send>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader voice_interface-msg:rencheng1-val is deprecated.  Use voice_interface-msg:rencheng1 instead.")
  (rencheng1 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Send>) ostream)
  "Serializes a message object of type '<Send>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'send) 1 0)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'song1)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'object1)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'dao1)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'dd)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'rencheng1)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Send>) istream)
  "Deserializes a message object of type '<Send>"
    (cl:setf (cl:slot-value msg 'send) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'song1) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'object1) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'dao1) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'dd) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'rencheng1) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Send>)))
  "Returns string type for a message object of type '<Send>"
  "voice_interface/Send")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Send)))
  "Returns string type for a message object of type 'Send"
  "voice_interface/Send")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Send>)))
  "Returns md5sum for a message object of type '<Send>"
  "a711c708becf295f2e6df4e6e308b5bd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Send)))
  "Returns md5sum for a message object of type 'Send"
  "a711c708becf295f2e6df4e6e308b5bd")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Send>)))
  "Returns full string definition for message of type '<Send>"
  (cl:format cl:nil "bool send~%int64 song1~%int64 object1~%int64 dao1~%int64 dd~%int64 rencheng1~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Send)))
  "Returns full string definition for message of type 'Send"
  (cl:format cl:nil "bool send~%int64 song1~%int64 object1~%int64 dao1~%int64 dd~%int64 rencheng1~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Send>))
  (cl:+ 0
     1
     8
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Send>))
  "Converts a ROS message object to a list"
  (cl:list 'Send
    (cl:cons ':send (send msg))
    (cl:cons ':song1 (song1 msg))
    (cl:cons ':object1 (object1 msg))
    (cl:cons ':dao1 (dao1 msg))
    (cl:cons ':dd (dd msg))
    (cl:cons ':rencheng1 (rencheng1 msg))
))
