#!/usr/bin/env python
#coding=utf-8
""" 2016/04/07

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""
import string, rospy
from nav_msgs.msg import Path

#从一个plan中订阅path然后发布path到global_plan中
class path_publisher():
 def __init__(self):
  rospy.init_node('path_publisher')
  #trigger=raw_input("请输入y开始发布路进:")
  trigger='y'
  if string.lower(trigger)=='y':
   self.start()
  else:
   path_publisher()
   
 def define(self):
  self.pub = rospy.Publisher('/move_base/DWAPlannerROS/global_plan', Path, queue_size=10)


 def path_callback(self,path):
  print path
  self.pub.publish(path)


 def start(self):
  self.define()
  rospy.Subscriber("/move_base/NavfnROS/plan",Path, self.path_callback)
  rospy.spin()

 

 
if __name__ == '__main__':
 try:
  rospy.loginfo( "initialization system")
  path_publisher()
  rospy.loginfo( "process done and quit")
 except rospy.ROSInterruptException:
  rospy.loginfo("follower node terminated.")

