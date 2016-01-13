
(cl:in-package :asdf)

(defsystem "slam_main-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "position" :depends-on ("_package_position"))
    (:file "_package_position" :depends-on ("_package"))
    (:file "orientation" :depends-on ("_package_orientation"))
    (:file "_package_orientation" :depends-on ("_package"))
    (:file "pose" :depends-on ("_package_pose"))
    (:file "_package_pose" :depends-on ("_package"))
  ))