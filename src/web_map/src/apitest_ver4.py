#!/usr/bin/env python  
#coding=utf-8
"""
test code for map_odom.py
--howe
"""
import map_odom_ver2,rospy
from nav_msgs.msg import OccupancyGrid,Odometry
from web_map.msg import *

class apitester():

 def __init__(self):
  rospy.init_node('map_odom', anonymous=False)
  map_odom_ver2.map_listener().setDaemon(True)
  map_odom_ver2.odom_listener().setDaemon(True)
  map_odom_ver2.odom_listener().start()
  map_odom_ver2.map_listener().start()

  rospy.spin()

if __name__ == '__main__':
 apitester()


