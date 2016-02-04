; Auto-generated. Do not edit!


(cl:in-package voice_msg-msg)


;//! \htmlinclude Navigation.msg.html

(cl:defclass <Navigation> (roslisp-msg-protocol:ros-message)
  ((navigation
    :reader navigation
    :initarg :navigation
    :type cl:boolean
    :initform cl:nil)
   (go
    :reader go
    :initarg :go
    :type cl:integer
    :initform 0)
   (direct
    :reader direct
    :initarg :direct
    :type cl:integer
    :initform 0)
   (columnNum
    :reader columnNum
    :initarg :columnNum
    :type cl:integer
    :initform 0)
   (rowNum
    :reader rowNum
    :initarg :rowNum
    :type cl:integer
    :initform 0))
)

(cl:defclass Navigation (<Navigation>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Navigation>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Navigation)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name voice_msg-msg:<Navigation> is deprecated: use voice_msg-msg:Navigation instead.")))

(cl:ensure-generic-function 'navigation-val :lambda-list '(m))
(cl:defmethod navigation-val ((m <Navigation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader voice_msg-msg:navigation-val is deprecated.  Use voice_msg-msg:navigation instead.")
  (navigation m))

(cl:ensure-generic-function 'go-val :lambda-list '(m))
(cl:defmethod go-val ((m <Navigation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader voice_msg-msg:go-val is deprecated.  Use voice_msg-msg:go instead.")
  (go m))

(cl:ensure-generic-function 'direct-val :lambda-list '(m))
(cl:defmethod direct-val ((m <Navigation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader voice_msg-msg:direct-val is deprecated.  Use voice_msg-msg:direct instead.")
  (direct m))

(cl:ensure-generic-function 'columnNum-val :lambda-list '(m))
(cl:defmethod columnNum-val ((m <Navigation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader voice_msg-msg:columnNum-val is deprecated.  Use voice_msg-msg:columnNum instead.")
  (columnNum m))

(cl:ensure-generic-function 'rowNum-val :lambda-list '(m))
(cl:defmethod rowNum-val ((m <Navigation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader voice_msg-msg:rowNum-val is deprecated.  Use voice_msg-msg:rowNum instead.")
  (rowNum m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Navigation>) ostream)
  "Serializes a message object of type '<Navigation>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'navigation) 1 0)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'go)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'direct)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'columnNum)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'rowNum)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Navigation>) istream)
  "Deserializes a message object of type '<Navigation>"
    (cl:setf (cl:slot-value msg 'navigation) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'go) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'direct) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'columnNum) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'rowNum) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Navigation>)))
  "Returns string type for a message object of type '<Navigation>"
  "voice_msg/Navigation")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Navigation)))
  "Returns string type for a message object of type 'Navigation"
  "voice_msg/Navigation")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Navigation>)))
  "Returns md5sum for a message object of type '<Navigation>"
  "bf6e0630035008c8fd093b1b103c4e65")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Navigation)))
  "Returns md5sum for a message object of type 'Navigation"
  "bf6e0630035008c8fd093b1b103c4e65")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Navigation>)))
  "Returns full string definition for message of type '<Navigation>"
  (cl:format cl:nil "bool navigation~%int64 go~%int64 direct~%int64 columnNum~%int64 rowNum~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Navigation)))
  "Returns full string definition for message of type 'Navigation"
  (cl:format cl:nil "bool navigation~%int64 go~%int64 direct~%int64 columnNum~%int64 rowNum~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Navigation>))
  (cl:+ 0
     1
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Navigation>))
  "Converts a ROS message object to a list"
  (cl:list 'Navigation
    (cl:cons ':navigation (navigation msg))
    (cl:cons ':go (go msg))
    (cl:cons ':direct (direct msg))
    (cl:cons ':columnNum (columnNum msg))
    (cl:cons ':rowNum (rowNum msg))
))
