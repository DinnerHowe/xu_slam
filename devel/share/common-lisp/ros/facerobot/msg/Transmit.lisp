; Auto-generated. Do not edit!


(cl:in-package facerobot-msg)


;//! \htmlinclude Transmit.msg.html

(cl:defclass <Transmit> (roslisp-msg-protocol:ros-message)
  ((transmit
    :reader transmit
    :initarg :transmit
    :type cl:boolean
    :initform cl:nil)
   (object
    :reader object
    :initarg :object
    :type cl:integer
    :initform 0)
   (didian
    :reader didian
    :initarg :didian
    :type cl:integer
    :initform 0))
)

(cl:defclass Transmit (<Transmit>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Transmit>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Transmit)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name facerobot-msg:<Transmit> is deprecated: use facerobot-msg:Transmit instead.")))

(cl:ensure-generic-function 'transmit-val :lambda-list '(m))
(cl:defmethod transmit-val ((m <Transmit>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader facerobot-msg:transmit-val is deprecated.  Use facerobot-msg:transmit instead.")
  (transmit m))

(cl:ensure-generic-function 'object-val :lambda-list '(m))
(cl:defmethod object-val ((m <Transmit>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader facerobot-msg:object-val is deprecated.  Use facerobot-msg:object instead.")
  (object m))

(cl:ensure-generic-function 'didian-val :lambda-list '(m))
(cl:defmethod didian-val ((m <Transmit>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader facerobot-msg:didian-val is deprecated.  Use facerobot-msg:didian instead.")
  (didian m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Transmit>) ostream)
  "Serializes a message object of type '<Transmit>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'transmit) 1 0)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'object)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'didian)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Transmit>) istream)
  "Deserializes a message object of type '<Transmit>"
    (cl:setf (cl:slot-value msg 'transmit) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'object) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'didian) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Transmit>)))
  "Returns string type for a message object of type '<Transmit>"
  "facerobot/Transmit")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Transmit)))
  "Returns string type for a message object of type 'Transmit"
  "facerobot/Transmit")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Transmit>)))
  "Returns md5sum for a message object of type '<Transmit>"
  "99c7f83694b9f3c2c39a66d868b1bbeb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Transmit)))
  "Returns md5sum for a message object of type 'Transmit"
  "99c7f83694b9f3c2c39a66d868b1bbeb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Transmit>)))
  "Returns full string definition for message of type '<Transmit>"
  (cl:format cl:nil "bool transmit~%int64 object~%int64 didian~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Transmit)))
  "Returns full string definition for message of type 'Transmit"
  (cl:format cl:nil "bool transmit~%int64 object~%int64 didian~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Transmit>))
  (cl:+ 0
     1
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Transmit>))
  "Converts a ROS message object to a list"
  (cl:list 'Transmit
    (cl:cons ':transmit (transmit msg))
    (cl:cons ':object (object msg))
    (cl:cons ':didian (didian msg))
))
