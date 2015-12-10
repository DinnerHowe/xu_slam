#!/usr/bin/env python
"""
- Version 1.0 2015/9/11

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""

import rospy
from speed_handle.srv import *
import os
class SpeedHandleTest(): 
 def __init__(self):
  rospy.init_node('SpeedHandleTestchanger', anonymous=True)
  rospy.wait_for_service('speed')
  service=rospy.ServiceProxy('speed',Speed)
  self.speed=SpeedRequest()
  #rospy.loginfo (self.speed)
  self.status=''
  while not rospy.is_shutdown():

   try:
    sp=float(raw_input("pls input the speed you wanna pub:\n"))
    angular=float(raw_input("pls input the angular you wanna pub:\n"))
   except Exception:
    sys.exit()

   if self.status=='':
    if self.speed.linear.x!=sp or self.speed.angular.z!=angular:
     self.speed.linear.x=sp
     self.speed.angular.z=angular
     rospy.loginfo(self.speed)
     response=service(self.speed)
     self.status=response.status
     print '1',self.status
 
   else:
    if self.speed.linear.x!=sp or self.speed.angular.z!=angular:
     self.speed.linear.x=sp
     self.speed.angular.z=angular
     rospy.loginfo(self.speed)
     response=service(self.speed)
     self.status=response.status
     print '2',self.status
    elif self.speed.linear.x==sp and self.speed.angular.z==angular:
     print '3',self.status
     pass
    else:
     print '4',self.status
     pass

#########################
##        main         ##
#########################
if __name__=='__main__':
 try:
  print "initialization system"
  SpeedHandleTest()
  print "process done and quit"
 except rospy.ROSInterruptException:
  rospy.loginfo("speed handle tester changer node terminated.")
