#!/usr/bin/env python
#coding=utf-8
""" 
- Version 4.0 2015/08/12
Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""
import rospy, actionlib
from geometry_msgs.msg import *
from actionlib_msgs.msg import *
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
from tf.transformations import quaternion_from_euler
from nav_msgs.msg import Odometry


class go_points():
 def __init__(self):
  self.trigger=True
  rospy.init_node('go_points')
  odom=rospy.wait_for_message("odom", Odometry)
  print '\n##################################3','odom','\n##################################3'


if __name__ == '__main__':
 try:
  print "initialization system"
  for i in range(5):
   go_points()
  print "process done and quit"
 except rospy.ROSInterruptException:
  rospy.loginfo("follower node terminated.")


