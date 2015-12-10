#!/usr/bin/env python

""" laser listener.py 
laser_listener
- Version 3.1 2015/7/28

this code is a listener of laser scanner for SLAM

this code would listen to kinect scanner, before we listen to scan topic. A convertion was made by pointcloud_to_laserscan. Also a classification for the range data was done by this code
    

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""


import roslib; #roslib.load_manifest('ros_liv_wander')
import rospy
from sensor_msgs.msg import LaserScan
import math

class listener():

 def CompareDistance(self,data1, data2):
  minimal=0
  maximal=0
  normal=0
  i=data1
  while (data1-1)<i<data2 and not rospy.is_shutdown():
   if self.ranges[i] < 1 or math.isnan(self.ranges[i]):
    minimal+=1
   elif self.ranges[i] > 3.0:
    maximal+=1
   else:
    normal+=1
   i+=1
  #rospy.loginfo(self.ranges)
  print "i=%d"%i
  print "%d~~~~%d"%(data1,data2)
  print "close: min num %s" % minimal
  print "normal %s" % normal
  print "far: max num %s"% maximal

 def scan_callback(self, scan):
  rospy.loginfo((len(scan.ranges), min(scan.ranges))) 
  range_min=scan.range_min
  range_max=scan.range_max
  self.ranges=scan.ranges
  print "%f" %range_min
  print "%f" %range_max
  #show me all points distance
  rospy.loginfo(self.ranges)
  self.CompareDistance(0,len(self.ranges)/4)
  self.CompareDistance(int(len(self.ranges)/4),int(len(self.ranges)/2))
  self.CompareDistance(int(len(self.ranges)/2),int((3*len(self.ranges))/4))
  self.CompareDistance(int((3*len(self.ranges))/4),int((4*len(self.ranges))/4))
  rospy.loginfo(len(self.ranges))



 def __init__(self):
  rospy.init_node('laser_listener')
  rospy.Subscriber('scan', LaserScan, self.scan_callback)
  #rospy.sleep(1)
  rospy.spin()

if __name__=='__main__':
 listener()
