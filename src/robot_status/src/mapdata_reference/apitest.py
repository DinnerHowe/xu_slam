#!/usr/bin/env python  
#coding=utf-8
"""
test code for map_odom.py
--howe
"""
import map_odom,rospy,Queue
from nav_msgs.msg import OccupancyGrid,Odometry

if __name__ == '__main__':
 map_matrix,odom=[],[]
 map_odom.map_listener().setDaemon(True)
 map_odom.odom_listener().setDaemon(True)

 map_odom.map_listener().start()
 map_odom.odom_listener().start()
 odom_past=[]
 while not rospy.is_shutdown():
  try:
   #map_matrix=map_odom.map_data.get()
   map_matrix=map_odom.map_data.pop()
   print '\n','########map width',len(map_matrix[0][0]),'map height',len(map_matrix[0]),'\nmap_origin:\n',map_matrix[1]
  except:
   pass

  try:
   #odom=map_odom.odom_data.get()
   odom_new=map_odom.odom_data.pop()
   if odom_new!=odom_past:
    odom_past=odom_new
    print '########odom: [angle,position,ort_x,ort_y]\n',odom_past[0],'\n',odom_past[1],'\n',odom_past[2],odom_past[3]
  except:
   pass

