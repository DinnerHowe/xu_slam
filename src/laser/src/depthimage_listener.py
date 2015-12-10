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


import roslib
import rospy
from sensor_msgs.msg import PointCloud2
import math

class listener():

 def scan_callback(self, image):


  rospy.loginfo("length of image data: %d", len(image.data)) 

  rospy.loginfo("image height: %d ", image.height)
  rospy.loginfo("image width: %d ",  image.width)

  #rospy.loginfo(image.data)
  print "###################"

 def __init__(self):
  rospy.init_node('depthimage_listener')
  rospy.Subscriber('/camera/depth_registered/points/', PointCloud2, self.scan_callback)
  rospy.spin()

if __name__=='__main__':
 listener()
