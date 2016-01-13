
(cl:in-package :asdf)

(defsystem "speed_handle-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :speed_handle-msg
)
  :components ((:file "_package")
    (:file "Speed" :depends-on ("_package_Speed"))
    (:file "_package_Speed" :depends-on ("_package"))
    (:file "victors" :depends-on ("_package_victors"))
    (:file "_package_victors" :depends-on ("_package"))
  ))