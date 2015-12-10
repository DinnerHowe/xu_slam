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
from sensor_msgs.msg import PointCloud2
import math

class listener():

 def scan_callback(self, image):
  #self.seq = data.seq
  #self.stamp = image.stamp
  #self.ID = image.frame_id
  #self.height = image.height
  #self.width = image.width
  #self.encoding = image.encoding
  #self.is_bigendian = image.is_bigendian
  #self.step = image.step
  #self.data = image.data

  rospy.loginfo(len(image.data)) 

  #rospy.loginfo(self.seq)
  #rospy.loginfo(image.stamp)
  #rospy.loginfo(image.ID)
  #rospy.loginfo(image.height)
  #rospy.loginfo(image.width)
  #rospy.loginfo(image.encoding)
  #rospy.loginfo(image.is_bigendian)
  rospy.loginfo(image.data)
  #print "%s" %self.width
  #print "%s" %self.encoding
  #print "%s" %self.is_bigendian
  #print "%s" %self.step
  print "###################"
  #print "%s"%image.data 
  #show me all points distance
  #rospy.loginfo(image.data)



 def __init__(self):
  rospy.init_node('laser_listener')
  rospy.Subscriber('/camera/depth_registered/points/', PointCloud2, self.scan_callback)
  #rospy.sleep(1)
  rospy.spin()

if __name__=='__main__':
 listener()
