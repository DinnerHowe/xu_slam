#!/usr/bin/env python
#coding=utf-8
""" 2016/25/02

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""
import rospy,getpass
#from math import *
#from actions_reference import *
#from geometry_msgs import *
#from voice_msg.msg import Command
#from actionlib_msgs.msg import *
from coordinates import register

class tester():
 def __init__(self): 
  rospy.init_node('tester',anonymous=False)
  instance=register()
  instance.store_coordinate()
  #register().store_coordinate()
  print 'okokokokok'
 

if __name__=='__main__':
 try:
  rospy.loginfo( "initialization system")
  tester()
  rospy.loginfo( "process done and quit")
 except rospy.ROSInterruptException:
  rospy.loginfo("robot forward node terminated.")
