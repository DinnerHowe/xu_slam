#!/usr/bin/env python
#coding=utf-8
""" 2016/22/01

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""
import rospy
from voice_msg.msg import *

class voice_interface_tester():
 def __init__(self): 
  rospy.init_node('voice_pub_test',anonymous=False)
  pub = rospy.Publisher('Command', Command, queue_size=10)
  voice_command=Command()
  while not rospy.is_shutdown():
#送东西
   #voice_command.my_send.transmit=1
   #voice_command.my_send.object=52
   #voice_command.my_send.didian=39
#拿东西
   #voice_command.my_get.transmit=1
   #voice_command.my_get.object=52
   #voice_command.my_get.didian=37
#导航
   voice_command.my_navigation.navigation=1
   voice_command.my_navigation.go=33
   #voice_command.my_navigation.direct=37
   voice_command.my_navigation.columnNum=44
   voice_command.my_navigation.rowNum=46

#动作指示
   #voice_command.my_motion.motion=1
   #voice_command.my_motion.direction=12
   #voice_command.my_motion.pattern=13
   #voice_command.my_motion.stepcount=30
   
   pub.publish(voice_command)

if __name__=='__main__':
 try:
  rospy.loginfo( "initialization system")
  voice_interface_tester()
  rospy.loginfo( "process done and quit")
 except rospy.ROSInterruptException:
  rospy.loginfo("robot node terminated.")
