#!/usr/bin/env python

""" reader-sub.py.py 

- Version 2.3 2015/8/25

this is rfid sensor subscriber. the function of this file is to testing reader publisher.    

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""

import rospy
from rfid.msg import RFIDreadRow

def callback(data):
 if data.data=="":
  print "no tags detected"
 else:
  arr = data.data.split(',')
  print type(arr)
  print arr
  print (arr[-1]=='')
  print "\n data length is %d"%len(arr)
  #print "%s "%data.data
  #print "data length: %d"%len(data.data)
  print "###############################################"  
def RFIDSub():

 rospy.init_node('RFIDsubTest', anonymous=True)

 rospy.Subscriber("rfid_sensor/rfidRowData", RFIDreadRow, callback)

 rospy.spin()

if __name__ == '__main__':
 RFIDSub()
