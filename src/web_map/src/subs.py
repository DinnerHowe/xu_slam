#!/usr/bin/env python  
#coding=utf-8
"""
test code for map_odom.py
--howe
"""
import rospy
from web_map.msg import *

class subs():
 def map_subs(self,data):
  print '#########\nmaps block_area:\n',type(data.block_area),type(eval(data.block_area)),eval(data.block_area)
  print '#########\nmaps clear_area:\n',type(data.clear_area),type(eval(data.clear_area)),eval(data.clear_area)
 def odom_subs(self,data):
  print '#########\nodom:\n',data

 def __init__(self):
  rospy.init_node('subs', anonymous=False)

  rospy.Subscriber("web_map", web_map, self.map_subs)
  rospy.Subscriber("web_odom", web_odom, self.odom_subs)

  rospy.spin()

if __name__ == '__main__':
 subs()


