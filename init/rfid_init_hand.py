#!/usr/bin/env python
""" rfid_init_hand.py 

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

 ws=raw_input("pls input your workspace name:\n")
 if ws!='' and ws!=None:
  os.system('cd\ncp -i -r ~/slam_howe/src/rfid/ ~/%s/src/'%ws)
  os.system('cd\ncp -i -r ~/slam_howe/doc/ ~/%s/'%ws)
  os.system('cd\ncp -i -r ~/slam_howe/mercury-rfid/ ~/%s/'%ws)

  os.system('cd ~/%s\nchmod +x ./src/rfid/src/driver.py'%ws)
  os.system('cd ~/%s\nchmod +x ./src/rfid/src/driver_fast_install.py'%ws)
  os.system('cd ~/%s\nchmod +x ./src/rfid/src/permission_getter.py'%ws)
  os.system('cd ~/%s\nchmod +x ./src/rfid/src/reader-pub-row.py'%ws)
  os.system('cd ~/%s\nchmod +x ./src/rfid/src/reader-sub.py'%ws)
  os.system('cd ~/%s\nchmod +x ./src/rfid/src/rfiddata-tranfer.py'%ws)
  os.system('cd ~/%s\nchmod +x ./src/rfid/src/transferData-sub.py'%ws)

  os.system('cd ~/%s\ncatkin_make'%ws)
 
  os.system('cd ~/%s\npython ./src/rfid/src/driver.py'%ws)
  os.system('cd ~/%s\npython ./src/rfid/src/permission_getter.py'%ws)
  print "now you can run rfid node under ros system"
 else:
  print"try again pls"


