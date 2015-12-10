#!/usr/bin/env python
""" 
- Version 1.0 2015/9/30   

testing launch amcl service

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""

from robot_status.srv import *
import rospy

def client(x):
 rospy.wait_for_service('launch_amcl')
 try:
  server = rospy.ServiceProxy('launch_amcl', launch_amcl)
  resp1 = server(x)
  return resp1.finish
 except rospy.ServiceException, e:
  print "Service call failed: %s"%e

if __name__ == "__main__":
 rospy.init_node('test_server')
 if len(sys.argv) == 2:
  x = str(sys.argv[1])
 else:
  print 'error'
  sys.exit(1)
 print "Requesting %s"%x
 print "response: %s"%client(x)
