#!/usr/bin/env python
""" 
- Version 1.0 2015/09/15

this file is to classify rfid data

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""
import rospy
#from rfid.msg import TransferData
from rfid_handle.srv import *
import numpy

class DataHandle():

 def idcollecter(self,data):
  self.data=ClassifiedDataRequest()
  self.data=data
  rssilist=[]
  if self.data.ID!='':
   if self.data.ID not in self.Datadict:
    self.Datadict['%s'%self.data.ID]=[0,self.data.rssi]
   else:
    rssilist=self.Datadict['%s'%self.data.ID]
    rssilist[0]+=1
    rssilist.append(self.data.rssi)
    self.Datadict['%s'%self.data.ID]=rssilist
  else:   
   #print 'datadict', self.Datadict 
   return self.Datadict 

 def callback(self,data):
  self.tagdata=ClassifiedDataRequest()
  self.tagdata=data
  self.ClassifiedData=ClassifiedDataResponse()
  self.idcollecter(self.tagdata)

  for name in self.Datadict:
   self.ClassifiedData.ID.append(name)
   self.ClassifiedData.idcount.append(self.Datadict['%s'%name][0])
   self.ClassifiedData.meanrssi.append(numpy.mean(self.Datadict['%s'%name][1:]))
   self.ClassifiedData.stdrssi.append(numpy.std(self.Datadict['%s'%name][1:]))
  return self.ClassifiedData#Arraies


 def __init__(self):
  self.Datadict={}#store id,std(rssi),mean
  rospy.init_node('RFID_Data_Handle_service', anonymous=False)
  rospy.Service("ClassifyData", ClassifiedData, self.callback)
  rospy.spin()

if __name__=='__main__':
 try:
  DataHandle()
 except rospy.ROSInterruptException:
  pass
