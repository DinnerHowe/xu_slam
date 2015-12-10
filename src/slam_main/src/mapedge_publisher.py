#!/usr/bin/env python
""" 
- Version 1.0 2015/11/6

this file is subscribing mapdata and explore unknown environment.

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""
import rospy
from robot_status.msg import mapdata
class unknown_detector():



 def __init__(self):
  rospy.init_node('unknown_environment_detector', anonymous=False)
  rospy.Subscriber("robot_status", mapdata, self.frist)
  rospy.spin()
  
if __name__=='__main__':
 try:
  print "initialization system"
  unknown_detector()
  print "process done and quit"
 except rospy.ROSInterruptException:
  rospy.loginfo("unknown_detector node terminated.")
