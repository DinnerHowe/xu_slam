#!/usr/bin/env python
""" laser listener tester

- Version 1.0 2015/8/26

this is the motion module---laser publisher for obstacle detector. 
    

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""
import rospy
from laser.msg import LaserLikihood

def callback(data):
 print "########"
 rospy.loginfo(data)
 
def envinfo():
 print "start laser listener tester node"
 rospy.init_node('laser_listener_tester')
 rospy.Subscriber("laser_sensor/Laser_Likihood", LaserLikihood, callback)
 rospy.spin()

if __name__=='__main__':
 try:
  print "initialization system"
  envinfo()
  print "process done and quit"
 except rospy.ROSInterruptException:
  rospy.loginfo("environment info lisenter node terminated.")
