#!/usr/bin/env python
""" 
- Version 1.0 2015/09/22

this file is to sub likihood

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""
from rfid_handle.msg import probability
import rospy

def callback(data):
    rospy.loginfo("I heard %s", data.probability)
    
def listener():

    rospy.init_node('likihood_sub', anonymous=True)

    rospy.Subscriber("particles", probability, callback)

    rospy.spin()

if __name__ == '__main__':
    listener()

