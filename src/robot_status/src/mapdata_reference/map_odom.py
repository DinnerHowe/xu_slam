#!/usr/bin/env python  
#coding=utf-8

"""
Version 3.0 2015/18-19/11

概率地图+'odometry'+'quat—angle'

使用queue+threading odom无法实时更新？  原因：两个线程频率不一样
使用threading+collections，解决上述问题

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. """

from nav_msgs.msg import OccupancyGrid,Odometry
from geometry_msgs.msg import Pose 
from std_msgs.msg import Header
import rospy,quat_to_angle,threading,collections#Queue

map_data,odom_data=collections.deque(maxlen=1),collections.deque(maxlen=1)
#map_data,odom_data=Queue.Queue(),Queue.Queue()
#map_data,odom_data=Queue.Queue(maxsize=1),Queue.Queue(maxsize=1)
map_origin=Pose()
map_header=Header()
lock=threading.RLock()



class map_listener(threading.Thread):

 def map_(self,data):
  lock.acquire()

  map_matrix,map_width=[],[]
  width=data.info.width
  height=data.info.height
  print '\n\nwidth',width,'height',height

  map_origin=data.info.origin

  if self.temp!=data.data:
   for i in range(height):
    for j in range(width):
     map_width.append(data.data[j+j*i])
    map_matrix.append(map_width)
    map_width=[]

   #map_data.put([map_matrix,map_origin])
   map_data.append([map_matrix,map_origin])
   map_matrix=[]
   self.temp=data.data
  lock.release()

 def run(self):
  rospy.Subscriber("map", OccupancyGrid, self.map_)

 def __init__(self):
  rospy.init_node('map_', anonymous=False)
  self.temp=[]
  threading.Thread.__init__(self)
  self.alive = threading.Event()
  self.alive.set()



class odom_listener(threading.Thread):

 def odom_(self,data):
  odom_pose=data.pose.pose
  lock.acquire()

  if self.odom_pose!=odom_pose:
   self.odom_pose=odom_pose

   #current pose
   position=self.odom_pose.position
   #current rotation
   angle=quat_to_angle.quat_to_angle(self.odom_pose.orientation)
   #地图上朝向点坐标
   [ort_x,ort_y]=quat_to_angle.ort_pose(angle,position,0.4)
   #odom_data.put([angle,position,ort_x,ort_y])
   odom_data.append([angle,position,ort_x,ort_y])

  lock.release()

 def run(self):

  rospy.Subscriber("odom", Odometry, self.odom_)

 def __init__(self):
  #rospy.init_node('odom_', anonymous=False)
  self.odom_pose=Pose()
  threading.Thread.__init__(self)
  self.alive = threading.Event()
  self.alive.set()



 
