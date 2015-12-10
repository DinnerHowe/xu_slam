#!/usr/bin/env python
#coding=utf-8
"""
- Version 1.0 2015/11/24

rfid-transfer第二版，解析每次少描到多少个tag，每个tag少描了多少次以及tag id
添加odom，实现同步发不odom+rfid的功能

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""
import rospy
from rfid.msg import *
from nav_msgs.msg import Odometry
from geometry_msgs.msg import Pose

class DataTransfer_ver2():

 def odo_callback(self,data):
  self.odom_pose=data.pose.pose

 def rfi_callback(self, data):
  RFIDdata= data.data.split(';')
  for i in RFIDdata:
   rfid_data_para=i.split(':')
   #print rfid_data_para
   if 'tags number' in rfid_data_para[0]:
    self.scan_tag_num=rfid_data_para[1]
   if 'id' in rfid_data_para[0]:
    self.tag_id.append(rfid_data_para[1])
   if 'count' in rfid_data_para[0]:
    self.tag_count.append(int(rfid_data_para[1]))

  if len(self.tag_count)==len(self.tag_id):
   for i in range(len(self.tag_count)):
    if self.tag_count[i]>12:
     self.rfid_odom_pose.pose=self.odom_pose
     self.rfid_odom_pose.id=self.tag_id[i]
     self.pub_rfod.publish(self.rfid_odom_pose)
   #max_count=max(self.tag_count)
   #indix=self.tag_count.index(max_count)
   #print 'max: tag_id:%s, tag_count:%s'%(self.tag_id[indix],max_count)


  self.scan_data.num=self.scan_tag_num
  self.scan_data.ID=self.tag_id
  self.scan_data.count=self.tag_count
  self.pub.publish(self.scan_data)
  self.define()

 def define(self):
  self.rfid_odom_pose=rfid_odom()
  self.scan_tag_num=0
  self.tag_id=[]
  self.tag_count=[]
  self.temp={}
  self.scan_data=rfid_info()
  self.pub = rospy.Publisher('rfid_info', rfid_info, queue_size=5)
  self.pub_rfod = rospy.Publisher('rfid_odom', rfid_odom, queue_size=5)
  self.odom_pose=Pose()

 def __init__(self):
  rospy.init_node('Datatransfer_ver2', anonymous=True)
  self.define()
  rospy.Subscriber("odom", Odometry, self.odo_callback)
  rospy.Subscriber("rfidRowData_ver2", RFIDreadRow, self.rfi_callback)
  rospy.spin()


if __name__=='__main__':
 try:
  DataTransfer_ver2()
 except rospy.ROSInterruptException:
  pass
