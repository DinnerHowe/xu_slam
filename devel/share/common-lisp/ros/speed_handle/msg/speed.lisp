; Auto-generated. Do not edit!


(cl:in-package speed_handle-msg)


;//! \htmlinclude speed.msg.html

(cl:defclass <speed> (roslisp-msg-protocol:ros-message)
  ((linear
    :reader linear
    :initarg :linear
    :type speed_handle-msg:Victor
    :initform (cl:make-instance 'speed_handle-msg:Victor))
   (angular
    :reader angular
    :initarg :angular
    :type speed_handle-msg:Victor
    :initform (cl:make-instance 'speed_handle-msg:Victor)))
)

(cl:defclass speed (<speed>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <speed>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'speed)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name speed_handle-msg:<speed> is deprecated: use speed_handle-msg:speed instead.")))

(cl:ensure-generic-function 'linear-val :lambda-list '(m))
(cl:defmethod linear-val ((m <speed>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader speed_handle-msg:linear-val is deprecated.  Use speed_handle-msg:linear instead.")
  (linear m))

(cl:ensure-generic-function 'angular-val :lambda-list '(m))
(cl:defmethod angular-val ((m <speed>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader speed_handle-msg:angular-val is deprecated.  Use speed_handle-msg:angular instead.")
  (angular m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <speed>) ostream)
  "Serializes a message object of type '<speed>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'linear) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'angular) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <speed>) istream)
  "Deserializes a message object of type '<speed>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'linear) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'angular) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<speed>)))
  "Returns string type for a message object of type '<speed>"
  "speed_handle/speed")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'speed)))
  "Returns string type for a message object of type 'speed"
  "speed_handle/speed")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<speed>)))
  "Returns md5sum for a message object of type '<speed>"
  "9f195f881246fdfa2798d1d3eebca84a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'speed)))
  "Returns md5sum for a message object of type 'speed"
  "9f195f881246fdfa2798d1d3eebca84a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<speed>)))
  "Returns full string definition for message of type '<speed>"
  (cl:format cl:nil "Victor linear~%Victor angular~%~%================================================================================~%MSG: speed_handle/Victor~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'speed)))
  "Returns full string definition for message of type 'speed"
  (cl:format cl:nil "Victor linear~%Victor angular~%~%================================================================================~%MSG: speed_handle/Victor~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <speed>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'linear))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'angular))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <speed>))
  "Converts a ROS message object to a list"
  (cl:list 'speed
    (cl:cons ':linear (linear msg))
    (cl:cons ':angular (angular msg))
))
