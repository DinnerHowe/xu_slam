
(cl:in-package :asdf)

(defsystem "robot_status-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "launch_amcl" :depends-on ("_package_launch_amcl"))
    (:file "_package_launch_amcl" :depends-on ("_package"))
  ))