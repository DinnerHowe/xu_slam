#!/usr/bin/env python
"""
- Version 1.0 2015/9/29

this file is used to get cell map

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""

import rospy
import os
from nav_msgs.msg import OccupancyGrid
import getpass


def callback(data):
 print 'map info: ', data.info
 print 'data0:',data.data[0],len(data.data)
 
 data.data+=('done',)


 accout=getpass.getuser()
 store=open('/home/%s/mapdata/SingleScan.txt'%accout,'w')	
 n=len(data.data)
 for i in range(n):
  store.write('%s '%data.data[i])
  if i%288==0 and i!=0:
   store.write('\n')
 store.close()
 
 print n,'\nmap data store in ~/mapdata/SingleScan.txt'

 print data.data 
 os.system('rosnode kill test_gmappingdata')
 

def listener():
 print "start listening to map"
 rospy.init_node('test_gmappingdata', anonymous=False)
 rospy.Subscriber("map", OccupancyGrid, callback)
 rospy.spin()

if __name__ == '__main__':
 listener()







