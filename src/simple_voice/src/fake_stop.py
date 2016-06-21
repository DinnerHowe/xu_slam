#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""Copyright (c) 2016 Xu Zhihao (Howe).  All rights reserved.
This program is free software; you can redistribute it and/or modify
This programm is tested on kuboki base turtlebot."""

import rospy
from std_msgs.msg import String

def test():
 pub = rospy.Publisher('stop_flag', String, queue_size=1)
 rospy.init_node('fake_stop', anonymous=True)
 rate = rospy.Rate(20) # 10hz
 cout=0
 while not rospy.is_shutdown():
  cout+=1
  if cout<=10:
   rospy.loginfo("stop")
   pub.publish("stop")
  else:
   rospy.loginfo("ahead")
   pub.publish("ahead")
  rate.sleep()
  
  if cout>20:
   cout=0
  
if __name__ == '__main__':
    try:
        test()
    except rospy.ROSInterruptException:
        pass
