#!/usr/bin/env python
""" laser listener 

- Version 1.0 2015/9/07

this is the ---laser publisher for obstacle detector. 
    

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

  rospy.init_node('Laser_pub')
  #listen to laser sensor
  print "subscribing to laser scanning"
  rospy.Subscriber('scan', LaserScan, self.callback)
  rospy.spin()
  print "procceed done"

 def callback(self, scan):
  self.scan=scan
  pub = rospy.Publisher('laser_sensor/scan',LaserScan,queue_size=5)
  pub.publish(self.scan)

if __name__=='__main__':
 try:
  print "initialization system"
  LaserListener()
  print "process done and quit"
 except rospy.ROSInterruptException:
  rospy.loginfo("laser_pub node terminated.")

