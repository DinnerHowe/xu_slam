
(cl:in-package :asdf)

(defsystem "speed_handle-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "speed" :depends-on ("_package_speed"))
    (:file "_package_speed" :depends-on ("_package"))
    (:file "Victor" :depends-on ("_package_Victor"))
    (:file "_package_Victor" :depends-on ("_package"))
  ))