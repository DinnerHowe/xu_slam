#!/usr/bin/env python
#coding=utf-8
""" 2015/12/17
地图上选几个点进行巡航

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""
import rospy
from actions_reference import *

class cruise_modle():
 def __init__(self):
  rospy.init_node('cruise_modle')
  pose_number=int(raw_input('please type how many position wanna robot cruising: '))
  cruise(pose_number)

   

if __name__ == '__main__':
 try:
  rospy.loginfo( "initialization system")
  cruise_modle()
  rospy.loginfo( "process done and quit")
 except rospy.ROSInterruptException:
  rospy.loginfo("follower node terminated.")

