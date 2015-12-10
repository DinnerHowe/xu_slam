#!/usr/bin/env python  
""" 

- Version 1.0 2015/9/29

this code subscribe to monitor the robot position in map
    

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""

import rospy 
import math
from robot_status.msg import mapdata

def callback(data):
 print 'current map info:\n', data.grid.info
 print data.grid.data,'done'
 print '\nmap number:', data.mapnum

def listener():
 print "start listening to map listener"
 rospy.init_node('test_map_lisenter', anonymous=False)
 rospy.Subscriber("map_lisenter", mapdata, callback)
 rospy.spin()

if __name__ == '__main__':
 listener()

 
