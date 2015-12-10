#!/usr/bin/env python  
""" 

- Version 1.0 2015/9/29

this code subscribe to monitor the robot position in real world
    

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""

import rospy 
from nav_msgs.msg import Odometry

def callback(data):
 print 'current map info: ', data
 return data

def listener():
 print "start listening to map listener"
 rospy.init_node('test_tf_lisenter', anonymous=False)
 rospy.Subscriber("/odom", Odometry, callback)
 rospy.spin()

if __name__ == '__main__':
 listener()

 
