#!/usr/bin/env python
#coding=utf-8
""" 2016/04/07

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""
import string, rospy
from nav_msgs.msg import Path,Odometry
from geometry_msgs.msg import PoseStamped

#记录path的
class path_recorder():
 def __init__(self):
  rospy.init_node('path_recorder')
  #trigger=raw_input("请输入y开始记录路进:")
  trigger='y'
  if string.lower(trigger)=='y':
   self.start()
  else:
   path_recorder()
   
 def define(self):
  self.path=Path()
  self.pose=PoseStamped()
  self.pose_list=[] 
  self.path.poses=[]
  #self.path.header.stamp=rospy.Time.now()
  self.pub = rospy.Publisher('/move_base/DWAPlannerROS/global_plan', Path, queue_size=10)
  
 def timer_callback(self,event):
  if self.current_pose.pose.pose not in self.pose_list:
   self.pose_list.append(self.current_pose.pose.pose)
   self.pose.pose=self.current_pose.pose.pose
   self.pose.header.frame_id='map'
   #self.pose.header.stamp=rospy.Time.now()
   self.pose.header.seq=0
   self.path.poses.append(self.pose)
    
  else:
   pass
  self.path.header.frame_id='map'
  self.path.header.stamp=rospy.Time.now()
  for element in self.path.poses:
   element.header.stamp=self.path.header.stamp
  print len(self.path.poses)
  self.pub.publish(self.path)


 def odom_callback(self,odom):
  self.current_pose=Odometry()
  self.current_pose.pose.pose.position.x=round(odom.pose.pose.position.x,5)
  self.current_pose.pose.pose.position.y=round(odom.pose.pose.position.y,5)
  self.current_pose.pose.pose.position.z=round(odom.pose.pose.position.z,5)
  #print 'current_pose.pose.pose','\n',self.current_pose.pose.pose
  #print '\n','pose.pose','\n',self.pose.pose
  #print '##############################'
  self.current_pose.pose.pose.orientation.x=round(odom.pose.pose.orientation.x,5)
  self.current_pose.pose.pose.orientation.y=round(odom.pose.pose.orientation.y,5)
  self.current_pose.pose.pose.orientation.z=round(odom.pose.pose.orientation.z,5)
  self.current_pose.pose.pose.orientation.w=round(odom.pose.pose.orientation.w,5)


 def start(self):
  self.define()
  rospy.Subscriber("odom",Odometry, self.odom_callback)
  rospy.Timer(rospy.Duration(0.5), self.timer_callback,oneshot=False)#每一
  rospy.spin()

 

 
if __name__ == '__main__':
 try:
  rospy.loginfo( "initialization system")
  path_recorder()
  rospy.loginfo( "process done and quit")
 except rospy.ROSInterruptException:
  rospy.loginfo("follower node terminated.")

