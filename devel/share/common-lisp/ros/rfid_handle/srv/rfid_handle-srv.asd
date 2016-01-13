
(cl:in-package :asdf)

(defsystem "rfid_handle-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "ClassifiedData" :depends-on ("_package_ClassifiedData"))
    (:file "_package_ClassifiedData" :depends-on ("_package"))
  ))