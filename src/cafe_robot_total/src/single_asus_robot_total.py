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

class cafe_robot_total():
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
  
 def map_server(self):
  subprocess.Popen('roslaunch multi_machine map_server.launch',shell=True)
 #启动机器
 def fake_single_robot_bringup(self):
 #roslaunch multi_machine fake_single_turtlebot.launch
  subprocess.Popen('roslaunch multi_machine turtlebot_bringup_asus.launch',shell=True)
  
 #启动amcl
 def fake_single_amcl(self):
 #roslaunch multi_machine fake_single_amcl.launch
  subprocess.Popen('roslaunch multi_machine asus_robot_amcl.launch',shell=True)
 
 #启动publish point的用户交互
 def single_ui_marker(self):
 #roslaunch multi_machine_control single_ui_marker.launch
  subprocess.Popen('roslaunch marker ui_marker.launch',shell=True)
  
  
 #启动导航目标策略
 def single_go_tasks(self):
 #roslaunch multi_machine_control single_go_tasks.launch 
  subprocess.Popen('rosrun tasks go_tasks.py',shell=True)

 #启动3D map的marker节点
 def map_marker(self):
 #rosrun mapshow mapshow
  subprocess.Popen('rosrun mapshow mapshow',shell=True) 

 #启动rviz用户交互界面
 def multi_RVIZ(self):
 #roslaunch multi_machine 3D_multi_RVIZ.launch
  subprocess.Popen('rosrun rviz rviz',shell=True)
  

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
   self.map_server()

  self.if_map_ready()
  if self.map_ready:
   self.map_ready=False
   self.fake_single_amcl()

  self.if_amcl_ready()
  if self.first_amcl_ready:
   self.first_amcl_ready=False
   self.single_ui_marker()
   
  self.if_uimarker_ready()
  if self.first_uimarker_ready:
   self.first_uimarker_ready=False
   self.single_go_tasks()
   self.map_marker()
   rospy.sleep(2)
   self.finish=True

   
  if self.finish:
   self.finish=False
   #rospy.loginfo('请运行roslaunch multi_machine 3D_multi_RVIZ.launch')
   self.multi_RVIZ()

  
 def __init__(self):
  self.define()
  rospy.init_node('single_asus_robot_total')
  if self.bringup_info=='':
   self.fake_single_robot_bringup()
  rospy.Subscriber('/rosout',Log, self.rosout_callback)

  rospy.spin()

if __name__=='__main__':
 try:
  rospy.loginfo ("initialization system")
  cafe_robot_total()
  rospy.loginfo ("process done and quit")
 except rospy.ROSInterruptException:
  rospy.loginfo("robot twist node terminated.")
