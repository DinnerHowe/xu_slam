#!/usr/bin/env python  
#coding=utf-8

"""
Version 3.0 30/11
拆成2个pub,odom,不变则挂起，odom至变化才发布
Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. """

from nav_msgs.msg import OccupancyGrid,Odometry
from geometry_msgs.msg import Twist
import rospy,quat_to_angle
from web_map.msg import *
from map_listener_reference import *

class odom_listener():

 def odom_(self,data):
  resolution=data.info.resolution
  if data.twist.twist.linear.x !=0.0 or data.twist.twist.linear.y !=0.0 or data.twist.twist.linear.z !=0.0 or data.twist.twist.linear.x !=0.0 or data.twist.twist.linear.y !=0.0 or data.twist.twist.linear.z !=0.0:
   odom_pose=data.pose.pose
   #current pose
   position=odom_pose.position
   #current rotation
   angle=quat_to_angle(odom_pose.orientation)
   #地图上朝向点坐标
   [ort_x,ort_y]=ort_pose(angle,position,0.4)

   self.odom_data.orta_pose.x=ort_x/resolution
   self.odom_data.orta_pose.y=ort_y/resolution
   self.odom_data.pose.x=position.x/resolution
   self.odom_data.pose.y=position.y/resolution
   self.odom_data.pose.theta=angle

   self.pub_odom = rospy.Publisher('web_odom', web_odom, queue_size=5)
   self.pub_odom.publish(self.odom_data)
  else:
   pass

 def __init__(self):
  rospy.init_node('odom_thread', anonymous=False)
  self.odom_data=web_odom()
  rospy.Subscriber("odom", Odometry, self.odom_)
  rospy.spin()

if __name__ == '__main__':
 odom_listener()

 
