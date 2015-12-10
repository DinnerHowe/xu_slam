#!/usr/bin/env python  
#coding=utf-8
"""
test code for map_odom.py
--howe
"""
import map_odom_ver2,rospy,Queue
from nav_msgs.msg import OccupancyGrid,Odometry
from robot_status.msg import *

class apitester():
 def odom_(self,data):
  odom_new=data
  if odom_new!=self.odom:
   self.odom=odom_new
   print 'robot odom: [angle,ort_x,ort_y]\n',eval(self.odom.data),'robot position\n',self.odom.pose
   map_data=eval(self.mapper.data)
   print '\nmap pose',self.mapper.pose,'\nmap width:',len(map_data[0]),'map height:',len(map_data),'\n','##################################'



 def map_(self,data):
  mapper_new=data
  if self.mapper!=mapper_new:
   self.mapper=mapper_new


 def __init__(self):
  rospy.init_node('map_lisenter', anonymous=False)

  pub = rospy.Publisher('chatter', String, queue_size=10)
  pub = rospy.Publisher('chatter', String, queue_size=10)

  self.odom=map_odom()
  self.mapper=map_odom()
  map_odom_ver2.map_listener().setDaemon(True)
  map_odom_ver2.map_listener().start()
  map_odom_ver2.odom_listener().setDaemon(True)
  map_odom_ver2.odom_listener().start()

  rospy.Subscriber("web_map", map_odom, self.map_)
  rospy.Subscriber("web_odom", map_odom, self.odom_)

  rospy.spin()

if __name__ == '__main__':
 apitester()


