#!/usr/bin/env python
#coding=utf-8
""" 
- Version 4.0 2015/08/12

几个矩阵点之间移动

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

if __name__ == '__main__':
 try:
  print "initialization system"
  go_points()
  print "process done and quit"
 except rospy.ROSInterruptException:
  rospy.loginfo("follower node terminated.")


class go_points():
 def __init__(self):
  self.trigger=True
  rospy.init_node('go_points')
  rospy.Subscriber("odom", Odometry, self.odom)
  rospy.spin()
  
 def odom(self,data):
  if self.trigger==True:
   odom_x=data.pose.pose.position.x
   odom_y=data.pose.pose.position.y
   self.trigger=False
  #args = rospy.myargv(argv=sys.argv)
  bin_number = rospy.get_param('~bin_number')
  print bin_number
  move_base = actionlib.SimpleActionClient('move_base', MoveBaseAction)
  move_base.wait_for_server()
  goal = MoveBaseGoal()
  goal.target_pose.header.frame_id = rospy.get_param('bin_number', 'map')
  if bin_number%2==0:
   goal.target_pose.pose.position.x = 1.4 * (odom_x % 5);
   goal.target_pose.pose.position.y = 1.4 * (odom_x / 5);
   if bin_number >= 5:
    yaw = 1.57
   else:
    yaw = -1.57
   orient = Quaternion(*quaternion_from_euler(0, 0, yaw))
   goal.target_pose.pose.orientation = orient
  if bin_number%2==1:
   
  move_base.send_goal(goal)
  move_base.wait_for_result()
  state=move_base.get_state()
  if state==GoalStatus.SUCCEEDED:
   print True
  else:
   print False
  self.trigger=True
