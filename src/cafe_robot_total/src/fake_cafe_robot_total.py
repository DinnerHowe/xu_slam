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
  
 #启动机器
 def fake_multi_robot_bringup(self):
 #roslaunch multi_machine fake_multi_turtlebot.launch
  subprocess.Popen('roslaunch multi_machine fake_multi_turtlebot.launch',shell=True)
  
 #启动amcl
 def fake_multi_amcl(self):
 #roslaunch multi_machine fake_multi_amcl.launch
  subprocess.Popen('roslaunch multi_machine fake_multi_amcl.launch',shell=True)
 
 #启动publish point的用户交互
 def multi_ui_marker(self):
 #roslaunch multi_machine_control multi_ui_marker.launch
  subprocess.Popen('roslaunch multi_machine_control multi_ui_marker.launch',shell=True)
  
  
 #启动导航目标策略
 def multi_go_tasks(self):
 #roslaunch multi_machine_control multi_go_tasks.launch 
  subprocess.Popen('roslaunch multi_machine_control multi_go_tasks.launch',shell=True)

 #启动导航目标策略
 def multi_robot_uni_marker(self):
 #roslaunch multi_machine robot_uni_marker.launch
  subprocess.Popen('roslaunch multi_machine robot_uni_marker.launch',shell=True)
    
  
 #启动3D map的marker节点
 def map_marker(self):
 #rosrun mapshow mapshow
  subprocess.Popen('rosrun mapshow mapshow',shell=True)
  

 #启动rviz用户交互界面
 def multi_RVIZ(self):
 #roslaunch multi_machine 3D_multi_RVIZ.launch
  subprocess.Popen('roslaunch multi_machine 3D_multi_RVIZ.launch',shell=True)
  
 #启动特殊情况警告功能
 def obstacle_warning(self):
 #roslaunch multi_machine multi_obstacle_warning.launch
  subprocess.Popen('roslaunch multi_machine multi_obstacle_warning.launch',shell=True)

 def if_bringup_ready(self):
  if 'Started DiffController' in self.rosout_msg and '/second_robot' in self.rosout_name:
   self.second_bringup_ready=True
   
  if 'Started DiffController' in self.rosout_msg and '/first_robot' in self.rosout_name:
   self.first_bringup_ready=True

 def if_amcl_ready(self):
  if 'odom received' in self.rosout_msg and '/second_robot' in self.rosout_name:
   self.second_amcl_ready=True
   
  if 'odom received' in self.rosout_msg and '/first_robot' in self.rosout_name:
   self.first_amcl_ready=True

 def if_uimarker_ready(self):
  if '请使用publish point选出想要标记的地方' in self.rosout_msg and '/second_robot' in self.rosout_name:
   self.second_uimarker_ready=True
   
  if '请使用publish point选出想要标记的地方' in self.rosout_msg and '/first_robot' in self.rosout_name:
   self.first_uimarker_ready=True
  
   
 # rosout    
 def rosout_callback(self,data):
   
  self.rosout_msg=data.msg
  self.rosout_name=data.name
  
  self.if_bringup_ready()
  if self.first_bringup_ready and self.second_bringup_ready:
   self.first_bringup_ready=False
   self.second_bringup_ready=False
   self.fake_multi_amcl()

  self.if_amcl_ready()
  if self.first_amcl_ready and self.second_amcl_ready:
   self.first_amcl_ready=False
   self.second_amcl_ready=False
   self.multi_ui_marker()
   
  self.if_uimarker_ready()
  if self.first_uimarker_ready and self.second_uimarker_ready:
   self.first_uimarker_ready=False
   self.second_uimarker_ready=False
   self.multi_go_tasks()
   self.multi_robot_uni_marker()
   self.map_marker()
   self.obstacle_warning()
   rospy.sleep(2)
   self.finish=True

   
  if self.finish:
   self.finish=False
   #rospy.loginfo('请运行roslaunch multi_machine 3D_multi_RVIZ.launch')
   self.multi_RVIZ()

  
 def __init__(self):
  self.define()
  rospy.init_node('cafe_robot_total')
  if self.bringup_info=='':
   self.fake_multi_robot_bringup()
  rospy.Subscriber('/rosout',Log, self.rosout_callback)

  rospy.spin()

if __name__=='__main__':
 try:
  rospy.loginfo ("initialization system")
  cafe_robot_total()
  rospy.loginfo ("process done and quit")
 except rospy.ROSInterruptException:
  rospy.loginfo("robot twist node terminated.")
