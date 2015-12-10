#!/usr/bin/env python
""" 
- Version 1.0 2015/9/30   

this code is written for launching amcl

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""

from robot_status.srv import *
import rospy
import subprocess
import getpass

def launch(req):
 name=getpass.getuser()
 if req.start=='start':
  #subprocess.Popen('roslaunch turtlebot_navigation amcl_demo.launch > ~/mapdata/out.txt',shell=True)
  #subprocess.Popen('roslaunch turtlebot_bringup minimal.launch',shell=True)
  subprocess.Popen('roslaunch turtlebot_navigation amcl_demo.launch |tee ~/mapdata/out.txt',shell=True)

  for i in range(10):
   print 'checking for %d times'%i
   rospy.sleep(10)
   checker='odom received!'
   f=open('/home/%s/mapdata/out.txt'%name)
   line=f.readlines()
   if checker in str(line):
    print 'launched amcl_demo'
    return launch_amclResponse('yes')
    break
   else:
    print 'amcl_demo launch failed\n system will keep tring'
   f.close()
 else:
  print 'amcl_demo launch failed'
  return launch_amclResponse('no')

def add_two_ints_server():
 rospy.init_node('launch_amcl')
 s = rospy.Service('launch_amcl', launch_amcl, launch)
 print "Ready to launch amcl."
 rospy.spin()

if __name__ == "__main__":
 add_two_ints_server()
