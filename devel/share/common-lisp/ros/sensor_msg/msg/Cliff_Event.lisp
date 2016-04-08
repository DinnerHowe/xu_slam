; Auto-generated. Do not edit!


(cl:in-package sensor_msg-msg)


;//! \htmlinclude Cliff_Event.msg.html

(cl:defclass <Cliff_Event> (roslisp-msg-protocol:ros-message)
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

(cl:defclass Cliff_Event (<Cliff_Event>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Cliff_Event>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Cliff_Event)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sensor_msg-msg:<Cliff_Event> is deprecated: use sensor_msg-msg:Cliff_Event instead.")))

(cl:ensure-generic-function 'LEFT-val :lambda-list '(m))
(cl:defmethod LEFT-val ((m <Cliff_Event>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor_msg-msg:LEFT-val is deprecated.  Use sensor_msg-msg:LEFT instead.")
  (LEFT m))

(cl:ensure-generic-function 'FRONT-val :lambda-list '(m))
(cl:defmethod FRONT-val ((m <Cliff_Event>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor_msg-msg:FRONT-val is deprecated.  Use sensor_msg-msg:FRONT instead.")
  (FRONT m))

(cl:ensure-generic-function 'RIGHT-val :lambda-list '(m))
(cl:defmethod RIGHT-val ((m <Cliff_Event>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor_msg-msg:RIGHT-val is deprecated.  Use sensor_msg-msg:RIGHT instead.")
  (RIGHT m))

(cl:ensure-generic-function 'BACK-val :lambda-list '(m))
(cl:defmethod BACK-val ((m <Cliff_Event>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor_msg-msg:BACK-val is deprecated.  Use sensor_msg-msg:BACK instead.")
  (BACK m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Cliff_Event>) ostream)
  "Serializes a message object of type '<Cliff_Event>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'LEFT)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'FRONT)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'RIGHT)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'BACK)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Cliff_Event>) istream)
  "Deserializes a message object of type '<Cliff_Event>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'LEFT)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'FRONT)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'RIGHT)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'BACK)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Cliff_Event>)))
  "Returns string type for a message object of type '<Cliff_Event>"
  "sensor_msg/Cliff_Event")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Cliff_Event)))
  "Returns string type for a message object of type 'Cliff_Event"
  "sensor_msg/Cliff_Event")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Cliff_Event>)))
  "Returns md5sum for a message object of type '<Cliff_Event>"
  "4aa84ea193dabb93b5378e5ff8539958")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Cliff_Event)))
  "Returns md5sum for a message object of type 'Cliff_Event"
  "4aa84ea193dabb93b5378e5ff8539958")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Cliff_Event>)))
  "Returns full string definition for message of type '<Cliff_Event>"
  (cl:format cl:nil "uint8 LEFT~%uint8 FRONT~%uint8 RIGHT~%uint8 BACK~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Cliff_Event)))
  "Returns full string definition for message of type 'Cliff_Event"
  (cl:format cl:nil "uint8 LEFT~%uint8 FRONT~%uint8 RIGHT~%uint8 BACK~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Cliff_Event>))
  (cl:+ 0
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Cliff_Event>))
  "Converts a ROS message object to a list"
  (cl:list 'Cliff_Event
    (cl:cons ':LEFT (LEFT msg))
    (cl:cons ':FRONT (FRONT msg))
    (cl:cons ':RIGHT (RIGHT msg))
    (cl:cons ':BACK (BACK msg))
))
