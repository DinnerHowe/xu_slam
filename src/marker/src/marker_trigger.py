#!/usr/bin/env python
#coding=utf-8
""" 
this code is used for making marker in map

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""
import rospy,std_msgs.msg

class trigger():
 def __init__(self):
  rospy.init_node('marker_trigger')
  while not rospy.is_shutdown():
   pub = rospy.Publisher('empty_marker', std_msgs.msg.Bool, queue_size=1)
   if raw_input('请问是否清空marker(输入1清空markers): ')=='1':
    trigger=True
    pub.publish(trigger)
   else:
    trigger=False
    pub.publish(trigger)


if __name__=='__main__':
 try:
  rospy.loginfo ("initialization system")
  trigger()
  rospy.loginfo ("process done and quit")
 except rospy.ROSInterruptException:
  rospy.loginfo("robot twist node terminated.")
