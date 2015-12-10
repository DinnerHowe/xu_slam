#!/usr/bin/env python

""" transferData-sub.py.py 

- Version 1.0 2015/8/25

this is rfid transfer data subscriber. the function of this file is to testing reader publisher.    

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""

import rospy
from rfid.msg import TransferData

def callback(data):
 print data
 
def RFIDSub():

 rospy.init_node('RFIDtranssubTest', anonymous=True)

 rospy.Subscriber("rfid_sensor/rfidTransferData", TransferData, callback)

 rospy.spin()

if __name__ == '__main__':
 RFIDSub()
