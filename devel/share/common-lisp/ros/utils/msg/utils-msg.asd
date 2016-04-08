
(cl:in-package :asdf)

(defsystem "utils-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Cliff_Event" :depends-on ("_package_Cliff_Event"))
    (:file "_package_Cliff_Event" :depends-on ("_package"))
  ))