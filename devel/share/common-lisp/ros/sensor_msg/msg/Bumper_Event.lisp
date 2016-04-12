; Auto-generated. Do not edit!


(cl:in-package sensor_msg-msg)


;//! \htmlinclude Bumper_Event.msg.html

(cl:defclass <Bumper_Event> (roslisp-msg-protocol:ros-message)
  ((bumper
    :reader bumper
    :initarg :bumper
    :type cl:fixnum
    :initform 0)
   (state
    :reader state
    :initarg :state
    :type cl:fixnum
    :initform 0))
)

(cl:defclass Bumper_Event (<Bumper_Event>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Bumper_Event>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Bumper_Event)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sensor_msg-msg:<Bumper_Event> is deprecated: use sensor_msg-msg:Bumper_Event instead.")))

(cl:ensure-generic-function 'bumper-val :lambda-list '(m))
(cl:defmethod bumper-val ((m <Bumper_Event>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor_msg-msg:bumper-val is deprecated.  Use sensor_msg-msg:bumper instead.")
  (bumper m))

(cl:ensure-generic-function 'state-val :lambda-list '(m))
(cl:defmethod state-val ((m <Bumper_Event>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor_msg-msg:state-val is deprecated.  Use sensor_msg-msg:state instead.")
  (state m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<Bumper_Event>)))
    "Constants for message type '<Bumper_Event>"
  '((:LEFT . 0)
    (:CENTER . 1)
    (:RIGHT . 2)
    (:RELEASED . 0)
    (:PRESSED . 1))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'Bumper_Event)))
    "Constants for message type 'Bumper_Event"
  '((:LEFT . 0)
    (:CENTER . 1)
    (:RIGHT . 2)
    (:RELEASED . 0)
    (:PRESSED . 1))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Bumper_Event>) ostream)
  "Serializes a message object of type '<Bumper_Event>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'bumper)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'state)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Bumper_Event>) istream)
  "Deserializes a message object of type '<Bumper_Event>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'bumper)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'state)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Bumper_Event>)))
  "Returns string type for a message object of type '<Bumper_Event>"
  "sensor_msg/Bumper_Event")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Bumper_Event)))
  "Returns string type for a message object of type 'Bumper_Event"
  "sensor_msg/Bumper_Event")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Bumper_Event>)))
  "Returns md5sum for a message object of type '<Bumper_Event>"
  "ffe360cd50f14f9251d9844083e72ac5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Bumper_Event)))
  "Returns md5sum for a message object of type 'Bumper_Event"
  "ffe360cd50f14f9251d9844083e72ac5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Bumper_Event>)))
  "Returns full string definition for message of type '<Bumper_Event>"
  (cl:format cl:nil "uint8 LEFT   = 0~%uint8 CENTER = 1~%uint8 RIGHT  = 2~%~%uint8 RELEASED = 0~%uint8 PRESSED  = 1~%~%uint8 bumper~%uint8 state~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Bumper_Event)))
  "Returns full string definition for message of type 'Bumper_Event"
  (cl:format cl:nil "uint8 LEFT   = 0~%uint8 CENTER = 1~%uint8 RIGHT  = 2~%~%uint8 RELEASED = 0~%uint8 PRESSED  = 1~%~%uint8 bumper~%uint8 state~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Bumper_Event>))
  (cl:+ 0
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Bumper_Event>))
  "Converts a ROS message object to a list"
  (cl:list 'Bumper_Event
    (cl:cons ':bumper (bumper msg))
    (cl:cons ':state (state msg))
))
