#!/usr/bin/env python
#coding=utf-8

""" 
用来手动控制多机协调

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""

import rospy

from geometry_msgs.msg import Twist

class multi_tele_handle():

 def callback(self, data):
  self.handle_data=Twist()
  self.handle_data.linear.x=data.linear.x
  self.handle_data.linear.y=data.linear.y
  self.handle_data.linear.z=data.linear.z

  self.handle_data.angular.x=data.angular.x
  self.handle_data.angular.y=data.angular.y
  self.handle_data.angular.z=data.angular.z
  if rospy.has_param('~topic'):
   topic=rospy.get_param('~topic')
  else:
   pass
   #rospy.set_param('~topic','/first_robot/cmd_vel')
   #topic=rospy.get_param('~topic')
  pub = rospy.Publisher('%s'%topic, Twist, queue_size=1)
  
  rospy.loginfo(topic)
  #rospy.loginfo(self.handle_data)
  pub.publish(self.handle_data)

 def __init__(self):
  rospy.init_node('multi_tele_handle', anonymous=True)
  
  if rospy.has_param('~subscribe_to'):
   subscribe_to=rospy.get_param('~subscribe_to')
  else:
   pass
   #rospy.set_param('~subscribe_to','/first_robot/cmd_vel_mux/input/teleop')
   #subscribe_to=rospy.get_param('~subscribe_to')
   
  rospy.Subscriber('%s'%subscribe_to, Twist, self.callback)

  rospy.spin()

if __name__=='__main__':
 try:
  print "initialization system"
  multi_tele_handle()
  print "process done and quit"
 except rospy.ROSInterruptException:
  rospy.loginfo("robot excel_to_coordinate node terminated.")
