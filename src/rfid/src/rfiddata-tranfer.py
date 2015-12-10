#!/usr/bin/env python
#coding=utf-8
#-*- coding: UTF-8 -*-  
""" rfiddata-transfer

- Version 1.0 2015/8/24

this is rfid data transfer node, it tranfers data to ros node requested type.    

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""
import rospy
from rfid.msg import TransferData
from rfid.msg import RFIDreadRow

class DataTransfer():

 def callback(self, data):
  print "into callback"
  RFIDdata= data.data.split(',')
  self.RowDataTransfer(RFIDdata) 
  
 def RowDataTransfer(self,listData):
  print "into row data transfer"
  self.listData=listData
  self.StringLen=len(self.listData)
  pub = rospy.Publisher('rfidTransferData', TransferData, queue_size=10)
  self.TagNum=(self.StringLen-1)/2
  print "There are %d tags detected."%self.TagNum

  if self.TagNum>0:
   self.OutPut(self.listData,self.TagNum)
  else:
   rfidTemp=TransferData()
   rfidTemp.ID is None
   rfidTemp.rssi is None
   rospy.loginfo(rfidTemp)
   pub.publish(rfidTemp)


 def OutPut(self,source,length):
  print "into output"
  self.source=source
  self.length=length
  pub = rospy.Publisher('rfidTransferData', TransferData, queue_size=10)
  i=0
  while self.source[i]!='' and self.length>0:
   ID=self.source[i]
   RSSI=self.source[i+1]
   rfidTemp=TransferData()
   rfidTemp.ID=ID
   rfidTemp.rssi=int(RSSI)
   rospy.loginfo(rfidTemp)
   pub.publish(rfidTemp)
   i=i+2
   self.length=self.length-1

 def __init__(self):
  print "into init"
  rospy.init_node('Datatransfer', anonymous=True)

  rospy.Subscriber("rfidRowData", RFIDreadRow, self.callback)

  rospy.spin()


if __name__=='__main__':
 try:
  DataTransfer()
 except rospy.ROSInterruptException:
  pass
