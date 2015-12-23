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
 os.system('rosrun map_server map_saver -f /home/%s/xu_slam/office_map'%count)
