#!/usr/bin/env python
#coding=utf-8
"""
fake robot total program

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.
This program is free software; you can redistribute it and/or modify
This programm is tested on kuboki base turtlebot. 
"""
import rospy
from sensor_msgs.msg import LaserScan

class LaserTransfer():
 def __init__(self):
  rospy.init_node('scan_remapper')
  rospy.Subscriber('scan', LaserScan, self.scan_callback)
  rospy.spin()
  
 def scan_callback(self,data):
  scan_data=data
  if rospy.has_param('~scan_frame_id'):
   frame_id=rospy.get_param('~scan_frame_id')
  else:
   rospy.set_param('~scan_frame_id')
   frame_id=rospy.get_param('~scan_frame_id')
  scan_data.header.frame_id=frame_id
  
  if rospy.has_param('~scan_topic'):
   scan_topic=rospy.get_param('~scan_topic')
  else:
   rospy.set_param('~scan_topic')
   scan_topic=rospy.get_param('~scan_topic')
   
  pub = rospy.Publisher(scan_topic, LaserScan, queue_size=10)
  pub.publish(scan_data)
if __name__=='__main__':
 try:
  rospy.loginfo ("initialization system")
  LaserTransfer()
  rospy.loginfo ("process done and quit")
 except rospy.ROSInterruptException:
  rospy.loginfo("robot twist node terminated.")
