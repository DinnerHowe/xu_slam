#!/usr/bin/env python
#coding=utf-8
""" 2015/04/05

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""
import rospy,getpass,move_reference,actions_reference

class cruise_modle():
 def __init__(self):
  rospy.init_node('tasks')
  #move_reference.twist_frame('base_link','target_frame')
  actions_reference.cruise()
  cruise_modle()

if __name__ == '__main__':
 try:
  rospy.loginfo( "initialization system")
  cruise_modle()
  rospy.loginfo( "process done and quit")
 except rospy.ROSInterruptException:
  rospy.loginfo("follower node terminated.")

