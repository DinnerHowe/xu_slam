#!/usr/bin/env python
"""init_hand.py 

- Version 1.0 2015/09/06

this file is used to initialize system for handy

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""
import os
import rospy

if __name__=='__main__':
 print "starting initialization"
 os.system('cd ~/slam_howe/init\nchmod +x rfid_init_hand.py')
 os.system('cd ~/slam_howe/init\nchmod +x laser_init_hand.py')
 os.system('cd ~/slam_howe/init\nchmod +x avoidance_init_hand.py')
 os.system('cd ~/slam_howe/init\nchmod +x base_motion_module_init_hand.py')

 os.system('python ~/slam_howe/init/rfid_init_hand.py')
 os.system('python ~/slam_howe/init/laser_init_hand.py')
 os.system('python ~/slam_howe/init/avoidance_init_hand.py')
 os.system('python ~/slam_howe/init/base_motion_module_init_hand.py')

 os.system('cd ~/slam \n chmod +x ~/slam/devel/setup.bash\n ./devel/setup.bash')
 print "now you can run nodes"

