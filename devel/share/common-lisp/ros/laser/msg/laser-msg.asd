
(cl:in-package :asdf)

(defsystem "laser-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "LaserLikihood" :depends-on ("_package_LaserLikihood"))
    (:file "_package_LaserLikihood" :depends-on ("_package"))
    (:file "warning" :depends-on ("_package_warning"))
    (:file "_package_warning" :depends-on ("_package"))
  ))