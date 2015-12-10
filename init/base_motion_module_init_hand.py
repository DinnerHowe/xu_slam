#!/usr/bin/env python
""" laser_init_hand.py 

- Version 1.0 2015/09/06

this file is used to initialize all code make codes executabel

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""
import os
import rospy

if __name__=='__main__':
 print "starting initialize laser node"
 ws=raw_input("pls input your workspace name:\n")
 if ws!='' and ws!=None:
  os.system('cd\ncp -i -r ~/slam_howe/src/base_motion_module/ ~/%s/src/'%ws)

  os.system('cd ~/%s\nchmod +x ./src/base_motion_module/src/base_action.py'%ws)
  os.system('cd ~/%s\nchmod +x ./src/base_motion_module/src/base_action_follow.py'%ws)
  os.system('cd ~/%s\nchmod +x ./src/base_motion_module/src/base_action_stay.py'%ws)



  os.system('cd ~/%s\ncatkin_make'%ws)

  print "now you can run laser node under ros system"
 else:
  print"try again pls"

