#!/usr/bin/env python
""" driver.py 

- Version 1.0 2015/8/28

this file is used to make driver file

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""
import os
if __name__=='__main__':
 ws=raw_input("pls input your workspace name:\n")
 if ws!='' and ws!=None:
  os.system('cd ~/%s/mercury-rfid/c/src/api\nmake'%ws)
  os.system('cd\nmkdir rfiddriver_hand')
  os.system('cp -i ~/%s/mercury-rfid/c/src/api/demo-xu-once ~/rfiddriver/'%ws)
 else:
  print"try again pls"
  pass
