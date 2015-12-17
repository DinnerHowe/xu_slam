#!/usr/bin/env python
#coding=utf-8
""" 
- Version 4.0 2015/08/12

连续的几个矩阵点之间移动

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""
import subprocess,rospy,os

if __name__ == '__main__':
  rospy.init_node('go_points_continuing')
  
  os.system("rosservice call /move_base/clear_costmaps")
  binnum=int(raw_input('pls input bing num: '))
  for i in range(binnum):
   child=subprocess.call("rosrun base_motion_module base_go_points.py _bin_number:=%s"%i,shell=True)
   #child.wait()
   #(output,error)=child.communicate()   
   #if output==True:
    #print 'position achieved'
   #if output==False:
    #print 'position did not achieve'
