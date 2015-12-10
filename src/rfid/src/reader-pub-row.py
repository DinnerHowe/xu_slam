#!/usr/bin/env python

"""
- Version 2.2 2015/11/23

this is rfid sensor publisher    

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""

import os
import rospy
from rfid.msg import RFIDreadRow
import list_ports_linux,serial
from list_ports_linux import *

class driver():

 def port_finder(self):
  rospy.loginfo( "port_finder")
  ports = list(list_ports_linux.comports())
  for port in ports:
   if port[1]=='FT232R USB UART':
    return port
   else:
    return None

 def __init__(self):
  rospy.loginfo( "initial system")
  rospy.init_node('rfidread', anonymous=True)
  self.pub = rospy.Publisher('rfidRowData', RFIDreadRow, queue_size=5)
  port=self.port_finder()
  if port!=None:
   rospy.loginfo('starting reading')
   self.reading(port)
  else:
   rospy.loginfo(" please check you device or USB connecton")

 def reading(self,port):
  while not rospy.is_shutdown():
   try:
    execfile('%s'%port[0])
    #p=os.popen('~/rfiddriver/demo-xu-once tmr://%s --ant 1'%port[0],'r')
    p=os.popen('~/rfiddriver/readintoarray tmr://%s --ant 1'%port[0],'r')
    self.read=p.read()
    if self.read!="":
     rospy.loginfo("system connected at %s"%port)
    else:
     pass
   except IOError:
     rospy.loginfo( " please check you device or USB connecton")

   rfidTemp=RFIDreadRow()
   rfidTemp.data=self.read
   #print type(self.read)
   rospy.loginfo(rfidTemp.data)
   self.pub.publish(rfidTemp.data)
  rospy.loginfo( "processe ending")
  p.close() 


if __name__=='__main__':
 try:
  driver()
 except rospy.ROSInterruptException:
  pass
