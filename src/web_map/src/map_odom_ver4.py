#!/usr/bin/env python  
#coding=utf-8

"""
Version 4.0 30/11

该成发布地图上点的坐标

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. """

from nav_msgs.msg import OccupancyGrid,Odometry
from geometry_msgs.msg import Pose
import rospy,quat_to_angle,threading
from web_map.msg import *
from map_listener_reference import *

lock=threading.RLock()

class map_listener(threading.Thread):

 def map_(self,data):
  lock.acquire()
  [clear_area,block_area]=effective_point(data)
  self.map_data.clear_area=str(clear_area)
  self.map_data.block_area=str(block_area)
  pub_map = rospy.Publisher('web_map', web_map, queue_size=10)
  print self.map_data
  pub_map.publish(self.map_data)
  lock.release()

 def run(self):
  self.old_data=OccupancyGrid()
  self.map_data=web_map()
  rospy.Subscriber("map", OccupancyGrid, self.map_)

 def __init__(self):
  threading.Thread.__init__(self)
  self.alive = threading.Event()
  self.alive.set()





class odom_listener(threading.Thread):
 def odom_(self,data):
  lock.acquire()
  if data.twist.twist.linear.x !=0.0 or data.twist.twist.linear.y !=0.0 or data.twist.twist.linear.z !=0.0 or data.twist.twist.linear.x !=0.0 or data.twist.twist.linear.y !=0.0 or data.twist.twist.linear.z !=0.0:
   print 'yeas'
   odom_pose=data.pose.pose
   #current pose
   position=odom_pose.position
   #current rotation
   angle=quat_to_angle(odom_pose.orientation)
   #地图上朝向点坐标
   [ort_x,ort_y]=ort_pose(angle,position,0.4)

   self.odom_data.orta_pose.x=ort_x
   self.odom_data.orta_pose.y=ort_y
   self.odom_data.pose.x=position.x
   self.odom_data.pose.y=position.y
   self.odom_data.pose.theta=angle

   self.pub_odom = rospy.Publisher('web_odom', web_odom, queue_size=5)
   self.pub_odom.publish(self.odom_data)
  else:
   pass

  lock.release()

 def run(self):
  self.old_odom=Odometry()
  self.odom_data=web_odom()
  rospy.Subscriber("odom", Odometry, self.odom_)

 def __init__(self):
  threading.Thread.__init__(self)
  self.alive = threading.Event()
  self.alive.set()



 
