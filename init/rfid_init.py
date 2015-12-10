#!/usr/bin/env python
""" rfid_init.py 

- Version 2.0 2015/8/28

this file is used to initialize all code make codes executabel

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""
import os
import rospy

if __name__=='__main__':
 print "starting initialize RFID node"

 os.system('cd\ncp -i -r ~/slam_howe/src/rfid/ ~/slam/src/')
 os.system('cd\ncp -i -r ~/slam_howe/doc/ ~/slam/')
 os.system('cd\ncp -i -r ~/slam_howe/mercury-rfid/ ~/slam/')

 os.system('cd ~/slam\nchmod +x ./src/rfid/src/driver.py')
 os.system('cd ~/slam\nchmod +x ./src/rfid/src/driver_fast_install.py')
 os.system('cd ~/slam\nchmod +x ./src/rfid/src/permission_getter.py')
 os.system('cd ~/slam\nchmod +x ./src/rfid/src/reader-pub-row.py')
 os.system('cd ~/slam\nchmod +x ./src/rfid/src/reader-sub.py')
 os.system('cd ~/slam\nchmod +x ./src/rfid/src/rfiddata-tranfer.py')
 os.system('cd ~/slam\nchmod +x ./src/rfid/src/transferData-sub.py')

 os.system('cd ~/slam\ncatkin_make')
 os.system('cd ~/slam\nrosrun rfid driver_fast_install.py')
 os.system('cd ~/slam\nrosrun rfid permission_getter.py')
 print "now you can run rfid node under ros system"

