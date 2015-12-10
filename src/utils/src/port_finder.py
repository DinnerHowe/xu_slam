#!/usr/bin/python
# -*- coding: utf-8 -*-
'''
这是列出所有外接设备名称以及ID的工具
---howe
9/11/2015
'''
import list_ports_linux,serial,rospy
from list_ports_linux import *

def port_finder():
 print "initialization system"
 ports = list(list_ports_linux.comports())
 for port in ports:
  print '\nUSB number:',port[0]
  print 'device name:',port[1]
  

if __name__=='__main__':
  rospy.loginfo( "initial system")
  rospy.init_node('rfidread', anonymous=True)
  port_finder()
  print "\nprocess done and quit"

  



