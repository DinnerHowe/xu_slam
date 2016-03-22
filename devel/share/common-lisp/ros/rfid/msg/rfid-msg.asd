
(cl:in-package :asdf)

(defsystem "rfid-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "rfid_odom" :depends-on ("_package_rfid_odom"))
    (:file "_package_rfid_odom" :depends-on ("_package"))
    (:file "RFIDreadRow" :depends-on ("_package_RFIDreadRow"))
    (:file "_package_RFIDreadRow" :depends-on ("_package"))
    (:file "rfid_info" :depends-on ("_package_rfid_info"))
    (:file "_package_rfid_info" :depends-on ("_package"))
    (:file "TransferData" :depends-on ("_package_TransferData"))
    (:file "_package_TransferData" :depends-on ("_package"))
  ))