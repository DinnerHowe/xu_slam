#!/usr/bin/env python
#coding=utf-8
"""
遇到障碍物弹出当前的视频窗口

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.
This program is free software; you can redistribute it and/or modify
This programm is tested on kuboki base turtlebot. 
"""
import rospy,cv2,numpy,os
from sensor_msgs.msg import Image
from std_msgs.msg import String

class camera_image():
 def __init__(self):
  self.define()
  rospy.init_node("camera_image")
  rospy.Subscriber(self.camera_topic, Image ,self.camera_image_callback)
  rospy.Subscriber(self.warning_topic, String, self.warning_callback)
  rospy.spin()

 def define(self):
  self.topic=''
  self.warning_info=''
  self.image=Image()
  #topic_camera
  if rospy.has_param('~topic_camera'):
   self.camera_topic=rospy.get_param('~topic_camera')
  else:
   rospy.set_param('~topic_camera','/camera/rgb/image_color')
   self.camera_topic=rospy.get_param('~topic_camera')
   
  #topic_warning
  if rospy.has_param('~topic_warning'):
   self.warning_topic=rospy.get_param('~topic_warning')
  else:
   rospy.set_param('~topic_warning','/stop_flag')
   self.warning_topic=rospy.get_param('~topic_warning')
   
  #~ns
  if rospy.has_param('~ns'):
   self.ns=rospy.get_param('~ns')
  else:
   rospy.set_param('~ns','first_robot')
   self.ns=rospy.get_param('~ns')

  print self.ns,self.warning_topic,self.camera_topic

  self.cv_type={"mono8":"CV_8UC1","mono16":" CV_16UC1",
                     "bgr8":"CV_8UC3","rgb8":"CV_8UC3",
                     "bgra8":"CV_8UC4","rgba8":"CV_8UC4",}

  self.data_type = {'8U':'uint8', '8S':'int8', '16U':'uint16','16S':'int16', '32S':'int32', '32F':'float32','64F':'float64'}
  
 def camera_image_callback(self,data):
  if self.warning_info=='stop':
   self.camera_image_pop(data)
  else:
   pass
   
 def camera_image_pop(self,data):
  self.image=data
  self.capture=self.ros_to_cv(self.image)
  mat=self.capture
  cv2.imshow(self.ns,mat)
  if cv2.waitKey(2) & 0xFF == ord('q'):
   cv2.destroyWindow(self.ns)
   self.define()
   os.system('rosnode kill /%s/camera_image'%self.ns)
   print 'rosnode kill /%s/camera_image'%self.ns
  
  
 def ros_to_cv(self,image):
  channel=int(self.cv_type[image.encoding].split('UC')[1])
  shape=(image.height, image.width, channel)
  data=self.cv_type[image.encoding].split('CV_')[1]
  dtype=(self.data_type[data.split('C')[0]])
  return numpy.ndarray(shape, dtype, buffer=image.data)

 def warning_callback(self,data):
  self.warning_info = data.data 

if __name__=='__main__':
 try:
  rospy.loginfo("initialize system")
  camera_image()
  rospy.loginfo("process done and quit")
 except rospy.ROSInterruptException:
  rospy.loginfo("robot terminated")
