#!/usr/bin/env python
"""

- Version 1.0 2015/9/8

this file is used to check io error like: 

ls: cannot access /dev/ttyUSB0: No such file or directory

Error connecting reader: No such file or directory

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""

import os

if __name__ == '__main__':
 try:
  print '\ntry USB1\n'
  execfile('/dev/ttyUSB1')
  p=os.popen('~/rfiddriver/demo-xu-once tmr:///dev/ttyUSB1','r')
  read=p.read()
  print read
  p.close()

 except IOError:
  try:
   print 'try USB0\n'
   execfile('/dev/ttyUSB0')
   p=os.popen('~/rfiddriver/demo-xu-once tmr:///dev/ttyUSB0','r')
   read=p.read()
   print read
  except IOError:
   print 'check your usb connection'


