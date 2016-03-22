
(cl:in-package :asdf)

(defsystem "facerobot-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "voiceRecog" :depends-on ("_package_voiceRecog"))
    (:file "_package_voiceRecog" :depends-on ("_package"))
    (:file "sound_synthesis" :depends-on ("_package_sound_synthesis"))
    (:file "_package_sound_synthesis" :depends-on ("_package"))
  ))