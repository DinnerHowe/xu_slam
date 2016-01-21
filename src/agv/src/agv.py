#!/usr/bin/env python
#coding=utf-8
""" 2015/11/12

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""
import rospy, os, subprocess,time,roslaunch,timeit
from rosgraph_msgs.msg import *

class agv_launcher():
 def __init__(self):
  print '启动机器人'
  self.robot_bringup()
  mapper=self.input_value()
  rospy.init_node('agv_launcher',anonymous=False)
  timer=0
  self.situation(mapper,timer)


 def input_value(self):
  mapper=raw_input('您是否拥有地图？（y/n）： ')
  return mapper

 def situation(self,mapper,timer):
  ti=timeit.Timer('x=range(50)')
  timer=ti.timeit()
  if mapper=='n':
   self.bringup_info=self.bring_up.stdout.readline()
   if 'self.pub = rospy.Publisher(self.topic, Status)' in self.bringup_info:
    self.mapping()
   else:
    timer+=ti.timeit()
    if timer>10:
     self.robot_bringup()
    else:
     self.situation(mapper,timer)
    
  elif mapper=='y':
   self.navigation()
  else:
   mapper=self.input_value()

 def robot_bringup(self):
  self.bringup_info=''
  self.bring_up=subprocess.Popen('roslaunch turtlebot_bringup minimal.launch',shell=True,stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
  while 'self.pub = rospy.Publisher(self.topic, Status)' not in self.bringup_info:
   self.bringup_info=self.bring_up.stdout.readline()
  print '机器人已启动'

 def mapping(self):
  print '进入建图阶段，请稍候...'
  subprocess.Popen('roslaunch nav_staff asus_gmapping_demo.launch',shell=True,stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
  rospy.Subscriber('/rosout',Log, self.mapping_callback)
  rospy.spin()

 def mapping_callback(self,data):
  if 'odom received!' in data.msg:
   print '地图构建程序已启动'
   self.mapsaver()

 def navigation(self):
  print '进入导航阶段，请稍候...'
  subprocess.Popen('roslaunch nav_staff nav_demo.launch',shell=True,stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
  rospy.Subscriber("/rosout", Log, self.nav_callback)
  rospy.spin()

 def nav_callback(self,data):
  print data.msg
  if 'odom received!' in data.msg:
   print '启动导航程序'
   subprocess.Popen('rosrun cruise cruise.py',shell=True)
   print '导航程序已启动'

 def mapsaver(self):
   map_saver=raw_input('您是否储存地图：（y/n）: ')
   if map_saver=='y':
    subprocess.call('rosrun nav_staff map_saver.py',shell=True)
    print '地图已储存'
    print '重启系统中...'
    node_list=subprocess.Popen('rosnode list',shell=True,stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    nodes=node_list.stdout.readlines()
    node_name=[]
    for node in nodes:
     if 'agv_launcher' not in node.split('\n')[0] and 'master' not in node.split('\n')[0]:
      node_name.append(node.split('\n')[0])
    for i in node_name:
     subprocess.call('rosnode kill %s'%i,shell=True,stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    self.robot_bringup()
    mapper,timer='y',0
    self.bringup_info=''
    self.situation(mapper,timer)
   else:
    self.mapsaver()

   

if __name__ == '__main__':
 agv_launcher()

