#!/usr/bin/env python
#coding=utf-8
""" 2016/25/02

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""
import rospy,getpass,os
from geometry_msgs.msg import *
class register():
 #def __init__(self): 
  #rospy.loginfo('system into register module')

 ####################################################################
 #存储坐标的程序流程图                                               #
 #                     store_coordinate                             #
 #                           |                                      #
 #                       read_data                                  #
 #                           |                                      #
 #         set(self.name_sp).issubset(stored_pose.keys())           #
 #                 |yes                 |no                         #
 #         do not need to store     store data                      #
 #                                      |                           #
 #             for name in set(self.name_sp)-set(dictionary.keys()) #
 #                                      |                           #
 #                                 store_update                     #
 #                                      |                           #
 #                                return dictionary                 #
 #                                      |                           #
 #                                write into file                   #
 ####################################################################

 def store_coordinate(self):
  self.name_sp=[
 '门口_position','门口_orientation','盆栽_position','盆栽_orientation', '充电_position','充电_orientation',
 '11_orientation','11_position','12_orientation','12_position','13_orientation','13_position',
 '14_orientation','14_position','15_orientation','15_position','16_orientation','16_position',
 '21_orientation','21_position','22_orientation','22_position','23_orientation','23_position',
 '24_orientation','24_position','25_orientation','25_position','26_orientation','26_position',
 '31_orientation','31_position','32_orientation','32_position','33_orientation','33_position',
 '34_orientation','34_position','35_orientation','35_position','36_orientation','36_position',
 '41_orientation','41_position','42_orientation','42_position','43_orientation','43_position',
 '44_orientation','44_position','45_orientation','45_position','46_orientation','46_position',]

  count=getpass.getuser()
  if os.path.isfile('/home/%s/mapdata/pre_regist_pose.txt'%count):
   stored_pose=self.read_data()
   if set(self.name_sp).issubset(stored_pose.keys()):
    pass
   else:
    dictionary=stored_pose
    self.store_data(dictionary)
  else:
   print 'no file exist'
   dictionary=dict()
   self.store_data(dictionary)


 def store_data(self,dictionary):
  for name in set(self.name_sp)-set(dictionary.keys()):
   #dictionary=self.store_update(name,dictionary)
   dictionary=self.store_update_point_only(name,dictionary)
   print dictionary
  count=getpass.getuser()
  write=open('/home/%s/mapdata/pre_regist_pose.txt'%count,'w')
  write.writelines('%s'%dictionary)
  write.close()


 def store_update(self,name,dictionary):
  if name not in dictionary:
   rospy.loginfo('请使用2D Pose Estimate输入%s(行列)的位置'%name.split('_')[0])
   data=rospy.wait_for_message('/initialpose', PoseWithCovarianceStamped)
   if len(name.split('_position'))>1:
    rospy.loginfo('正在注册position')
    dictionary['%s'%name]='%s,%s,%s'%(data.pose.pose.position.x,data.pose.pose.position.y,data.pose.pose.position.z)
    dictionary['%s'%name.split('_position')[0]+'_orientation']='%s,%s,%s,%s'%(data.pose.pose.orientation.x,data.pose.pose.orientation.y,data.pose.pose.orientation.z,data.pose.pose.orientation.w)
   if len(name.split('_orientation'))>1:
    rospy.loginfo('正在注册orientation')
    dictionary['%s'%name]='%s,%s,%s,%s'%(data.pose.pose.orientation.x,data.pose.pose.orientation.y,data.pose.pose.orientation.z,data.pose.pose.orientation.w)
    dictionary['%s'%name.split('_orientation')[0]+'_position']='%s,%s,%s'%(data.pose.pose.position.x,data.pose.pose.position.y,data.pose.pose.position.z)
   rospy.loginfo('注册%s的位置'%name.split('_position'))
  return dictionary

#or use geometry_msgs/PointStamped
 def store_update_point_only(self,name,dictionary):
  if name not in dictionary:
   rospy.loginfo('请使用Publish Point输入%s(行,列)的位置'%name.split('_')[0])
   data=rospy.wait_for_message('/clicked_point',PointStamped)
   if len(name.split('_position'))>1:
    dictionary['%s'%name]='%s,%s,%s'%(data.point.x,data.point.y,data.point.z)
    dictionary['%s'%name.split('_position')[0]+'_orientation']='%s,%s,%s,%s'%(0,0,0,1)
    rospy.loginfo('注册%s的位置'%name.split('_position'))
   if len(name.split('_orientation'))>1:
    dictionary['%s'%name.split('_orientation')[0]+'_position']='%s,%s,%s'%(data.point.x,data.point.y,data.point.z)
    dictionary['%s'%name]='%s,%s,%s,%s'%(0,0,0,1)
   rospy.loginfo('注册%s的位置'%name.split('_position'))
  return dictionary


 #############################################################
 #读取坐标的程序流程图                                        #
 #                       defination                          #
 #                           |                               #
 #                       read_data                           #
 #                           |                               #
 #  self.direct_position_dic + self.direct_orientation_dic   #
 #                           |                               #
 #                    point  + orientation                   #
 #############################################################

 def pre_register_position(self,data):
  self.defination()
  point=self.direct_position_dic[data].split(',')
  return point


 def pre_register_orientation(self,data):
  self.defination()
  orientation=self.direct_orientation_dic[data].split(',')
  return orientation


 def office_desk_matrix_position(self,column,row):
  self.defination()
  point=self.office_matrix_position['%s%s'%(row,column)].split(',')
  return point


 def office_desk_matrix_orientation(self,column,row):
  self.defination()
  orientation=self.office_matrix_orientation['%s%s'%(row,column)].split(',')
  return orientation

 def read_data(self):
  count=getpass.getuser()
  pose={}
  store=open('/home/%s/mapdata/pre_regist_pose.txt'%count,'r')
  pose=eval(store.readlines()[0].decode("utf-8"))
  store.close()
  return pose

 def defination(self):
  pose=self.read_data()

  self.office_matrix_orientation={
 '11':pose['11_orientation'],'12':pose['12_orientation'],'13':pose['13_orientation'],
 '14':pose['14_orientation'],'15':pose['15_orientation'],'16':pose['16_orientation'],
 '21':pose['21_orientation'],'22':pose['22_orientation'],'23':pose['23_orientation'],
 '24':pose['24_orientation'],'25':pose['25_orientation'],'26':pose['26_orientation'],
 '31':pose['31_orientation'],'32':pose['32_orientation'],'33':pose['33_orientation'],
 '34':pose['34_orientation'],'35':pose['35_orientation'],'36':pose['36_orientation'],
 '41':pose['41_orientation'],'42':pose['42_orientation'],'43':pose['43_orientation'],
 '44':pose['44_orientation'],'45':pose['45_orientation'],'46':pose['46_orientation']
}

  self.office_matrix_position={
 '11':pose['11_position'],'12':pose['12_position'],'13':pose['13_position'],
 '14':pose['14_position'],'15':pose['15_position'],'16':pose['16_position'],
 '21':pose['21_position'],'22':pose['22_position'],'23':pose['23_position'],
 '24':pose['24_position'],'25':pose['25_position'],'26':pose['26_position'],
 '31':pose['31_position'],'32':pose['32_position'],'33':pose['33_position'],
 '34':pose['34_position'],'35':pose['35_position'],'36':pose['36_position'],
 '41':pose['41_position'],'42':pose['42_position'],'43':pose['43_position'],
 '44':pose['44_position'],'45':pose['45_position'],'46':pose['46_position']
}


  self.direct_position_dic={
 '门口':pose['门口_position'],'盆栽':pose['盆栽_position'],'充电':pose['充电_position'],
 '孟孟':self.office_matrix_position['31'],'刘森':self.office_matrix_position['13'],'徐志浩':self.office_matrix_position['14']
}

  self.direct_orientation_dic={
 '门口':pose['门口_orientation'],'盆栽':pose['盆栽_orientation'],'充电':pose['充电_orientation'],
 '孟孟':self.office_matrix_orientation['13'],'刘森':self.office_matrix_orientation['31'],'徐志浩':self.office_matrix_orientation['41']
 }
