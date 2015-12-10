#!/usr/bin/env python
""" laser_init.py 

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

 os.system('cd\ncp -i -r ~/slam_howe/src/base_motion_module/ ~/slam/src/')

 os.system('cd ~/slam\nchmod +x ./src/base_motion_module/src/base_action.py')
 os.system('cd ~/slam\nchmod +x ./src/base_motion_module/src/base_action_follow.py')
 os.system('cd ~/slam\nchmod +x ./src/base_motion_module/src/base_action_stay.py')

 os.system('cd ~/slam\ncatkin_make')

 print "now you can run laser node under ros system"

