#!/usr/bin/env python  
#coding=utf-8

"""
Version 3.0 2015/18-19/11

概率地图+'odometry'+'quat—angle'
pub + threading方法，但是烧内存？容易死机

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. """

from nav_msgs.msg import OccupancyGrid,Odometry
from geometry_msgs.msg import Pose
import rospy,quat_to_angle,threading,Queue
from robot_status.msg import *


lock=threading.RLock()

class map_listener(threading.Thread):
 def map_(self,data):
  lock.acquire()

  map_origin=Pose()
  map_matrix,map_width=[],[]
  width=data.info.width
  height=data.info.height
  print '\nthreading\nwidth',width,'height',height
  map_origin=data.info.origin
  for i in range(height):
   map_width=[]
   for j in range(width):
    map_width.append(data.data[j+j*i])
   map_matrix.append(map_width)

  self.map_data.data=str(map_matrix)
  self.map_data.pose=map_origin

  self.pub_map.publish(self.map_data)


  lock.release()

 def run(self):
  self.map_data=map_odom()
  self.pub_map = rospy.Publisher('web_map', map_odom, queue_size=10)
  rospy.Subscriber("map", OccupancyGrid, self.map_)

 def __init__(self):
  threading.Thread.__init__(self)
  self.alive = threading.Event()
  self.alive.set()


class odom_listener(threading.Thread):
 def odom_(self,data):
  odom_pose=data.pose.pose
  lock.acquire()

  #current pose
  position=odom_pose.position
  #current rotation
  angle=quat_to_angle.quat_to_angle(odom_pose.orientation)
  #地图上朝向点坐标
  [ort_x,ort_y]=quat_to_angle.ort_pose(angle,position,0.4)
  self.odom_data.data=str([angle,ort_x,ort_y])
  self.odom_data.pose=odom_pose
  self.pub_odom.publish(self.odom_data)

  lock.release()

 def run(self):
  self.odom_data=map_odom()
  self.pub_odom = rospy.Publisher('web_odom', map_odom, queue_size=10)
  rospy.Subscriber("odom", Odometry, self.odom_)

 def __init__(self):
  threading.Thread.__init__(self)
  self.alive = threading.Event()
  self.alive.set()



 
