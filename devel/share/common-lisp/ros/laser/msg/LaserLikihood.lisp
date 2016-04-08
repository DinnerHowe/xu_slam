; Auto-generated. Do not edit!


(cl:in-package laser-msg)


;//! \htmlinclude LaserLikihood.msg.html

(cl:defclass <LaserLikihood> (roslisp-msg-protocol:ros-message)
  ((rweight
    :reader rweight
    :initarg :rweight
    :type cl:fixnum
    :initform 0)
   (mrweight
    :reader mrweight
    :initarg :mrweight
    :type cl:fixnum
    :initform 0)
   (mlweight
    :reader mlweight
    :initarg :mlweight
    :type cl:fixnum
    :initform 0)
   (lweight
    :reader lweight
    :initarg :lweight
    :type cl:fixnum
    :initform 0))
)

(cl:defclass LaserLikihood (<LaserLikihood>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LaserLikihood>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LaserLikihood)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name laser-msg:<LaserLikihood> is deprecated: use laser-msg:LaserLikihood instead.")))

(cl:ensure-generic-function 'rweight-val :lambda-list '(m))
(cl:defmethod rweight-val ((m <LaserLikihood>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser-msg:rweight-val is deprecated.  Use laser-msg:rweight instead.")
  (rweight m))

(cl:ensure-generic-function 'mrweight-val :lambda-list '(m))
(cl:defmethod mrweight-val ((m <LaserLikihood>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser-msg:mrweight-val is deprecated.  Use laser-msg:mrweight instead.")
  (mrweight m))

(cl:ensure-generic-function 'mlweight-val :lambda-list '(m))
(cl:defmethod mlweight-val ((m <LaserLikihood>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser-msg:mlweight-val is deprecated.  Use laser-msg:mlweight instead.")
  (mlweight m))

(cl:ensure-generic-function 'lweight-val :lambda-list '(m))
(cl:defmethod lweight-val ((m <LaserLikihood>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser-msg:lweight-val is deprecated.  Use laser-msg:lweight instead.")
  (lweight m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LaserLikihood>) ostream)
  "Serializes a message object of type '<LaserLikihood>"
  (cl:let* ((signed (cl:slot-value msg 'rweight)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'mrweight)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'mlweight)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'lweight)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LaserLikihood>) istream)
  "Deserializes a message object of type '<LaserLikihood>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'rweight) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'mrweight) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'mlweight) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'lweight) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LaserLikihood>)))
  "Returns string type for a message object of type '<LaserLikihood>"
  "laser/LaserLikihood")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LaserLikihood)))
  "Returns string type for a message object of type 'LaserLikihood"
  "laser/LaserLikihood")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LaserLikihood>)))
  "Returns md5sum for a message object of type '<LaserLikihood>"
  "e4d03bcd89c263368f27f8d90957a312")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LaserLikihood)))
  "Returns md5sum for a message object of type 'LaserLikihood"
  "e4d03bcd89c263368f27f8d90957a312")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LaserLikihood>)))
  "Returns full string definition for message of type '<LaserLikihood>"
  (cl:format cl:nil "int16 rweight~%int16 mrweight~%int16 mlweight~%int16 lweight~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LaserLikihood)))
  "Returns full string definition for message of type 'LaserLikihood"
  (cl:format cl:nil "int16 rweight~%int16 mrweight~%int16 mlweight~%int16 lweight~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LaserLikihood>))
  (cl:+ 0
     2
     2
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LaserLikihood>))
  "Converts a ROS message object to a list"
  (cl:list 'LaserLikihood
    (cl:cons ':rweight (rweight msg))
    (cl:cons ':mrweight (mrweight msg))
    (cl:cons ':mlweight (mlweight msg))
    (cl:cons ':lweight (lweight msg))
))
