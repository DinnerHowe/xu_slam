; Auto-generated. Do not edit!


(cl:in-package rfid_handle-srv)


;//! \htmlinclude ClassifiedData-request.msg.html

(cl:defclass <ClassifiedData-request> (roslisp-msg-protocol:ros-message)
  ((rssi
    :reader rssi
    :initarg :rssi
    :type cl:fixnum
    :initform 0)
   (ID
    :reader ID
    :initarg :ID
    :type cl:string
    :initform ""))
)

(cl:defclass ClassifiedData-request (<ClassifiedData-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ClassifiedData-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ClassifiedData-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rfid_handle-srv:<ClassifiedData-request> is deprecated: use rfid_handle-srv:ClassifiedData-request instead.")))

(cl:ensure-generic-function 'rssi-val :lambda-list '(m))
(cl:defmethod rssi-val ((m <ClassifiedData-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rfid_handle-srv:rssi-val is deprecated.  Use rfid_handle-srv:rssi instead.")
  (rssi m))

(cl:ensure-generic-function 'ID-val :lambda-list '(m))
(cl:defmethod ID-val ((m <ClassifiedData-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rfid_handle-srv:ID-val is deprecated.  Use rfid_handle-srv:ID instead.")
  (ID m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ClassifiedData-request>) ostream)
  "Serializes a message object of type '<ClassifiedData-request>"
  (cl:let* ((signed (cl:slot-value msg 'rssi)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'ID))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'ID))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ClassifiedData-request>) istream)
  "Deserializes a message object of type '<ClassifiedData-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'rssi) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ID) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'ID) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ClassifiedData-request>)))
  "Returns string type for a service object of type '<ClassifiedData-request>"
  "rfid_handle/ClassifiedDataRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ClassifiedData-request)))
  "Returns string type for a service object of type 'ClassifiedData-request"
  "rfid_handle/ClassifiedDataRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ClassifiedData-request>)))
  "Returns md5sum for a message object of type '<ClassifiedData-request>"
  "debecf591fed201ff6091bab1098501c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ClassifiedData-request)))
  "Returns md5sum for a message object of type 'ClassifiedData-request"
  "debecf591fed201ff6091bab1098501c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ClassifiedData-request>)))
  "Returns full string definition for message of type '<ClassifiedData-request>"
  (cl:format cl:nil "int16 rssi~%string ID~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ClassifiedData-request)))
  "Returns full string definition for message of type 'ClassifiedData-request"
  (cl:format cl:nil "int16 rssi~%string ID~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ClassifiedData-request>))
  (cl:+ 0
     2
     4 (cl:length (cl:slot-value msg 'ID))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ClassifiedData-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ClassifiedData-request
    (cl:cons ':rssi (rssi msg))
    (cl:cons ':ID (ID msg))
))
;//! \htmlinclude ClassifiedData-response.msg.html

(cl:defclass <ClassifiedData-response> (roslisp-msg-protocol:ros-message)
  ((meanrssi
    :reader meanrssi
    :initarg :meanrssi
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (stdrssi
    :reader stdrssi
    :initarg :stdrssi
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (idcount
    :reader idcount
    :initarg :idcount
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0))
   (ID
    :reader ID
    :initarg :ID
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element "")))
)

(cl:defclass ClassifiedData-response (<ClassifiedData-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ClassifiedData-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ClassifiedData-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rfid_handle-srv:<ClassifiedData-response> is deprecated: use rfid_handle-srv:ClassifiedData-response instead.")))

(cl:ensure-generic-function 'meanrssi-val :lambda-list '(m))
(cl:defmethod meanrssi-val ((m <ClassifiedData-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rfid_handle-srv:meanrssi-val is deprecated.  Use rfid_handle-srv:meanrssi instead.")
  (meanrssi m))

(cl:ensure-generic-function 'stdrssi-val :lambda-list '(m))
(cl:defmethod stdrssi-val ((m <ClassifiedData-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rfid_handle-srv:stdrssi-val is deprecated.  Use rfid_handle-srv:stdrssi instead.")
  (stdrssi m))

(cl:ensure-generic-function 'idcount-val :lambda-list '(m))
(cl:defmethod idcount-val ((m <ClassifiedData-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rfid_handle-srv:idcount-val is deprecated.  Use rfid_handle-srv:idcount instead.")
  (idcount m))

(cl:ensure-generic-function 'ID-val :lambda-list '(m))
(cl:defmethod ID-val ((m <ClassifiedData-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rfid_handle-srv:ID-val is deprecated.  Use rfid_handle-srv:ID instead.")
  (ID m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ClassifiedData-response>) ostream)
  "Serializes a message object of type '<ClassifiedData-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'meanrssi))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'meanrssi))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'stdrssi))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'stdrssi))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'idcount))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    ))
   (cl:slot-value msg 'idcount))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'ID))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'ID))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ClassifiedData-response>) istream)
  "Deserializes a message object of type '<ClassifiedData-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'meanrssi) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'meanrssi)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'stdrssi) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'stdrssi)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'idcount) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'idcount)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536)))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'ID) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'ID)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ClassifiedData-response>)))
  "Returns string type for a service object of type '<ClassifiedData-response>"
  "rfid_handle/ClassifiedDataResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ClassifiedData-response)))
  "Returns string type for a service object of type 'ClassifiedData-response"
  "rfid_handle/ClassifiedDataResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ClassifiedData-response>)))
  "Returns md5sum for a message object of type '<ClassifiedData-response>"
  "debecf591fed201ff6091bab1098501c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ClassifiedData-response)))
  "Returns md5sum for a message object of type 'ClassifiedData-response"
  "debecf591fed201ff6091bab1098501c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ClassifiedData-response>)))
  "Returns full string definition for message of type '<ClassifiedData-response>"
  (cl:format cl:nil "float32[] meanrssi~%float32[] stdrssi~%int16[] idcount~%string[] ID~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ClassifiedData-response)))
  "Returns full string definition for message of type 'ClassifiedData-response"
  (cl:format cl:nil "float32[] meanrssi~%float32[] stdrssi~%int16[] idcount~%string[] ID~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ClassifiedData-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'meanrssi) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'stdrssi) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'idcount) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'ID) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ClassifiedData-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ClassifiedData-response
    (cl:cons ':meanrssi (meanrssi msg))
    (cl:cons ':stdrssi (stdrssi msg))
    (cl:cons ':idcount (idcount msg))
    (cl:cons ':ID (ID msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ClassifiedData)))
  'ClassifiedData-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ClassifiedData)))
  'ClassifiedData-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ClassifiedData)))
  "Returns string type for a service object of type '<ClassifiedData>"
  "rfid_handle/ClassifiedData")