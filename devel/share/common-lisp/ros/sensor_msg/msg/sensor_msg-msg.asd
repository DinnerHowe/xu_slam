
(cl:in-package :asdf)

(defsystem "sensor_msg-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Bumper_Event" :depends-on ("_package_Bumper_Event"))
    (:file "_package_Bumper_Event" :depends-on ("_package"))
    (:file "Cliff_Event" :depends-on ("_package_Cliff_Event"))
    (:file "_package_Cliff_Event" :depends-on ("_package"))
  ))