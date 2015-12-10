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

 os.system('cd\ncp -i -r ~/slam_howe/src/laser/ ~/slam/src/')


 os.system('cd ~/slam\nchmod +x ./src/laser/src/depthimage_listener.py')
 os.system('cd ~/slam\nchmod +x ./src/laser/src/laser_listener.py')
 os.system('cd ~/slam\nchmod +x ./src/laser/src/laser_listener_tester.py')
 os.system('cd ~/slam\nchmod +x ./src/laser/src/obstacle_detector.py')
 os.system('cd ~/slam\nchmod +x ./src/laser/src/obstacle_detector_tester.py')

 os.system('cd ~/slam\ncatkin_make')

 print "now you can run laser node under ros system"

