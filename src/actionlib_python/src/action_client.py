#!/usr/bin/env python
#coding=utf-8

"""
Copyright (c) 2016 Xu Zhihao (Howe).  All rights reserved.
This program is free software; you can redistribute it and/or modify
This programm is tested on kuboki base turtlebot. 
"""
import rospy
import actionlib_msgs.msg

class ActionClient():
 def __init__(self,topic,MsgType):
  self.topic = topic
  
  


if __name__=='__main__':
 rospy.init_node('action_client')
 try:
  rospy.loginfo ("initialization system")
  ActionClient()
  rospy.loginfo ("process done and quit")
 except rospy.ROSInterruptException:
  rospy.loginfo("robot node terminated.")
