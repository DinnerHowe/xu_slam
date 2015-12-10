#!/usr/bin/env python
"""
- Version 1.0 2015/9/9

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""

import rospy
from speed_handle.msg import speed
from geometry_msgs.msg import Twist
class SpeedHandleTest():     
 def __init__(self):
  pub = rospy.Publisher('speed', speed, queue_size=5)
  rospy.init_node('SpeedHandleTest', anonymous=True)
  self.speed=Twist()
  self.speed.linear.x=0.1
  self.speed.angular.z=0
  pub.publish(self.speed)

#########################
##        main         ##
#########################
if __name__=='__main__':
 try:
  print "initialization system"
  SpeedHandleTest()
  print "process done and quit"
 except rospy.ROSInterruptException:
  rospy.loginfo("speed handle tester node terminated.")
