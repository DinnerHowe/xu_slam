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

 os.system('cd\nmkdir maps')
 os.system('cd\nmkdir mapdata')

 os.system('cd\ncp -i -r ~/slam_howe/src/slam_main/ ~/slam/src/')


 os.system('cd ~/slam\nchmod +x ./src/slam_main/src/depthimage_listener.py')
 os.system('cd ~/slam\nchmod +x ./src/slam_main/src/laser_listener.py')
 os.system('cd ~/slam\nchmod +x ./src/slam_main/src/laser_listener_tester.py')
 os.system('cd ~/slam\nchmod +x ./src/slam_main/src/obstacle_detector.py')
 os.system('cd ~/slam\nchmod +x ./src/slam_main/src/obstacle_detector_tester.py')


 print "now you can run laser node under ros system"

