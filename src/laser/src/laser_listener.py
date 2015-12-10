#!/usr/bin/env python
""" laser listener 

- Version 1.0 2015/8/26

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

  print "laser listener node"
  rospy.init_node('Laser_Listener')
  #listen to laser sensor
  print "subscribing to laser scanning"
  rospy.Subscriber('scan', LaserScan, self.scan_callback)
  rospy.spin()
  print "procceed done"

 def scan_callback(self, scan):
  #print "calculating obstacle dirction liklihood"
  self.ranges=scan.ranges
  self.likihood=LaserLikihood()

  self.likihood.rweight=LaserLikihood.rweight
  self.likihood.mrweight=LaserLikihood.mrweight
  self.likihood.mlweight=LaserLikihood.mlweight
  self.likihood.lweight=LaserLikihood.lweight
  #compare the right range data fingerout it's closing weight right
  close_num,normal_num=self.CompareDistance(0,int(2*len(self.ranges)/5))
  if close_num > normal_num:
   self.likihood.rweight=1
  else:
   self.likihood.rweight=0
  #compare the middle range data fingerout it's closing weight middle
  close_num,normal_num=self.CompareDistance(int(1*len(self.ranges)/5),int(3*len(self.ranges)/5))
  if close_num > normal_num:
   self.likihood.mrweight=1
  else:
   self.likihood.mrweight=0
  #compare the left range data fingerout it's closing weight left
  close_num,normal_num=self.CompareDistance(int(2*len(self.ranges)/5),int(4*len(self.ranges)/5))
  if close_num > normal_num:
   self.likihood.mlweight=1
  else:
   self.likihood.mlweight=0
  close_num,normal_num=self.CompareDistance(int(3*len(self.ranges)/5),int(len(self.ranges)))
  if close_num > normal_num:
   self.likihood.lweight=1
  else:
   self.likihood.lweight=0

  pub = rospy.Publisher('Laser_Likihood',LaserLikihood,queue_size=5)
  rospy.loginfo(self.likihood)
  pub.publish(self.likihood)
 def CompareDistance(self,data1, data2):
  print "start calculate distance"
  close=0
  far=0
  normal=0
  i=data1+1
  while data1<i<data2 and not rospy.is_shutdown():
   #if self.ranges[i] < 0.53 or math.isnan(self.ranges[i]):
   if self.ranges[i] < 0.85 or math.isnan(self.ranges[i]):
    close+=1
   else:
    normal+=1
   i+=1
  print "distance calculation is done"
  return close,normal
############################ main ###########################3

if __name__=='__main__':
 try:
  print "initialization system"
  LaserListener()
  print "process done and quit"
 except rospy.ROSInterruptException:
  rospy.loginfo("laser_listener node terminated.")

