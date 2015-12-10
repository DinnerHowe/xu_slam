#!/usr/bin/env python
""" 
- Version 1.0 2015/09/17

this file is to deal multi-prticles in order to generate map info

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""

import os
import rospy
from rfid_handle.msg import probability
class mapinfo():
 

 def callback(self,data):
  self.lock=probability() 
  self.lock=data.probability
  self.pub.publish(str(self.lock))

 def __init__(self):
  os.system('')
  #store=open('SingleScan.txt','a')
  rospy.init_node('RFID_mapinfo', anonymous=True)
  rospy.Subscriber("particles", probability, self.callback)
  self.pub = rospy.Publisher('optimise_likelihood', probability, queue_size=10)
  rospy.spin()
if __name__=='__main__':
 try:
  mapinfo()
 except rospy.ROSInterruptException:
  pass
