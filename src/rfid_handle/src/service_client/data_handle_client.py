#!/usr/bin/env python
"""
- Version 1.0 2015/09/16

this file is client for testing

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""
import rospy
from rfid.msg import TransferData
from rfid_handle.msg import probability
from rfid_handle.srv import *
import os
import numpy

class client():

 def datahandle(self,rfiddata):
  self.tagdata=TransferData()
  self.tagdata=rfiddata
  current={}
  try:
   server=rospy.ServiceProxy('ClassifyData', ClassifiedData)
   response=server(self.tagdata.rssi, self.tagdata.ID)
   #put mean std &ID in to a dict in form of {'ID':[mean,std,count]}
   for name in response.ID:
    current['%s'%name]=[response.meanrssi[response.ID.index('%s'%name)],response.stdrssi[response.ID.index('%s'%name)],response.idcount[response.ID.index('%s'%name)]]
   #print type(str(current)),str(current),len(current),'\n'
  except rospy.ServiceException, e:
   print "Service call failed: %s"%e
  self.pub.publish(str(current))

  

 def __init__(self):
  self.pub = rospy.Publisher('probability', probability, queue_size=10)
  rospy.init_node('RFID_Data_Handle_Client', anonymous=False)
  rospy.Subscriber("rfid_sensor/rfidTransferData", TransferData, self.datahandle)
  rospy.spin()

if __name__=='__main__':
 try:
  client()
 except rospy.ROSInterruptException:
  pass
