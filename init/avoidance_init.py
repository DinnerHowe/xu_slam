#!/usr/bin/env python
""" 

- Version 1.0 2015/10/20

this file is used to initialize all code make codes executabel

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""
import os
import rospy

if __name__=='__main__':
 print "starting initialize laser node"

 os.system('cd\ncp -i -r ~/slam_howe/src/avoidance/ ~/slam/src/')

 os.system('cd ~/slam\nchmod +x ./src/avoidance/src/robot_forword.py')
 os.system('cd ~/slam\nchmod +x ./src/avoidance/src/robot_standby.py')
 #os.system('cd ~/slam\nchmod +x ./src/avoidance/src/robot_forword_origin.py')

 os.system('cd ~/slam\ncatkin_make')

 print "now you can run laser node under ros system"

