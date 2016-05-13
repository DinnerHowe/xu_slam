#!/usr/bin/env python
#coding=utf-8
"""
test

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.
This program is free software; you can redistribute it and/or modify
This programm is tested on kuboki base turtlebot. 
"""
import rospy,cv2,numpy
from sensor_msgs.msg import Image

class camera_image():
 def __init__(self):
  self.define()
  rospy.init_node("camera_image_tests")
  if rospy.has_param('~topic'):
   self.topic=rospy.get_param('~topic')
  else:
   rospy.set_param('~topic','/camera/rgb/image_color')
   self.topic=rospy.get_param('~topic')
  rospy.Subscriber(self.topic,Image ,self.camera_image_callback)
  rospy.spin()

 def define(self):
  self.topic=''
  self.image=Image()
  
 def camera_image_callback(self,data):
  print 'encoding: ',data.encoding
  print 'is_bigendian: ',data.is_bigendian
  print 'step: ',data.step

if __name__=='__main__':
 try:
  rospy.loginfo("initialize system")
  camera_image()
  rospy.loginfo("process done and quit")
 except rospy.ROSInterruptException:
  rospy.loginfo("robot terminated")
