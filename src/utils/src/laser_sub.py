#!/usr/bin/env python
""" 
- Version 1.0 2015/09/23

this is the ---laser data subscriber
    

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""
import rospy
from laser.msg import LaserLikihood
from sensor_msgs.msg import LaserScan
import math
class LaserListener():

 def __init__(self):

  print "laser listener node"
  rospy.init_node('Laser_sub')
  #listen to laser sensor
  print "subscribing to laser scanning"
  rospy.Subscriber('scan', LaserScan, self.scan_callback)
  rospy.spin()
  print "procceed done"

 def scan_callback(self, scan):
  print '\n',scan,'\n'
############################ main ###########################3

if __name__=='__main__':
 try:
  print "initialization system"
  LaserListener()
  print "process done and quit"
 except rospy.ROSInterruptException:
  rospy.loginfo("laser_sub node terminated.")

