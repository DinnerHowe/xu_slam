#!/usr/bin/env python
#coding=utf-8
"""
- Version 1.0 2015/22/12

this file is used to check io error like: 

Error connecting reader: No such file or directory

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""

import os,getpass,subprocess

if __name__ == '__main__':
 count=getpass.getuser()
 directory='/home/%s/xu_slam/src/nav_staff/map'%count
 try:
  os.system('rosrun map_server map_saver -f %s/office_map'%directory)
 except:
  os.mkdir(directory) 
  os.system('rosrun map_server map_saver -f %s/office_map'%directory)
 print '关闭制图模式'
 node_list=subprocess.Popen('rosnode list',shell=True,stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
 nodes=node_list.stdout.readlines()
 node_name=[]
 for node in nodes:
  if 'master' not in node.split('\n')[0]:
   node_name.append(node.split('\n')[0])
 for i in node_name:
  subprocess.call('rosnode kill %s'%i,shell=True,stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
 print '请运行rosrun agv agv.py 启动机器人，并且选择拥有地图模式'
