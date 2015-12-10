#!/usr/bin/env python  
#coding=utf-8
"""
test code for map_odom.py
--howe
"""
import map_odom_ver3,rospy,Queue
from nav_msgs.msg import OccupancyGrid,Odometry
from robot_status.msg import *

def odom_(data):
 odom=data
 #odo=map_odom_ver2.decompression(odom.data)
 #print 'odom: [angle,ort_x,ort_y]\n',odo,'position\n',odom.pose
 
def map_(data):
 mapper=data
 #ma=map_odom_ver2.decompression(mapper.data)
 print '\n\n','map width',len(ma[0]),'map height',len(ma),'\n',mapper.pose

if __name__ == '__main__':
 rospy.init_node('map_lisenter', anonymous=False)

 rospy.Subscriber("web_odom", map_odom, odom_)
 rospy.Subscriber("web_map", map_odom, map_)
 rospy.spin()

