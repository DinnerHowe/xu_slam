
(cl:in-package :asdf)

(defsystem "robot_status-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :nav_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "mapdata" :depends-on ("_package_mapdata"))
    (:file "_package_mapdata" :depends-on ("_package"))
    (:file "map_odom" :depends-on ("_package_map_odom"))
    (:file "_package_map_odom" :depends-on ("_package"))
    (:file "robot_odom" :depends-on ("_package_robot_odom"))
    (:file "_package_robot_odom" :depends-on ("_package"))
  ))