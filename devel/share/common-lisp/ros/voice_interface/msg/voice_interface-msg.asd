
(cl:in-package :asdf)

(defsystem "voice_interface-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Navigation" :depends-on ("_package_Navigation"))
    (:file "_package_Navigation" :depends-on ("_package"))
    (:file "Motion" :depends-on ("_package_Motion"))
    (:file "_package_Motion" :depends-on ("_package"))
    (:file "Get" :depends-on ("_package_Get"))
    (:file "_package_Get" :depends-on ("_package"))
    (:file "Send" :depends-on ("_package_Send"))
    (:file "_package_Send" :depends-on ("_package"))
    (:file "Command" :depends-on ("_package_Command"))
    (:file "_package_Command" :depends-on ("_package"))
  ))