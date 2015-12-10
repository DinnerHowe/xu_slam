#!/usr/bin/env python

"""init.py 

- Version 1.0 2015/09/06

this file is used to initialize system

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""
import os
import rospy

if __name__=='__main__':
 print "starting initialization"
 os.system('mkdir -p ~/slam/src')
 os.system('cd ~/slam/src\ncatkin_init_workspace')
 os.system('cd ~/slam\ncatkin_make')

 os.system('cd ~/slam_howe/init\nchmod +x rfid_init.py')
 os.system('cd ~/slam_howe/init\nchmod +x laser_init.py')
 os.system('cd ~/slam_howe/init\nchmod +x avoidance_init.py')
 os.system('cd ~/slam_howe/init\nchmod +x base_motion_module_init.py')

 os.system('cd ~/slam_howe/init\n python rfid_init.py')
 os.system('cd ~/slam_howe/init\n python laser_init.py')
 os.system('cd ~/slam_howe/init\n python avoidance_init.py')
 os.system('cd ~/slam_howe/init\n python base_motion_module_init.py')

 os.system('cd ~/slam \n chmod +x ~/slam/devel/setup.bash\n ./devel/setup.bash')
 print "now you can run nodes"

