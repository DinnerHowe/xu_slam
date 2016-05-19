#!/usr/bin/env python
#coding=utf-8
"""
fake robot total program

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.
This program is free software; you can redistribute it and/or modify
This programm is tested on kuboki base turtlebot. 
"""
import rospy,os,subprocess
from rosgraph_msgs.msg import Log

class multi_asus_robot():
 def define(self):
  self.bringup_info=''
  self.rosout_msg=''
  self.rosout_name=''
  self.first_amcl_ready=False
  self.second_amcl_ready=False
  self.first_uimarker_ready=False
  self.second_uimarker_ready=False
  self.first_bringup_ready=False
  self.second_bringup_ready=False
  self.finish=False
  self.map_ready=False
  

 #启动机器
 def fake_single_robot_bringup(self):
 #roslaunch multi_machine fake_single_turtlebot.launch
  subprocess.Popen('roslaunch multi_machine turtlebot_bringup_asus.launch  odom_frame:=first_robot/odom base_frame:=first_robot/base_footprint',shell=True)

 #加载map
 def map_server(self):
  subprocess.Popen('roslaunch multi_machine map_server.launch',shell=True)
  
 
 #启动amcl
 def fake_single_amcl(self):
 #roslaunch multi_machine fake_single_amcl.launch
  subprocess.Popen('roslaunch multi_machine asus_robot_amcl.launch odom_frame_id:=first_robot/odom base_frame_id:=first_robot/base_footprint global_frame_id:=first_robot/map',shell=True)
 
 #启动publish point的用户交互
 def single_ui_marker(self):
 #roslaunch multi_machine_control single_ui_marker.launch
  subprocess.Popen('roslaunch multi_machine_control multi_ui_marker.launch',shell=True)
 
  #启动机器标码
 def multi_robot_uni_marker(self):
 #roslaunch multi_machine robot_uni_marker.launch
  subprocess.Popen('roslaunch multi_machine robot_uni_marker.launch',shell=True) 
  
 #启动导航目标策略
 def single_go_tasks(self):
 #roslaunch multi_machine_control single_go_tasks.launch 
  subprocess.Popen('roslaunch multi_machine_control multi_go_tasks.launch',shell=True)

 #启动3D map的marker节点
 def map_marker(self):
 #rosrun mapshow mapshow
  subprocess.Popen('rosrun mapshow mapshow',shell=True) 

 #启动特殊情况警告功能
 def obstacle_warning(self):
 #roslaunch multi_machine multi_obstacle_warning.launch
  subprocess.Popen('roslaunch multi_machine multi_obstacle_warning.launch',shell=True)
  
  
 def if_bringup_ready(self):
  if 'Device' in self.rosout_msg and 'found' in self.rosout_msg:
   self.first_bringup_ready=True

 def if_map_ready(self):
  if 'Read' in self.rosout_msg and 'map' in self.rosout_msg and 'm/cell'in self.rosout_msg:
   self.map_ready=True

 def if_amcl_ready(self):
  if 'odom received' in self.rosout_msg:
   self.first_amcl_ready=True

 def if_uimarker_ready(self):
  if '请使用publish point选出想要标记的地方' in self.rosout_msg:
   self.first_uimarker_ready=True
  
   
 # rosout    
 def rosout_callback(self,data):
   
  self.rosout_msg=data.msg
  self.rosout_name=data.name
  
  self.if_bringup_ready()
  if self.first_bringup_ready:
   self.first_bringup_ready=False
   #self.map_server()
   self.fake_single_amcl()

  self.if_map_ready()
  if self.map_ready:
   self.map_ready=False
   self.fake_single_amcl()

  """self.if_amcl_ready()
  if self.first_amcl_ready:
   self.first_amcl_ready=False
   self.single_ui_marker()
   
  self.if_uimarker_ready()
  if self.first_uimarker_ready:
   self.first_uimarker_ready=False
   self.single_go_tasks()
   self.map_marker()
   self.multi_robot_uni_marker()
   self.obstacle_warning()
   rospy.sleep(2)
   self.finish=True

   
  if self.finish:
   self.finish=False
   rospy.loginfo('请运行roslaunch multi_machine 3D_multi_RVIZ.launch')
   #self.multi_RVIZ()"""
  
 def __init__(self):
  self.define()
  rospy.init_node('multi_asus_robot')
  if self.bringup_info=='':
   self.fake_single_robot_bringup()
  rospy.Subscriber('/rosout',Log, self.rosout_callback)

  rospy.spin()

if __name__=='__main__':
 try:
  rospy.loginfo ("initialization system")
  multi_asus_robot()
  rospy.loginfo ("process done and quit")
 except rospy.ROSInterruptException:
  rospy.loginfo("robot twist node terminated.")
