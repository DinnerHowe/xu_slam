#!/usr/bin/env python
#coding=utf-8
""" 2016/20/01

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""
import rospy
from voice_interface.msg import *

class voice_interface_tester():
 def __init__(self): 
  rospy.init_node('voice_pub_test',anonymous=False)
  pub = rospy.Publisher('Command', Command, queue_size=10)
  voice_command=Command()
  while not rospy.is_shutdown():
   voice_command.my_motion.motion=1
   voice_command.my_motion.direction=5
   voice_command.my_motion.pattern=13
   #voice_command.my_motion.stepcount=
   voice_command.my_motion.metric=33
   pub.publish(voice_command)

if __name__=='__main__':
 try:
  rospy.loginfo( "initialization system")
  voice_interface_tester()
  rospy.loginfo( "process done and quit")
 except rospy.ROSInterruptException:
  rospy.loginfo("robot forward node terminated.")
