
(cl:in-package :asdf)

(defsystem "web_map-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "ort2D" :depends-on ("_package_ort2D"))
    (:file "_package_ort2D" :depends-on ("_package"))
    (:file "web_map" :depends-on ("_package_web_map"))
    (:file "_package_web_map" :depends-on ("_package"))
    (:file "web_odom" :depends-on ("_package_web_odom"))
    (:file "_package_web_odom" :depends-on ("_package"))
  ))