#!/usr/bin/env python
#coding=utf-8
""" 2015/12/29
默认地点录入程序

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""
import rospy,getpass,threading,Queue
from actions_reference import *

class default_register():
 def trigger(self):
  
 def register(self):
  module=rospy.loginfo('请在地图上用 publish point 输入您希望机器人到达的预注册点')
  odom=False:
  pre_regist(odom,'voice_interface')

 def __init__(self):
  rospy.init_node('default_position_register')
  


if __name__ == '__main__':
 try:
  rospy.loginfo( "initialization system")
  default_register()
  rospy.loginfo( "process done and quit")
 except rospy.ROSInterruptException:
  rospy.loginfo("follower node terminated.")

