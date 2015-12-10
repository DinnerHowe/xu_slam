#!/usr/bin/env python  
#coding=utf-8

"""
Version 3.0 2015/18-19/11

概率地图+'odometry'+'quat—angle'
pub + threading方法，但是烧内存？容易死机
撤销threading，减小内存负担，only publihser，计算好数据只发送，障碍物+已知点+机器人状态坐标

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. """

from nav_msgs.msg import OccupancyGrid,Odometry
from geometry_msgs.msg import Pose
import rospy,quat_to_angle,collections
from robot_status.msg import *

#testing 
import map_listener_reference,os


class map_odom_class():
 def map_(self,data):

  map_origin=Pose()
  map_matrix=collections.deque()
  map_width=[]
  width=data.info.width
  height=data.info.height
  print '\nthreading\nwidth',width,'height',height
  map_centre=data.info.origin

  for i in range(height):
   for j in range(width):
    map_width.append(data.data[j+width*i])
   map_matrix.appendleft(map_width)
   map_width=[]
  
  status=map_listener_reference.store_xlsx(list(map_matrix),height,width)

  self.map_data.data=str(map_matrix)
  self.map_data.pose=map_origin

  self.pub_map.publish(self.map_data)
  map_matrix.clear()
  if status=='ok':
   os.system('rosnode kill /map_odom')

 def odom_(self,data):
  odom_pose=data.pose.pose

  #current pose
  position=odom_pose.position
  #current rotation
  angle=quat_to_angle.quat_to_angle(odom_pose.orientation)
  #地图上朝向点坐标
  [ort_x,ort_y]=quat_to_angle.ort_pose(angle,position,0.4)
  self.odom_data.data=str([angle,ort_x,ort_y])
  self.odom_data.pose=odom_pose
  self.pub_odom.publish(self.odom_data)

 def __init__(self):

  rospy.init_node('map_odom', anonymous=False)
  self.map_data=map_odom()
  self.odom_data=map_odom()

  self.pub_odom = rospy.Publisher('web_odom', map_odom, queue_size=10)
  self.pub_map = rospy.Publisher('web_map', map_odom, queue_size=10)

  rospy.Subscriber("map", OccupancyGrid, self.map_)
  rospy.Subscriber("odom", Odometry, self.odom_)
  rospy.spin()

if __name__ == '__main__':
 map_odom_class()
 
