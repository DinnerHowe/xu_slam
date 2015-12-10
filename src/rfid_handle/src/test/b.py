#!/usr/bin/env python
""" 
- Version 1.0 2015/9/8

this file is to test database update

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""
from numpy import *
import os
import rospy
from rfid.msg import TransferData

class lisenter():
 def callback(self,data):
  self.data=data.ID
  self.rssi=data.rssi
  rssilist=[]
  if self.data!='':
   if self.data not in self.Datadict:
    self.Datadict['%s'%self.data]=[0,self.rssi]
   else:
    rssilist=self.Datadict['%s'%self.data]
    rssilist[0]+=1
    rssilist.append(self.rssi)
    self.Datadict['%s'%self.data]=rssilist
   print self.Datadict
  else:
   return self.Datadict
 def __init__(self):
  self.Datadict={}#store id,std(rssi),mean
  #self.rssiarray=[]
  rospy.init_node('talker', anonymous=True)
  rospy.Subscriber("rfid_sensor/rfidTransferData", TransferData, self.callback)
  rospy.spin()

if __name__=='__main__':
 try:
  lisenter()
 except rospy.ROSInterruptException:
  pass


