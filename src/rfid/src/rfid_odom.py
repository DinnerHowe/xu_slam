#!/usr/bin/env python
#coding=utf-8
""" Version 1.0 2015/24/11
接收rfid-tranfer_ver2.py rfid_odom的数据，发布最优点###未完成

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""

import rospy
from rfid.msg import *
from geometry_msgs.msg import Pose

class optimised_pose():
 def callback(self,data):
  self.poses=data.pose
  self.id=data.id
  if self.id not in self.tag_dic:
   self.tag_dic[self.id]=[[],[],0.0]
  if self.id in self.tag_dic:
   self.tag_dic[self.id][0].append(self.poses.position.x)
   self.tag_dic[self.id][1].append(self.poses.position.y)
   self.tag_dic[self.id][2]=rospy.get_time()
  timer_end=rospy.get_time
  for i in self.tag_dic:
   if timer_end-self.tag_dic[i][2]=rospy.get_time()==120:
    print 'time out ###### %s finish reading'%i
    x=sum()
    y=
    self.tags_dic[i]=[x,y]
   

 def define(self):
  self.pub = rospy.Publisher('landmarker', Pose, queue_size=5)
  self.poses=Pose()
  self.tag_dic={}
  self.tags_dic={}

 def __init__(self):
  rospy.init_node('optimised_rfid_pose', anonymous=True)
  self.define()
  rospy.Subscriber("rfid_odom", rfid_odom, self.callback)
  rospy.spin()

if __name__ == '__main__':
 optimised_pose()
