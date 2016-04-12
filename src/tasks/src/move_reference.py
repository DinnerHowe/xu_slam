#!/usr/bin/env python  
#coding=utf-8

""" 2016/04/05

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""

import getpass,PyKDL,collections,numpy,math,tf,rospy
from geometry_msgs.msg import Pose,Twist
from nav_msgs.msg import Path

#turn_speed in rad/s,radius in meter, duration in sec


#twist by frame difference
def twist_frame(target_frame,source_frame):
 #pub = rospy.Publisher('/cmd_vel_mux/input/teleop', Twist, queue_size=1)
 pub = rospy.Publisher('/cmd_vel', Twist, queue_size=1)
 move_cmd= Twist() 
 listener = tf.TransformListener()
 achieve_goal=True
 while not rospy.is_shutdown() and achieve_goal:
  try:
   (trans,rot)=listener.lookupTransform(target_frame,source_frame,rospy.Time(0))
  except(tf.LookupException, tf.ConnectivityException, tf.ExtrapolationException) as error:
   continue
  threld=0.01
  if trans>(threld,threld,threld):
   linear = 0.5 * math.sqrt(trans[0] ** 2 + trans[1] ** 2)
   angular = 4*math.atan2(trans[1], trans[0])
  else:
   linear=0.0
   euler=tf.transformations.euler_from_quaternion(rot)
   angular=euler[2]
  move_cmd.linear.x = linear
  move_cmd.angular.z = angular
  pub.publish(move_cmd)
  if linear==0 and abs(angular)<=0.001:
   linear=0.0
   angular=0.0
   move_cmd.linear.x = linear
   move_cmd.angular.z = angular
   pub.publish(move_cmd)
   achieve_goal=False
   break
  
#记录plan
def plan_recorder(topic):
 path=rospy.wait_for_message('%s'%topic, Path)
 path_poses=path.poses
 return path_poses
 

def quat_to_angle(quat):
 rot = PyKDL.Rotation.Quaternion(quat[0], quat[1], quat[2], quat[3])
 return rot.GetRPY()[2]

def angle_to_quat(angle):#in rad
 rot = PyKDL.Rotation.RotZ(angle)
 return rot.GetQuaternion()
 
# 产生一个朝向当前目标点的角度
def angle_generater(sub_point,pre_point):
 if pre_point.x<sub_point.x:
  angle= math.atan((sub_point.y-pre_point.y)/(sub_point.x-pre_point.x))
 if pre_point.x>sub_point.x:
  angle= math.pi+math.atan((sub_point.y-pre_point.y)/(sub_point.x-pre_point.x))
 if pre_point.x==sub_point.x:
  angle= math.pi+math.pi/2
 return angle
