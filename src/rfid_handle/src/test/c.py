#!/usr/bin/env python
"""
- Version 1.0 2015/9/8

this file is to pub fake rfid info for testing

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""
#!/usr/bin/env python
# license removed for brevity
import rospy
from rfid.msg import TransferData

class talker():
 def __init__(self):
  i=0
  pub = rospy.Publisher("rfid_sensor/rfidTransferData", TransferData, queue_size=10)
  rospy.init_node('talker', anonymous=True)
  self.TransferDate=TransferData()
  self.TransferDate1=TransferData() 
  rate=rospy.Rate(10)
  while not rospy.is_shutdown():
   x=raw_input("pls input x:\n")
   self.TransferDate.ID="%s"%x
   self.TransferDate.rssi=-(23+i)

   #self.TransferDate1.ID="a_%d"%(i-1)
   #self.TransferDate1.rssi=-(23+i-1)

   rospy.loginfo(self.TransferDate)
   rospy.loginfo(self.TransferDate1)

   pub.publish(self.TransferDate)
   #pub.publish(self.TransferDate1)
   i+=1
   rate.sleep()
if __name__ == '__main__':
 try:
  talker()
 except rospy.ROSInterruptException:
  pass

