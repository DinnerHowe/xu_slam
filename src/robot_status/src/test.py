#!/usr/bin/env python  
import rospy
from nav_msgs.msg import OccupancyGrid

def callback(data):
 print 'data.header\n',data.header,'\n'
 print 'data.info\n',data.info,'\n'
 #print '\n',data.data,'\n'


if __name__ == '__main__':
 rospy.init_node('map_lisenter', anonymous=False)
 rospy.Subscriber("map", OccupancyGrid, callback)
 rospy.spin()

