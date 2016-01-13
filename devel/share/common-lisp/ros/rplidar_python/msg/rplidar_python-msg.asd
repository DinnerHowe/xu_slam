
(cl:in-package :asdf)

(defsystem "rplidar_python-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "rplidar_parameters" :depends-on ("_package_rplidar_parameters"))
    (:file "_package_rplidar_parameters" :depends-on ("_package"))
    (:file "rplidar_point" :depends-on ("_package_rplidar_point"))
    (:file "_package_rplidar_point" :depends-on ("_package"))
    (:file "rplidar_data" :depends-on ("_package_rplidar_data"))
    (:file "_package_rplidar_data" :depends-on ("_package"))
  ))