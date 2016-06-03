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
  self.amcl_ready=False
  self.uimarker_ready=False
  self.bringup_ready=False
  self.finish=False
  

 #启动机器
 def single_robot_bringup(self):
  subprocess.Popen('roslaunch machine asus_turtlebot_bringup.launch',shell=True)

 #启动amcl
 def single_amcl(self):
  subprocess.Popen('roslaunch machine asus_robot_amcl.launch',shell=True)
 
 #启动publish point的用户交互
 def single_ui_marker(self):
  subprocess.Popen('roslaunch marker ui_marker.launch',shell=True)

 def robot_controller(self):
  subprocess.Popen('roslaunch machine robot_controller.launch',shell=True)
 
 # ui rviz
 def RVIZ(self):
  subprocess.Popen('roslaunch machine 3D_RVIZ.launch',shell=True)
 
  
 # triggers
 def if_bringup_ready(self):
  if 'Device' in self.rosout_msg and 'found' in self.rosout_msg:
   self.bringup_ready=True

 def if_amcl_ready(self):
  if 'odom received' in self.rosout_msg:
   self.amcl_ready=True

 def if_uimarker_ready(self):
  if '请使用publish point选出想要标记的地方' in self.rosout_msg:
   self.uimarker_ready=True
     
 # rosout    
 def rosout_callback(self,data):
   
  self.rosout_msg=data.msg
  self.rosout_name=data.name
  
  self.if_bringup_ready()
  if self.bringup_ready:
   self.bringup_ready=False
   self.single_amcl()

  self.if_amcl_ready()
  if self.amcl_ready:
   self.amcl_ready=False
   self.single_ui_marker()
   
  self.if_uimarker_ready()
  if self.uimarker_ready:
   self.uimarker_ready=False
   self.robot_controller()
   rospy.sleep(2)
   self.finish=True
   
  if self.finish:
   self.finish=False
   self.RVIZ()

  
 def __init__(self):
  self.define()
  rospy.init_node('single_asus_robot_total')
  if self.bringup_info=='':
   self.single_robot_bringup()
  rospy.Subscriber('/rosout',Log, self.rosout_callback)

  rospy.spin()

if __name__=='__main__':
 try:
  rospy.loginfo ("initialization system")
  cafe_robot_total()
  rospy.loginfo ("process done and quit")
 except rospy.ROSInterruptException:
  rospy.loginfo("robot twist node terminated.")
