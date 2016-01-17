#!/usr/bin/env python
#coding=utf-8
""" 2015/11/12

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""
import rospy, os, subprocess

class agv_launcher():
 def __init__(self):
  mapper=raw_input('您是否已经建完地图了？（y/n）： ')
  if mapper=='n':
  #建立地图
   mapping()
   rospy.sleep(5)
   mapsaver()
  #使用地图导航
  elif mapper=='y':
   navigation()
  else:
   agv_launcher()

 def mapping():
  subprocess.call('roslaunch turtlebot_bringup minimal.launch',shell=True)
  rospy.sleep(5)
  subprocess.call('roslaunch nav_staff kinect_gmapping.launch',shell=True)
  rospy.sleep(10)

 def navigation():
  subprocess.call('roslaunch turtlebot_bringup minimal.launch',shell=True)
  rospy.sleep(5)
  subprocess.call('roslaunch nav_staff amcl_demo.launch',shell=True)
  rospy.sleep(10)
  subprocess.call('rosrun cruise cruise.py',shell=True)

 def mapsaver():
   map_saver=raw_input('您是否储存地图：（y/n）: ')
   if map_saver=='y':
    subprocess.call('rosrun cruise cruise.py',shell=True)
    navigation()
   else:
    mapsaver()

   

if __name__ == '__main__':
 try:
  rospy.loginfo( "initialization system")
  agv_launcher()
  rospy.loginfo( "process done and quit")
 except rospy.ROSInterruptException:
  rospy.loginfo("follower node terminated.")

