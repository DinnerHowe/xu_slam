#!/usr/bin/env python
#coding=utf-8
""" 2016/04/07

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""
import rospy, move_reference
from nav_msgs.msg import Path


#记录plan的
class plan_recorder():
 def __init__(self):
  rospy.init_node('plan_recorder')
  while not rospy.is_shutdown():
   topic='/move_base/TrajectoryPlannerROS/global_plan'
   plan=move_reference.plan_recorder(topic)
   print len(plan)

 
if __name__ == '__main__':
 try:
  rospy.loginfo( "initialization system")
  plan_recorder()
  rospy.loginfo( "process done and quit")
 except rospy.ROSInterruptException:
  rospy.loginfo("follower node terminated.")

