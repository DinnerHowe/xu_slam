#!/usr/bin/env python
#coding=utf-8
"""
multi-goal tasks

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""
import rospy,getpass,actions_reference

class cruise_modle():
 def __init__(self):
  rospy.init_node('cruise_tasks')
  while not rospy.is_shutdown():
   actions_reference.cruise()


if __name__ == '__main__':
 try:
  rospy.loginfo( "initialization system")
  cruise_modle()
  rospy.loginfo( "process done and quit")
 except rospy.ROSInterruptException:
  rospy.loginfo("follower node terminated.")

