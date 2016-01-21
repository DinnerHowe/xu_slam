#!/usr/bin/env python
"""
- Version 1.0 2015/22/12

this file is used to check io error like: 

Error connecting reader: No such file or directory

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""

import os,getpass

if __name__ == '__main__':
 count=getpass.getuser()
 directory='/home/%s/map_data'%count
 if os.path.exists(directory):
  os.system('rosrun map_server map_saver -f %s/office_map1.yaml'%directory)
 else:
  os.mkdir(directory) 
  os.system('rosrun map_server map_saver -f %s/office_map1.yaml'%directory)
