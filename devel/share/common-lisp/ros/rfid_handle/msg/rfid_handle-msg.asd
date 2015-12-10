
(cl:in-package :asdf)

(defsystem "rfid_handle-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "probability" :depends-on ("_package_probability"))
    (:file "_package_probability" :depends-on ("_package"))
  ))