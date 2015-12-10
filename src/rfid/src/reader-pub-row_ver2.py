#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
- Version 2.2 2015/11/23

this is rfid sensor publisher    

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""

import rospy
from multiprocessing import *
from rfid.msg import RFIDreadRow
import list_ports_linux,serial
from list_ports_linux import *



class driver():

 def port_finder(self):
  rospy.loginfo("port_finder")
  ports = list(list_ports_linux.comports())
  for port in ports:
   if port[1]=='FT232R USB UART':
    return port
   else:
    return None

 def __init__(self):
  rospy.loginfo( "initial system")
  que=Queue()
  rfidTemp=RFIDreadRow()

  rospy.init_node('rfidread', anonymous=True)

  port=self.port_finder()
  if port!=None:
   rospy.loginfo("system connected at %s"%port)
   p=os.popen('~/rfiddriver/readintoarray tmr://%s --ant 1'%port[0],'r')
   pub = rospy.Publisher('rfidRowData_ver2', RFIDreadRow, queue_size=1)
   while not rospy.is_shutdown():
    reader=Process(target=self.reading, args=(que,port))
    reader.start()
    self.pubber(que,rfidTemp,pub)
    reader.join()
  else:
   rospy.loginfo('None port found')
  p.close()

 def pubber(self,que,rfidTemp,pub):
  rfidTemp.data=que.get()
  pub.publish(rfidTemp.data)
  rospy.loginfo(rfidTemp.data)

 def reading(self,que,port):
  p=os.popen('~/rfiddriver/readintoarray tmr://%s --ant 1'%port[0],'r')
  read=p.read()
  que.put(read)

if __name__=='__main__':
 try:
  driver()
 except rospy.ROSInterruptException:
  pass
