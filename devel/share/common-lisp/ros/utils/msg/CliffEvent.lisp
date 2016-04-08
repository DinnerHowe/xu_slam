; Auto-generated. Do not edit!


(cl:in-package utils-msg)


;//! \htmlinclude CliffEvent.msg.html

(cl:defclass <CliffEvent> (roslisp-msg-protocol:ros-message)
  ((LEFT
    :reader LEFT
    :initarg :LEFT
    :type cl:fixnum
    :initform 0)
   (FRONT
    :reader FRONT
    :initarg :FRONT
    :type cl:fixnum
    :initform 0)
   (RIGHT
    :reader RIGHT
    :initarg :RIGHT
    :type cl:fixnum
    :initform 0)
   (BACK
    :reader BACK
    :initarg :BACK
    :type cl:fixnum
    :initform 0))
)

(cl:defclass CliffEvent (<CliffEvent>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CliffEvent>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CliffEvent)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name utils-msg:<CliffEvent> is deprecated: use utils-msg:CliffEvent instead.")))

(cl:ensure-generic-function 'LEFT-val :lambda-list '(m))
(cl:defmethod LEFT-val ((m <CliffEvent>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader utils-msg:LEFT-val is deprecated.  Use utils-msg:LEFT instead.")
  (LEFT m))

(cl:ensure-generic-function 'FRONT-val :lambda-list '(m))
(cl:defmethod FRONT-val ((m <CliffEvent>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader utils-msg:FRONT-val is deprecated.  Use utils-msg:FRONT instead.")
  (FRONT m))

(cl:ensure-generic-function 'RIGHT-val :lambda-list '(m))
(cl:defmethod RIGHT-val ((m <CliffEvent>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader utils-msg:RIGHT-val is deprecated.  Use utils-msg:RIGHT instead.")
  (RIGHT m))

(cl:ensure-generic-function 'BACK-val :lambda-list '(m))
(cl:defmethod BACK-val ((m <CliffEvent>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader utils-msg:BACK-val is deprecated.  Use utils-msg:BACK instead.")
  (BACK m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CliffEvent>) ostream)
  "Serializes a message object of type '<CliffEvent>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'LEFT)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'FRONT)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'RIGHT)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'BACK)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CliffEvent>) istream)
  "Deserializes a message object of type '<CliffEvent>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'LEFT)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'FRONT)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'RIGHT)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'BACK)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CliffEvent>)))
  "Returns string type for a message object of type '<CliffEvent>"
  "utils/CliffEvent")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CliffEvent)))
  "Returns string type for a message object of type 'CliffEvent"
  "utils/CliffEvent")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CliffEvent>)))
  "Returns md5sum for a message object of type '<CliffEvent>"
  "4aa84ea193dabb93b5378e5ff8539958")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CliffEvent)))
  "Returns md5sum for a message object of type 'CliffEvent"
  "4aa84ea193dabb93b5378e5ff8539958")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CliffEvent>)))
  "Returns full string definition for message of type '<CliffEvent>"
  (cl:format cl:nil "uint8 LEFT~%uint8 FRONT~%uint8 RIGHT~%uint8 BACK~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CliffEvent)))
  "Returns full string definition for message of type 'CliffEvent"
  (cl:format cl:nil "uint8 LEFT~%uint8 FRONT~%uint8 RIGHT~%uint8 BACK~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CliffEvent>))
  (cl:+ 0
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CliffEvent>))
  "Converts a ROS message object to a list"
  (cl:list 'CliffEvent
    (cl:cons ':LEFT (LEFT msg))
    (cl:cons ':FRONT (FRONT msg))
    (cl:cons ':RIGHT (RIGHT msg))
    (cl:cons ':BACK (BACK msg))
))
