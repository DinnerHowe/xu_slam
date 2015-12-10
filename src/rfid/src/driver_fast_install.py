#!/usr/bin/env python
""" driver_fast_install.py 

- Version 1.0 2015/9/06

this file is used to make driver file

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""
import os
if __name__=='__main__':
 os.system('cd ~/slam/mercury-rfid/c/src/api\nmake')
 os.system('cd\nmkdir rfiddriver')
 os.system('cp -i ~/slam/mercury-rfid/c/src/api/demo-xu-once ~/rfiddriver/')

