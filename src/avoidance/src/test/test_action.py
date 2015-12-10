#!/usr/bin/env python
""" 
- Version 1.0 2015/9/20

publish test angular sp and linear speed
    

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 
"""

import rospy
from geometry_msgs.msg import Twist
from math import pi

class test():
 def __init__ (self):
  
  rospy.init_node('test', anonymous=True)
  pub = rospy.Publisher('/cmd_vel', Twist, queue_size=5)
  rate = 20
  r = rospy.Rate(rate)
  move_cmd = Twist()
  move_cmd.linear.x =-0.3
  move_cmd.angular.z=pi/8
  for i in range(100):
   pub.publish(move_cmd)
   rospy.loginfo(move_cmd)
   r.sleep()
  move_cmd.linear.x =-0.3
  move_cmd.angular.z=-pi/8
  for i in range(100):
   pub.publish(move_cmd)
   rospy.loginfo(move_cmd)
   r.sleep()
  move_cmd.linear.x =0
  move_cmd.angular.z =0
  pub.publish(move_cmd)
  rospy.loginfo(move_cmd)
  r.sleep()

############################ main ###########################3

if __name__=='__main__':
 try:
  print "initialization system"
  test()
  print "process done and quit"
 except rospy.ROSInterruptException:
  rospy.loginfo("robot forward node terminated.")
