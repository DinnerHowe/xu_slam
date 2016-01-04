#!/usr/bin/env python
"""
- Version 1.0 2015/12/31

this file is used to transfer teleop to gazebo simulator

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""
import rospy
from geometry_msgs.msg import Twist
class TeleHandle():
 def callback(self, data):
  self.data=Twist()
  self.data.linear.x=data.linear.x
  self.data.linear.y=data.linear.y
  self.data.linear.z=data.linear.z

  self.data.angular.x=data.angular.x
  self.data.angular.y=data.angular.y
  self.data.angular.z=data.angular.z

  pub = rospy.Publisher('/mobile_base/commands/velocity', Twist, queue_size=10)
  rospy.loginfo(self.data)
  pub.publish(self.data)
 
 def __init__(self):
  rospy.init_node('tele_handle', anonymous=True)
  rospy.Subscriber('/cmd_vel_mux/input/teleop',Twist, self.callback)
  rospy.spin()

if __name__ == '__main__':
 TeleHandle()
