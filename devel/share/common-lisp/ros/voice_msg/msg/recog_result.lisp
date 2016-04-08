; Auto-generated. Do not edit!


(cl:in-package voice_msg-msg)


;//! \htmlinclude recog_result.msg.html

(cl:defclass <recog_result> (roslisp-msg-protocol:ros-message)
  ((finished
    :reader finished
    :initarg :finished
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass recog_result (<recog_result>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <recog_result>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'recog_result)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name voice_msg-msg:<recog_result> is deprecated: use voice_msg-msg:recog_result instead.")))

(cl:ensure-generic-function 'finished-val :lambda-list '(m))
(cl:defmethod finished-val ((m <recog_result>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader voice_msg-msg:finished-val is deprecated.  Use voice_msg-msg:finished instead.")
  (finished m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <recog_result>) ostream)
  "Serializes a message object of type '<recog_result>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'finished) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <recog_result>) istream)
  "Deserializes a message object of type '<recog_result>"
    (cl:setf (cl:slot-value msg 'finished) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<recog_result>)))
  "Returns string type for a message object of type '<recog_result>"
  "voice_msg/recog_result")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'recog_result)))
  "Returns string type for a message object of type 'recog_result"
  "voice_msg/recog_result")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<recog_result>)))
  "Returns md5sum for a message object of type '<recog_result>"
  "e2797c797e620a950ba704492d72873b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'recog_result)))
  "Returns md5sum for a message object of type 'recog_result"
  "e2797c797e620a950ba704492d72873b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<recog_result>)))
  "Returns full string definition for message of type '<recog_result>"
  (cl:format cl:nil "bool finished~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'recog_result)))
  "Returns full string definition for message of type 'recog_result"
  (cl:format cl:nil "bool finished~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <recog_result>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <recog_result>))
  "Converts a ROS message object to a list"
  (cl:list 'recog_result
    (cl:cons ':finished (finished msg))
))
