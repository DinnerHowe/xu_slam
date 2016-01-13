#!/usr/bin/env python
#coding=utf-8
""" 2016/12/01

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""
import rospy,getpass
from geometry_msgs import *

class register():

 def store_coordinate():
  self.name_sp=['门口','盆栽','充电','孟孟','刘森','徐志浩',
	'11','12','13','14','15','16',
	'21','22','23','24','25','26',
	'31','32','33','34','35','36',
	'41','42','43','44','45','46']
  self.dictionary=dict()
  stored_pose=self.read_coordinate()
  if set(self.name_sp).issubset(stored_pose.keys()):
   pass
  else:
   self.store_data(data)
  #rospy.Subscriber('initialpose',PoseWithCovarianceStamped,self.store_data)
  #rospy.spin()

 def store_data(self):
  for name in self.name_sp:
   self.store_update(name,data)
  count=getpass.getuser()
  write=open('/home/%s/mapdata/pre_regist_pose.txt'%count,'w')
  write.writelines(self.dictionary)
  write.close()

 def store_update(self,name):
  if '%s_position'%name not in self.dictionary:
   rospy.loginfo('请输入%s的位置'%name)
   data=rospy.wait_for_message('initialpose',PoseWithCovarianceStamped)
   self.dictionary.update({'%s_position'%name:data.pose.pose.position,'%s_orientation'%name:data.pose.pose.orientation})
   rospy.loginfo('注册%s的位置'%name)

 def read_coordinate(self):
  count=getpass.getuser()
  pose={}
  store=open('/home/%s/mapdata/pre_regist_pose.txt'%count,'r')
  pose=eval(store.readlines())
  store.close()
  return pose

 def defination(self):
  pose=self.read_coordinate()
  self.point=Point()
  self.orientation=Quaternion()
  self.direct_position_dic={'门口':pose['门口_position'],'盆栽':pose['盆栽_position'],'充电':pose['充电_position'],'孟孟':pose['孟孟_position'],'刘森':pose['刘森_position'],'徐志浩':pose['徐志浩_position']}
  self.direct_orientation_dic={'门口':pose['门口_orientation'],'盆栽':pose['盆栽_orientation'],'充电':pose['充电_orientation'],'孟孟':pose['孟孟_orientation'],'刘森':pose['刘森_orientation'],'徐志浩':pose['徐志浩_orientation']}

 def pre_register_position(self,data):
  self.defination()
  point=self.direct_position_dic[data]
  return point

 def pre_register_orientation(self,data):
  self.defination()
  orientation=self.direct_orientation_dic[data]
  return orientation

 def office_desk_matrix_position(self,column,row):
  self.defination()
  if row==1:
   if column==1:
    point=pose['11_position']
   if column==2:
    point=pose['12_position']
   if column==3:
    point=pose['13_position']
   if column==4:
    point=pose['14_position']
   if column==5:
    point=pose['15_position']
   if column==6:
    point=pose['16_position']
    
  if row==2:
   if column==1:
    point=pose['21_position']
   if column==2:
    point=pose['22_position']
   if column==3:
    point=pose['23_position']
   if column==4:
    point=pose['24_position']
   if column==5:
    point=pose['25_position']
   if column==6:
    point=pose['26_position']

  if row==3:
   if column==1:
    point=pose['31_position']
   if column==2:
    point=pose['32_position']
   if column==3:
    point=pose['33_position']
   if column==4:
    point=pose['34_position']
   if column==5:
    point=pose['35_position']
   if column==6:
    point=pose['36_position']

  if row==4:
   if column==1:
    point=pose['41_position']
   if column==2:
    point=pose['42_position']
   if column==3:
    point=pose['43_position']
   if column==4:
    point=pose['44_position']
   if column==5:
    point=pose['45_position']
   if column==6:
    point=pose['46_position']

  return point

 def office_desk_matrix_orientation(self,column,row):
  if row==1:
   if column==1:
    orientation=pose['11_orientation']
   if column==2:
    orientation=pose['12_orientation']
   if column==3:
    orientation=pose['13_orientation']
   if column==4:
    orientation=pose['14_orientation']
   if column==5:
    orientation=pose['15_orientation']
   if column==6:
    orientation=pose['16_orientation']
    
  if row==2:
   if column==1:
    orientation=pose['21_orientation']
   if column==2:
    orientation=pose['22_orientation']
   if column==3:
    orientation=pose['23_orientation']
   if column==4:
    orientation=pose['24_orientation']
   if column==5:
    orientation=pose['25_orientation']
   if column==6:
    orientation=pose['26_orientation']

  if row==3:
   if column==1:
    orientation=pose['31_orientation']
   if column==2:
    orientation=pose['32_orientation']
   if column==3:
    orientation=pose['33_orientation']
   if column==4:
    orientation=pose['34_orientation']
   if column==5:
    orientation=pose['35_orientation']
   if column==6:
    orientation=pose['36_orientation']

  if row==4:
   if column==1:
    orientation=pose['41_orientation']
   if column==2:
    orientation=pose['42_orientation']
   if column==3:
    orientation=pose['43_orientation']
   if column==4:
    orientation=pose['44_orientation']
   if column==5:
    orientation=pose['45_orientation']
   if column==6:
    orientation=pose['46_orientation']

  return orientation
