#!/usr/bin/env python  
#coding=utf-8

"""
Version 3.0 30/11
拆成2个pub

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. """

from nav_msgs.msg import OccupancyGrid,Odometry
import rospy,quat_to_angle
from web_map.msg import *
from map_listener_reference import *

class map_listener():

 def map_(self,data):
  [clear_area,block_area]=effective_point_cell(data)
  self.map_data.clear_area=str(clear_area)
  self.map_data.block_area=str(block_area)
  pub_map = rospy.Publisher('web_map', web_map, queue_size=10)
  print self.map_data
  pub_map.publish(self.map_data)


 def __init__(self):
  rospy.init_node('map_thread', anonymous=False)
  self.map_data=web_map()
  rospy.Subscriber("map", OccupancyGrid, self.map_)
  rospy.spin()

if __name__ == '__main__':
  map_listener()
