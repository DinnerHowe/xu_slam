#!/usr/bin/env python
#coding=utf-8
""" 2016/21/01

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""
import rospy
from math import *
from actions_reference import *
from geometry_msgs import *
from voice_msg.msg import Command
from actionlib_msgs.msg import *
from coordinates import *


class voice_interface():
 def definition(self):
  self.linear_speed,self.duration,self.angle_speed=0,0,0
  self.motion_dict={1:'直行', 2:'倒退',3:'左转直行',4:'右转直行',
		    5:'左前',6:'左后',7:'右前',8:'右后',9:'左转',
		    10:'右转',11:'后转',12:'停'}
		    
  self.sp_dict={13:0.2,14:0.4,15:0.2}

  self.distance_dict={16:1,17:2,18:3,19:4,20:5,21:6,22:7,23:8,24:9,25:10,26:20,27:50,28:100,
			90:29,180:30,270:31,360:32}

  self.unit_dic={57:1,58:pi/180}

  self.angle_distance={'左转直行':pi/2,'右转直行':pi/2,'左前':pi/4,'右前':pi/4,'左后':pi*3/4,'右后':pi*3/4,'左转':pi/2,'右转':pi/2,'后转':pi}

  self.direct_position_dic={34:'门口',35:'盆栽',36:'充电',37:'孟孟',38:'刘森',39:'徐志浩'}

  self.colum_dic={40:1,41:2,42:3,43:4,44:5,45:6}

  self.row_dic={46:1,47:2,48:3,49:4}

  self.object_dic={51:'水杯',52:'书'}

 def __init__(self): 
  self.definition()
  rospy.init_node('voice_interface',anonymous=False)
  data=rospy.wait_for_message('Command', Command)
  self.motion_director(data)
  #测试用
  stop=Twist()
  stop.linear.x=0
  stop.linear.y=0
  stop.linear.z=0
  pub = rospy.Publisher('/cmd_vel_mux/input/teleop', Twist, queue_size=10)
  pub.publish(stop)
  
 def motion_director(self,data):
############ 运动指示 ##############
  if data.my_motion.motion:

   rospy.loginfo('运动指示:%s'%self.motion_dict[data.my_motion.direction])
# 转距固定，线距不定
   if self.motion_dict[data.my_motion.direction]=='左前':
    try:
     self.angle_speed=self.sp_dict[data.my_motion.pattern]
    except:
     self.angle_speed=self.sp_dict[15]
    self.linear_speed=0
    angle_duration=self.angle_distance[self.motion_dict[data.my_motion.direction]]/self.angle_speed
    rospy.loginfo('线速度：%s  角速度：%s  预计耗时：%s'%(self.linear_speed,self.angle_speed,angle_duration))
    twist(self.angle_speed,angle_duration,self.linear_speed)
    self.angle_speed=0
    try:
     self.linear_speed=self.sp_dict[data.my_motion.pattern]
    except:
     self.linear_speed=self.sp_dict[13]
    data.my_motion.stepcount=self.default_distance_setting(data)
    data.my_motion.metric=self.default_unit_setting(data)


   if self.motion_dict[data.my_motion.direction]=='右前':
    try:
     self.angle_speed=-self.sp_dict[data.my_motion.pattern]
    except:
     self.angle_speed=self.sp_dict[15]
    self.linear_speed=0
    angle_duration=self.angle_distance[self.motion_dict[data.my_motion.direction]]/self.angle_speed
    rospy.loginfo('线速度：%s  角速度：%s  预计耗时：%s'%(self.linear_speed,self.angle_speed,angle_duration))
    twist(self.angle_speed,angle_duration,self.linear_speed)
    self.angle_speed=0
    try:
     self.linear_speed=self.sp_dict[data.my_motion.pattern]
    except:
     self.linear_speed=self.sp_dict[13]
    data.my_motion.stepcount=self.default_distance_setting(data)
    data.my_motion.metric=self.default_unit_setting(data)

   if self.motion_dict[data.my_motion.direction]=='左后':
    try:
     self.angle_speed=self.sp_dict[data.my_motion.pattern]
    except:
     self.angle_speed=self.sp_dict[15]
    self.linear_speed=0
    angle_duration=self.angle_distance[self.motion_dict[data.my_motion.direction]]/self.angle_speed
    rospy.loginfo('线速度：%s  角速度：%s  预计耗时：%s'%(self.linear_speed,self.angle_speed,angle_duration))
    twist(self.angle_speed,angle_duration,self.linear_speed)
    self.angle_speed=0
    try:
     self.linear_speed=self.sp_dict[data.my_motion.pattern]
    except:
     self.linear_speed=self.sp_dict[13]
    data.my_motion.stepcount=self.default_distance_setting(data)
    data.my_motion.metric=self.default_unit_setting(data)

   if self.motion_dict[data.my_motion.direction]=='右后':
    try:
     self.angle_speed=-self.sp_dict[data.my_motion.pattern]
    except:
     self.angle_speed=-self.sp_dict[15]
    self.linear_speed=0
    angle_duration=self.angle_distance[self.motion_dict[data.my_motion.direction]]/self.angle_speed
    rospy.loginfo('线速度：%s  角速度：%s  预计耗时：%s'%(self.linear_speed,self.angle_speed,angle_duration))
    twist(self.angle_speed,angle_duration,self.linear_speed)
    self.angle_speed=0
    try:
     self.linear_speed=self.sp_dict[data.my_motion.pattern]
    except:
     self.linear_speed=self.sp_dict[13]
    data.my_motion.stepcount=self.default_distance_setting(data)
    data.my_motion.metric=self.default_unit_setting(data)

   if self.motion_dict[data.my_motion.direction]=='直行':
    try:
     self.linear_speed=self.sp_dict[data.my_motion.pattern]
    except:
     self.linear_speed=self.sp_dict[13]
    self.angle_speed=0
    data.my_motion.stepcount=self.default_distance_setting(data)
    data.my_motion.metric=self.default_unit_setting(data)
    
   if self.motion_dict[data.my_motion.direction]=='倒退':
    try:
     self.linear_speed=-self.sp_dict[data.my_motion.pattern]
    except:
     self.linear_speed=-self.sp_dict[13]
    self.angle_speed=0
    data.my_motion.stepcount=self.default_distance_setting(data)
    data.my_motion.metric=self.default_unit_setting(data)

# 转距不定，线距不定
   if self.motion_dict[data.my_motion.direction]=='左转直行':
    try:
     self.angle_speed=self.sp_dict[data.my_motion.pattern]
    except:
     self.angle_speed=self.sp_dict[15]
    self.linear_speed=0
    angle_duration=self.angle_distance[self.motion_dict[data.my_motion.direction]]/self.angle_speed
    rospy.loginfo('线速度：%s  角速度：%s  预计耗时：%s'%(self.linear_speed,self.angle_speed,angle_duration))
    twist(self.angle_speed,angle_duration,self.linear_speed)
    self.angle_speed=0
    try:
     self.linear_speed=self.sp_dict[data.my_motion.pattern]
    except:
     self.linear_speed=self.sp_dict[13]
    data.my_motion.stepcount=self.default_distance_setting(data)
    data.my_motion.metric=self.default_unit_setting(data)

   if self.motion_dict[data.my_motion.direction]=='右转直行':
    try:
     self.angle_speed=-self.sp_dict[data.my_motion.pattern]
    except:
     self.angle_speed=-self.sp_dict[15]
    self.linear_speed=0
    #defaut
    angle_duration=self.angle_distance[self.motion_dict[data.my_motion.direction]]/self.angle_speed
    rospy.loginfo('线速度：%s  角速度：%s  预计耗时：%s'%(self.linear_speed,self.angle_speed,angle_duration))
    twist(self.angle_speed,angle_duration,self.linear_speed)
    self.angle_speed=0
    try:
     self.linear_speed=self.sp_dict[data.my_motion.pattern]
    except:
     self.linear_speed=self.sp_dict[13]
    data.my_motion.stepcount=self.default_distance_setting(data)
    data.my_motion.metric=self.default_unit_setting(data)

   if self.motion_dict[data.my_motion.direction]=='左转':
    try:
     self.angle_speed=self.sp_dict[data.my_motion.pattern]
    except:
     self.angle_speed=self.sp_dict[15]
    self.linear_speed=0
    try:
     #customer
     angle_duration=self.distance_dict[data.my_motion.stepcount]/(self.angle_speed*self.unit_dic[data.my_motion.metric])
    except:
     #defaut
     angle_duration=self.angle_distance[self.motion_dict[data.my_motion.direction]]/self.angle_speed
    self.duration=angle_duration

   if self.motion_dict[data.my_motion.direction]=='右转':
    try:
     self.angle_speed=-self.sp_dict[data.my_motion.pattern]
    except:
     self.angle_speed=-self.sp_dict[15]
    self.linear_speed=0
    try:
     angle_duration=self.distance_dict[data.my_motion.stepcount]/(self.angle_speed*self.unit_dic[data.my_motion.metric])
    except:
     angle_duration=self.angle_distance[self.motion_dict[data.my_motion.direction]]/self.angle_speed
    self.duration=angle_duration


   if self.motion_dict[data.my_motion.direction]=='后转':
    try:
     self.angle_speed=self.sp_dict[data.my_motion.pattern]
    except:
     self.angle_speed=self.sp_dict[15]
    self.linear_speed=0
    try:
     angle_duration=self.distance_dict[data.my_motion.stepcount]/(self.angle_speed*self.unit_dic[data.my_motion.metric])
    except:
     angle_duration=self.angle_distance[self.motion_dict[data.my_motion.direction]]/self.angle_speed
    self.duration=angle_duration

   if self.motion_dict[data.my_motion.direction]=='停':
    self.linear_speed,self.duration,self.angle_speed=0,0,0

   try:
    self.duration=self.distance_dict[data.my_motion.stepcount]/(abs(self.linear_speed)*self.unit_dic[data.my_motion.metric])
   except:
    pass

   try:
    rospy.loginfo('线速度：%s  角速度：%s  预计耗时：%s'%(self.linear_speed,self.angle_speed,self.duration))
    twist(self.angle_speed,self.duration,self.linear_speed)
   except:
    pass
   self.linear_speed,self.duration,self.angle_speed=0,0,0

############  导航（单向）##########
#注释：position这里要是PointStamped
  if data.my_navigation.navigation:
   position=PointStamped()
   orientation=Quaternion()
   if data.my_navigation.go==33:
    if data.my_navigation.direct in self.direct_position_dic:
     position.point=register.pre_register_position(self.direct_position_dic(data.my_navigation.direct))
     position.header.frame_id='map'
     orientation=register.pre_register_orientation(self.direct_position_dic(data.my_navigation.direct))

    elif data.my_navigation.columnNum in self.colum_dic and data.my_navigation.rowNum in self.row_dic:
     position.point=register.office_desk_matrix_position(self.colum_dic(data.my_navigation.columnNum),self.row_dic(data.my_navigation.rowNum))
     position.header.frame_id='map'
     orientation=register.office_desk_matrix_orientation(self.colum_dic(data.my_navigation.columnNum),self.row_dic(data.my_navigation.rowNum))
    else:
     rospy.loginfo('this especial position not in pre-register position list')
   else:
    rospy.loginfo('navigation error message')
   state=vioce_tasks(1,position,orientation)
#循环到任务完成为止？？？？？
   while state!=GoalStatus.SUCCEEDED:
    state=vioce_tasks(1,position,orientation)

###############送/取东西(双向)###################
  if data.my_send.transmit:
   if data.my_send.transmit:
    self.trans(data.my_send)
   else:
    rospy.loginfo('send error message')

  if data.my_get.transmit:
   if data.my_send.transmit:
    self.trans(data.my_get)
   else:
    rospy.loginfo('get error message')

 def trans(self,data):
  position=PointStamped()
  orientation=Quaternion()
  init_pose=rospy.wait_for_message("odom",Odometry)
  if data.object in self.object_dic:
   if data.didian in self.direct_position_dic:
    position.point=register.pre_register_position(self.direct_position_dic(data.didian))
    position.header.frame_id='map'
    orientation=register.pre_register_orientation(self.direct_position_dic(data.didian))
    state=vioce_tasks(1,position,orientation)

    #循环到任务完成为止
    while state!=GoalStatus.SUCCEEDED:
     state=vioce_tasks(1,position,orientation)
    rospy.sleep(3)#wait for 3 sec
    position.point=init_pose.pose.pose.position
    position.header.frame_id='map'
    orientation=init_pose.pose.pose.orientation
    state=vioce_tasks(1,position,orientation)
   else:
    rospy.loginfo('this especial position not in pre-register position list')
  else:
   rospy.loginfo('%s not in object list'%data.object)

 #setting default value
 def default_distance_setting(self,data):
  #setting default linear distance
  try:
   self.distance_dict[data.my_motion.stepcount]
  except:
   #default
   data.my_motion.stepcount=16
  return data.my_motion.stepcount

 def default_unit_setting(self,data):
  #setting default unit
  try:
   self.unit_dic[data.my_motion.metric]
  except:
   data.my_motion.metric=57
  return data.my_motion.metric




if __name__=='__main__':
 try:
  rospy.loginfo( "initialization system")
  voice_interface()
  rospy.loginfo( "process done and quit")
 except rospy.ROSInterruptException:
  rospy.loginfo("robot forward node terminated.")
