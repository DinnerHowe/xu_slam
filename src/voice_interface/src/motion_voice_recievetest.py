#!/usr/bin/env python
#coding=utf-8

""" 2016/25/02

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""
import rospy,getpass,os,stat
from math import *
from actions_reference import *
from geometry_msgs import *
from voice_msg.msg import Command
from actionlib_msgs.msg import *
from coordinates import register


class voice_interface():
 def definition(self):

  self.motion_dict={1:'直行', 2:'倒退',3:'左转直行',4:'右转直行',
		    5:'左前',6:'左后',7:'右前',8:'右后',9:'左转',
		    10:'右转',11:'后转',12:'停'}
		    
  self.sp_dict={13:0.2,14:0.4}

  self.distance_dict={16:1,17:2,18:3,19:4,20:5,21:6,22:7,23:8,24:9,25:10,26:20,27:50,28:100,29:90,30:180,31:270,32:360}

  self.angle_distance={'左转直行':pi/2,'右转直行':pi/2,'左前':pi/4,'右前':pi/4,'左后':pi*3/4,'右后':pi*3/4,'左转':pi/2,'右转':pi/2,'后转':pi}

  self.direct_position_dic={34:'门口',35:'盆栽',36:'充电',37:'孟孟',38:'刘森',39:'徐志浩'}

  self.colum_dic={40:1,41:2,42:3,43:4,44:5,45:6}

  self.row_dic={46:1,47:2,48:3,49:4}

  self.object_dic={51:'水杯',52:'书'}
  try:
   print'检测注册物体'
   object_stored_dic=self.read('object_dic')
   if set(self.object_dic.keys()).issubset(object_stored_dic.keys()):
    print'更新注册物体'
    self.object_dic=object_stored_dic
   else:
    pass
  except:
   self.store('object_dic',self.object_dic)

 def __init__(self): 
  self.definition()
  rospy.init_node('voice_interface',anonymous=False)
  yes=''
  while yes!='p': 
   yes=raw_input('输入p退出')
   data=Command()
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
  #instance=register()
############ 运动指示 ##############
  if data.my_motion.motion:

   try:
    self.motion_dict[data.my_motion.direction]
    rospy.loginfo('运动指示:%s'%self.motion_dict[data.my_motion.direction])
   except:
    rospy.loginfo('错误运动指示')
    data.my_motion.direction=12
    rospy.loginfo('设置运动指示，默认为:%s'%self.motion_dict[data.my_motion.direction])
# 转距固定，线距不定
   if self.motion_dict[data.my_motion.direction]=='左前':
    self.angle_speed=self.default_speed_setting(data)
    self.linear_speed=0
    angle_duration=self.angle_distance[self.motion_dict[data.my_motion.direction]]/abs(self.angle_speed)
    rospy.loginfo('执行旋转')#测试
    rospy.loginfo('线速度：%s  角速度：%s  预计耗时：%s'%(self.linear_speed,self.angle_speed,angle_duration))
    #twist(self.angle_speed,angle_duration,self.linear_speed)
    rospy.loginfo('完成旋转，执行直行')#测试
    self.linear_speed=self.default_speed_setting(data)
    self.angle_speed=0
    self.stepcount=self.default_distance_setting(data)
    
   if self.motion_dict[data.my_motion.direction]=='右前':
    self.angle_speed=-self.default_speed_setting(data)
    self.linear_speed=0
    angle_duration=self.angle_distance[self.motion_dict[data.my_motion.direction]]/abs(self.angle_speed)
    rospy.loginfo('执行旋转')#测试
    rospy.loginfo('线速度：%s  角速度：%s  预计耗时：%s'%(self.linear_speed,self.angle_speed,angle_duration))
    #twist(self.angle_speed,angle_duration,self.linear_speed)
    rospy.loginfo('完成旋转，执行直行')#测试
    self.linear_speed=self.default_speed_setting(data)
    self.angle_speed=0
    self.stepcount=self.default_distance_setting(data)

   if self.motion_dict[data.my_motion.direction]=='左后':
    self.angle_speed=self.default_speed_setting(data)
    self.linear_speed=0
    angle_duration=self.angle_distance[self.motion_dict[data.my_motion.direction]]/abs(self.angle_speed)
    rospy.loginfo('执行旋转')#测试
    rospy.loginfo('线速度：%s  角速度：%s  预计耗时：%s'%(self.linear_speed,self.angle_speed,angle_duration))
   #twist(self.angle_speed,angle_duration,self.linear_speed)
    rospy.loginfo('完成旋转，执行直行')#测试
    self.linear_speed=self.default_speed_setting(data)
    self.angle_speed=0
    self.stepcount=self.default_distance_setting(data)

   if self.motion_dict[data.my_motion.direction]=='右后':
    self.angle_speed=-self.default_speed_setting(data)
    self.linear_speed=0
    angle_duration=self.angle_distance[self.motion_dict[data.my_motion.direction]]/abs(self.angle_speed)
    rospy.loginfo('执行旋转')#测试
    rospy.loginfo('线速度：%s  角速度：%s  预计耗时：%s'%(self.linear_speed,self.angle_speed,angle_duration))
    #twist(self.angle_speed,angle_duration,self.linear_speed)
    rospy.loginfo('完成旋转，执行直行')#测试
    self.linear_speed=self.default_speed_setting(data)
    self.angle_speed=0
    self.stepcount=self.default_distance_setting(data)

   if self.motion_dict[data.my_motion.direction]=='直行':
    self.linear_speed=self.default_speed_setting(data)
    self.angle_speed=0
    self.stepcount=self.default_distance_setting(data)
    
   if self.motion_dict[data.my_motion.direction]=='倒退':
    self.linear_speed=-self.default_speed_setting(data)
    self.angle_speed=0
    self.stepcount=self.default_distance_setting(data)

# 转距不定，线距不定
   if self.motion_dict[data.my_motion.direction]=='左转直行':
    self.angle_speed=self.default_speed_setting(data)
    self.linear_speed=0
    angle_duration=self.angle_distance[self.motion_dict[data.my_motion.direction]]/abs(self.angle_speed)
    rospy.loginfo('执行旋转')#测试
    rospy.loginfo('线速度：%s  角速度：%s  预计耗时：%s'%(self.linear_speed,self.angle_speed,angle_duration))
    #twist(self.angle_speed,angle_duration,self.linear_speed)
    rospy.loginfo('完成旋转，执行直行')#测试
    self.linear_speed=self.default_speed_setting(data)
    self.angle_speed=0
    self.stepcount=self.default_distance_setting(data)

   if self.motion_dict[data.my_motion.direction]=='右转直行':
    self.angle_speed=-self.default_speed_setting(data)
    self.linear_speed=0
    angle_duration=self.angle_distance[self.motion_dict[data.my_motion.direction]]/abs(self.angle_speed)
    rospy.loginfo('执行旋转')#测试
    rospy.loginfo('线速度：%s  角速度：%s  预计耗时：%s'%(self.linear_speed,self.angle_speed,angle_duration))
    #twist(self.angle_speed,angle_duration,self.linear_speed)
    rospy.loginfo('完成旋转，执行直行')#测试
    self.linear_speed=self.default_speed_setting(data)
    self.angle_speed=0
    self.stepcount=self.default_distance_setting(data)

   if self.motion_dict[data.my_motion.direction]=='左转':
    self.angle_speed=self.default_speed_setting(data)
    self.linear_speed=0
    try:
     angle_duration=(self.distance_dict[data.my_motion.stepcount]*pi/180)/abs(self.angle_speed)
    except:#default
     angle_duration=self.angle_distance[self.motion_dict[data.my_motion.direction]]/abs(self.angle_speed)
    self.duration=angle_duration

   if self.motion_dict[data.my_motion.direction]=='右转':
    self.angle_speed=-self.default_speed_setting(data)
    self.linear_speed=0
    try:
     angle_duration=(self.distance_dict[data.my_motion.stepcount]*pi/180)/abs(self.angle_speed)
    except:
     angle_duration=self.angle_distance[self.motion_dict[data.my_motion.direction]]/abs(self.angle_speed)
    self.duration=angle_duration

   if self.motion_dict[data.my_motion.direction]=='后转':
    self.angle_speed=self.default_speed_setting(data)
    self.linear_speed=0
    angle_duration=self.angle_distance[self.motion_dict[data.my_motion.direction]]/abs(self.angle_speed)
    self.duration=angle_duration

   if self.motion_dict[data.my_motion.direction]=='停':
    self.linear_speed,self.duration,self.angle_speed=0,0,0

 #final motion
   try:
    self.duration=self.distance_dict[self.stepcount]/abs(self.linear_speed)
   except:
    self.duration

   try:
    rospy.loginfo('执行最后动作')#测试
    if self.angle_speed:
     self.tdis=abs(self.duration*self.angle_speed)
    if self.linear_speed:
     self.tdis=abs(self.duration*self.linear_speed)
    rospy.loginfo('线速度：%s  角速度：%s  距离%s 预计耗时：%s'%(self.linear_speed,self.angle_speed,self.tdis,self.duration))
   except:
    pass
   self.linear_speed,self.duration,self.angle_speed=0,0,0
   rospy.loginfo('最后动作完成')#测试
  #twist(self.angle_speed,self.duration,self.linear_speed)
   self.stepcount,self.linear_speed,self.angle_speed,angle_duration,self.duration=0,0,0,0,0
   self.tdis=0
############  导航（单向）##########
#注释：position这里要是PointStamped
  if data.my_navigation.navigation:
   try:
    self.direct_position_dic[data.my_navigation.direct]
    rospy.loginfo('导航到%s'%self.direct_position_dic[data.my_navigation.direct])#测试
   except:
    rospy.loginfo('导航到第%s列，第%s行'%(self.colum_dic[data.my_navigation.columnNum],self.row_dic[data.my_navigation.rowNum]))#测试

   register().store_coordinate()
   position=PointStamped()
   orientation=Quaternion()
   if data.my_navigation.go==33:
    if data.my_navigation.direct in self.direct_position_dic:
     position.point.x=float(register().pre_register_position(self.direct_position_dic[data.my_navigation.direct])[0])
     position.point.y=float(register().pre_register_position(self.direct_position_dic[data.my_navigation.direct])[1])
     position.point.z=float(register().pre_register_position(self.direct_position_dic[data.my_navigation.direct])[2])

     position.header.frame_id='map'

     orientation.x=float(register().pre_register_orientation(self.direct_position_dic[data.my_navigation.direct])[0])
     orientation.y=float(register().pre_register_orientation(self.direct_position_dic[data.my_navigation.direct])[1])
     orientation.z=float(register().pre_register_orientation(self.direct_position_dic[data.my_navigation.direct])[2])
     orientation.w=float(register().pre_register_orientation(self.direct_position_dic[data.my_navigation.direct])[3])

    elif (data.my_navigation.columnNum in self.colum_dic) and (data.my_navigation.rowNum in self.row_dic):
     rospy.loginfo('查询工位矩阵坐标')
     print self.colum_dic[data.my_navigation.columnNum],self.row_dic[data.my_navigation.rowNum]
     print register().office_desk_matrix_position(self.colum_dic[data.my_navigation.columnNum],self.row_dic[data.my_navigation.rowNum])
     position.point.x=float(register().office_desk_matrix_position(self.colum_dic[data.my_navigation.columnNum],self.row_dic[data.my_navigation.rowNum])[0])
     position.point.y=float(register().office_desk_matrix_position(self.colum_dic[data.my_navigation.columnNum],self.row_dic[data.my_navigation.rowNum])[1])
     position.point.z=float(register().office_desk_matrix_position(self.colum_dic[data.my_navigation.columnNum],self.row_dic[data.my_navigation.rowNum])[2])

     position.header.frame_id='map'

     orientation.x=float(register().office_desk_matrix_orientation(self.colum_dic[data.my_navigation.columnNum],self.row_dic[data.my_navigation.rowNum])[0])
     orientation.y=float(register().office_desk_matrix_orientation(self.colum_dic[data.my_navigation.columnNum],self.row_dic[data.my_navigation.rowNum])[1])
     orientation.z=float(register().office_desk_matrix_orientation(self.colum_dic[data.my_navigation.columnNum],self.row_dic[data.my_navigation.rowNum])[2])
     orientation.w=float(register().office_desk_matrix_orientation(self.colum_dic[data.my_navigation.columnNum],self.row_dic[data.my_navigation.rowNum])[3])

    else:
     rospy.loginfo('this especial position not in pre-register position list')
   else:
    rospy.loginfo('navigation error message')
    
   print position,'\n',orientation
   state=vioce_tasks(1,position,orientation)
   initial_time=rospy.Time.now()
#循环到任务完成为止？？？？？
   while state!=GoalStatus.SUCCEEDED:
    if rospy.Time.now()-initial_time>rospy.Duration.from_sec(180):
     rospy.loginfo( 'timeout break')
     break
    state=vioce_tasks(1,position,orientation)

###############送东西(双向)###################
  if data.my_send.transmit:
   rospy.loginfo('送东西')#测试
   register().store_coordinate()
   init_pose=rospy.wait_for_message("odom",Odometry)
   if data.my_send.object in self.object_dic:
    obj=''
    while obj.lower()!='y':
     obj=raw_input("请放%s，然后按y确认: "%self.object_dic[data.my_send.object])  #等有机械臂后用rospy.wait_for_message()监听机械臂
    self.trans(data.my_send,init_pose)
   else:
    rospy.loginfo('%s not in object list'%data.my_send.object)
    rospy.loginfo('adding new object into object list')
    self.object_dic[data.my_send.object]=raw_input('请输入该物品的名称: ')
    self.store('object_dic',self.object_dic)
    obj=''
    while obj.lower()!='y':
     obj=raw_input("请放%s，然后按y确认: "%self.object_dic[data.my_send.object])  #等有机械臂后用rospy.wait_for_message()监听机械臂
    self.trans(data.my_send,init_pose)
    rospy.loginfo('%s已经送达'%self.object_dic[data.my_send.object])

###############取东西（双向）##################
  if data.my_get.transmit:
   rospy.loginfo('任务：取%s'%self.object_dic[data.my_get.object])#测试
   register().store_coordinate()
   init_pose=rospy.wait_for_message("odom",Odometry)
   if data.my_get.object in self.object_dic:
    self.trans(data.my_get,init_pose)
   else:
    rospy.loginfo('%s not in object list'%self.object_dic[data.my_get.object])
    rospy.loginfo('adding new object into object list')
    self.object_dic[data.my_get.object]=raw_input('请输入该物品的名称')
    self.store('object_dic',self.object_dic)
    self.trans(data.my_get,init_pose)#等有机械臂后用rospy.wait_for_message()监听机械臂


 def trans(self,data,init_pose):
  position=PointStamped()
  orientation=Quaternion()
  rospy.loginfo('目的地%s'%self.direct_position_dic[data.didian])
  if data.didian in self.direct_position_dic:
   position.point.x=float(register().pre_register_position(self.direct_position_dic[data.didian])[0])
   position.point.y=float(register().pre_register_position(self.direct_position_dic[data.didian])[1])
   position.point.z=float(register().pre_register_position(self.direct_position_dic[data.didian])[2])
   
   position.header.frame_id='map'
   orientation.x=float(register().pre_register_orientation(self.direct_position_dic[data.didian])[0])
   orientation.y=float(register().pre_register_orientation(self.direct_position_dic[data.didian])[1])
   orientation.z=float(register().pre_register_orientation(self.direct_position_dic[data.didian])[2])
   orientation.w=float(register().pre_register_orientation(self.direct_position_dic[data.didian])[3])
   
   state=vioce_tasks(1,position,orientation)
   #循环到任务完成为止
   initial_time=rospy.Time.now()
   while state!=GoalStatus.SUCCEEDED:
    if rospy.Time.now()-initial_time>rospy.Duration.from_sec(180):
     rospy.loginfo('timeout break')
     break
    state=vioce_tasks(1,position,orientation)
   rospy.sleep(3)#wait for 3 sec
   obj=''
   while obj.lower()!='y':
    obj=raw_input("接收%s，然后按y确认: "%self.object_dic[data.object]) #等有机械臂后用rospy.wait_for_message()监听机械臂，取东西时必要
   position.point=init_pose.pose.pose.position
   position.header.frame_id='map'
   orientation=init_pose.pose.pose.orientation
   state=vioce_tasks(1,position,orientation)
   initial_time=rospy.Time.now()
   while state!=GoalStatus.SUCCEEDED:
    if rospy.Time.now()-initial_time>rospy.Duration.from_sec(180):
     rospy.loginfo('timeout break')
     break
    state=vioce_tasks(1,position,orientation)
  else:
   rospy.loginfo('this especial position not in pre-register position list')

 #setting default value
  #setting default linear distance
 def default_distance_setting(self,data):
  try:
   self.distance_dict[data.my_motion.stepcount]
  except:
   data.my_motion.stepcount=16
  return data.my_motion.stepcount

  #setting default speed
 def default_speed_setting(self,data):
  try:
   self.sp_dict[data.my_motion.pattern]
  except:
   data.my_motion.pattern=13
  return self.sp_dict[data.my_motion.pattern]

 #read default items
 def read(self,name):
  print '读取预注册物品'
  count=getpass.getuser()
  readfile=open('/home/%s/mapdata/%s.txt'%(count,name),'r')
  dic=readfile.readlines()
  dic=eval(dic[0])
  readfile.close()
  return dic

 #store default items
 def store(self,name,data):
  print'存储预注册物体'
  count=getpass.getuser()
  if os.path.exists('home/%s/mapdata'%count):
   pass
  else:
   os.makedirs('home/%s/mapdata'%count)
   os.chmod('home/%s/mapdata'%count,stat.S_IRWXU)
  storefile=open('/home/%s/mapdata/%s.txt'%(count,name),'w')
  dic=storefile.writelines('%s'%data)
  storefile.close()


if __name__=='__main__':
 try:
  rospy.loginfo( "initialization system")
  voice_interface()
  rospy.loginfo( "process done and quit")
 except rospy.ROSInterruptException:
  rospy.loginfo("robot forward node terminated.")
