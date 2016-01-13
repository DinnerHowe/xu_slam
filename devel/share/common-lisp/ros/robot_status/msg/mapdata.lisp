; Auto-generated. Do not edit!


(cl:in-package robot_status-msg)


;//! \htmlinclude mapdata.msg.html

(cl:defclass <mapdata> (roslisp-msg-protocol:ros-message)
  ((grid
    :reader grid
    :initarg :grid
    :type nav_msgs-msg:OccupancyGrid
    :initform (cl:make-instance 'nav_msgs-msg:OccupancyGrid))
   (odom
    :reader odom
    :initarg :odom
    :type robot_status-msg:robot_odom
    :initform (cl:make-instance 'robot_status-msg:robot_odom))
   (mapnum
    :reader mapnum
    :initarg :mapnum
    :type cl:integer
    :initform 0))
)

(cl:defclass mapdata (<mapdata>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <mapdata>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'mapdata)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_status-msg:<mapdata> is deprecated: use robot_status-msg:mapdata instead.")))

(cl:ensure-generic-function 'grid-val :lambda-list '(m))
(cl:defmethod grid-val ((m <mapdata>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_status-msg:grid-val is deprecated.  Use robot_status-msg:grid instead.")
  (grid m))

(cl:ensure-generic-function 'odom-val :lambda-list '(m))
(cl:defmethod odom-val ((m <mapdata>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_status-msg:odom-val is deprecated.  Use robot_status-msg:odom instead.")
  (odom m))

(cl:ensure-generic-function 'mapnum-val :lambda-list '(m))
(cl:defmethod mapnum-val ((m <mapdata>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_status-msg:mapnum-val is deprecated.  Use robot_status-msg:mapnum instead.")
  (mapnum m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <mapdata>) ostream)
  "Serializes a message object of type '<mapdata>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'grid) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'odom) ostream)
  (cl:let* ((signed (cl:slot-value msg 'mapnum)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <mapdata>) istream)
  "Deserializes a message object of type '<mapdata>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'grid) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'odom) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'mapnum) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<mapdata>)))
  "Returns string type for a message object of type '<mapdata>"
  "robot_status/mapdata")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'mapdata)))
  "Returns string type for a message object of type 'mapdata"
  "robot_status/mapdata")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<mapdata>)))
  "Returns md5sum for a message object of type '<mapdata>"
  "bd84b02b7e7fa15748f38cf373f42238")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'mapdata)))
  "Returns md5sum for a message object of type 'mapdata"
  "bd84b02b7e7fa15748f38cf373f42238")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<mapdata>)))
  "Returns full string definition for message of type '<mapdata>"
  (cl:format cl:nil "nav_msgs/OccupancyGrid grid~%robot_status/robot_odom odom~%int32 mapnum~%~%~%================================================================================~%MSG: nav_msgs/OccupancyGrid~%# This represents a 2-D grid map, in which each cell represents the probability of~%# occupancy.~%~%Header header ~%~%#MetaData for the map~%MapMetaData info~%~%# The map data, in row-major order, starting with (0,0).  Occupancy~%# probabilities are in the range [0,100].  Unknown is -1.~%int8[] data~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: nav_msgs/MapMetaData~%# This hold basic information about the characterists of the OccupancyGrid~%~%# The time at which the map was loaded~%time map_load_time~%# The map resolution [m/cell]~%float32 resolution~%# Map width [cells]~%uint32 width~%# Map height [cells]~%uint32 height~%# The origin of the map [m, m, rad].  This is the real-world pose of the~%# cell (0,0) in the map.~%geometry_msgs/Pose origin~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: robot_status/robot_odom~%std_msgs/Header header~%geometry_msgs/Point position~%geometry_msgs/Quaternion rotation~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'mapdata)))
  "Returns full string definition for message of type 'mapdata"
  (cl:format cl:nil "nav_msgs/OccupancyGrid grid~%robot_status/robot_odom odom~%int32 mapnum~%~%~%================================================================================~%MSG: nav_msgs/OccupancyGrid~%# This represents a 2-D grid map, in which each cell represents the probability of~%# occupancy.~%~%Header header ~%~%#MetaData for the map~%MapMetaData info~%~%# The map data, in row-major order, starting with (0,0).  Occupancy~%# probabilities are in the range [0,100].  Unknown is -1.~%int8[] data~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: nav_msgs/MapMetaData~%# This hold basic information about the characterists of the OccupancyGrid~%~%# The time at which the map was loaded~%time map_load_time~%# The map resolution [m/cell]~%float32 resolution~%# Map width [cells]~%uint32 width~%# Map height [cells]~%uint32 height~%# The origin of the map [m, m, rad].  This is the real-world pose of the~%# cell (0,0) in the map.~%geometry_msgs/Pose origin~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: robot_status/robot_odom~%std_msgs/Header header~%geometry_msgs/Point position~%geometry_msgs/Quaternion rotation~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <mapdata>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'grid))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'odom))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <mapdata>))
  "Converts a ROS message object to a list"
  (cl:list 'mapdata
    (cl:cons ':grid (grid msg))
    (cl:cons ':odom (odom msg))
    (cl:cons ':mapnum (mapnum msg))
))
