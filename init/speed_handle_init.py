#!/usr/bin/env python
"""
- Version 2.0 2015/20/10

this file is used to initialize all code make codes executabel

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""
import os
import rospy

if __name__=='__main__':
 print "starting initialize RFID node"

 os.system('cd\ncp -i -r ~/slam_howe/src/speed_handle/ ~/slam/src/')




 os.system('cd ~/slam\nchmod +x ./src/speed_handle/src/service_client/SpeedHandleserver.py')
 os.system('cd ~/slam\nchmod +x ./src/speed_handle/src/service_client/speed_handle_test_changer_client.py')
 os.system('cd ~/slam\nchmod +x ./src/speed_handle/src/service_client/speed_handle_test_original_client.py')


 os.system('cd ~/slam\ncatkin_make')

 print "now you can run rfid node under ros system"

