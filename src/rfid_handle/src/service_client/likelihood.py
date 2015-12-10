#!/usr/bin/env python
""" 
- Version 1.0 2015/09/17

this file is to get rfid data likelihood

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""
#import subprocess
import os
import time
import rospy
from rfid_handle.msg import probability
from rfid_handle.srv import *
import getpass

class likihood():

 def callback(self,data):
  self.last=self.current
  self.data=probability() 
  self.data=data
  self.current=eval(data.probability)
  print 'current\n',self.current,'\n'

  if self.current!={}:#1
   for name in self.current:
    if name in self.last and name in self.lock:#1
     if self.current['%s'%name][2]>self.last['%s'%name][2]>self.lock['%s'%name][2]:#1
      self.lock['%s'%name]=self.last['%s'%name]
      print 'lock:\n%s\n'%self.lock
      print "clock:", time.clock(),'\n\n'
      self.pub.publish(str(self.lock))
      accout=getpass.getuser()
      store=open('/home/%s/SingleScan.txt'%accout,'a')
      store.writelines("%s\n"%str(self.lock))
      store.close()
     if self.current['%s'%name][2]>self.lock['%s'%name][2]>self.last['%s'%name][2]:#2
      self.lock['%s'%name]=self.current['%s'%name]
      print 'lock:\n%s\n'%self.lock
      print "clock:", time.clock(),'\n\n'
      self.pub.publish(str(self.lock))
      accout=getpass.getuser()
      store=open('/home/%s/SingleScan.txt'%accout,'a')
      store.writelines("%s\n"%str(self.lock))
      store.close()

     if self.last['%s'%name][2]>self.lock['%s'%name][2]>self.current['%s'%name][2]:#3
      self.lock['%s'%name]=self.last['%s'%name]
      print 'lock:\n%s\n'%self.lock
      self.pub.publish(str(self.lock))
      print "clock:", time.clock(),'\n\n'
      accout=getpass.getuser()
      store=open('/home/%s/SingleScan.txt'%accout,'a')
      store.writelines("%s\n"%str(self.lock))
      store.close()

     if self.last['%s'%name][2]>self.current['%s'%name][2]>self.lock['%s'%name][2]:#4
      self.lock['%s'%name]=self.last['%s'%name]
      print 'lock:\n%s\n'%self.lock
      self.pub.publish(str(self.lock))
      print "clock:", time.clock(),'\n\n'
      accout=getpass.getuser()
      store=open('/home/%s/SingleScan.txt'%accout,'a')
      store.writelines("%s\n"%str(self.lock))
      store.close()
     
     if self.lock['%s'%name][2]>self.current['%s'%name][2]>self.last['%s'%name][2]:#5
      pass
     if self.lock['%s'%name][2]>self.last['%s'%name][2]>self.current['%s'%name][2]:#6
      pass

     if self.current['%s'%name][2]==self.last['%s'%name][2]>self.lock['%s'%name][2]:#7
      self.lock['%s'%name]=self.last['%s'%name]
      print 'lock:\n%s\n'%self.lock
      self.pub.publish(str(self.lock))
      print "clock:", time.clock(),'\n\n'
      accout=getpass.getuser()
      store=open('/home/%s/SingleScan.txt'%accout,'a')
      store.writelines("%s\n"%str(self.lock))
      store.close()

     if self.current['%s'%name][2]==self.lock['%s'%name][2]>self.last['%s'%name][2]:#8
      pass
     if self.last['%s'%name][2]==self.lock['%s'%name][2]>self.current['%s'%name][2]:#9
      pass
     
     if self.current['%s'%name][2]>self.last['%s'%name][2]==self.lock['%s'%name][2]:#10
      pass
     if self.last['%s'%name][2]>self.lock['%s'%name][2]==self.current['%s'%name][2]:#11
      self.lock['%s'%name]=self.last['%s'%name]
      print 'lock:\n%s\n'%self.lock
      self.pub.publish(str(self.lock))
      print "clock:", time.clock(),'\n\n'
      accout=getpass.getuser()
      store=open('/home/%s/SingleScan.txt'%accout,'a')
      store.writelines("%s\n"%str(self.lock))
      store.close()

     if self.lock['%s'%name][2]>self.last['%s'%name][2]==self.current['%s'%name][2]:#12
      pass

     if self.lock['%s'%name][2]==self.current['%s'%name][2]==self.lock['%s'%name][2]:#13
      pass

    if name in self.last and name not in self.lock:#2
     self.lock['%s'%name]=self.last['%s'%name]
     print 'lock:\n%s\n'%self.lock
     self.pub.publish(str(self.lock))
     print "clock:", time.clock(),'\n\n'
     accout=getpass.getuser()
     store=open('/home/%s/SingleScan.txt'%accout,'a')
     store.writelines("%s\n"%str(self.lock))
     store.close()

    if name not in self.last and name in self.lock:#3
     if self.lock['%s'%name][2]>self.current['%s'%name][2]:#1
      pass
     if self.lock['%s'%name][2]==self.current['%s'%name][2]:#2
      pass
     if self.lock['%s'%name][2]<self.current['%s'%name][2]:#3
      self.lock['%s'%name]=self.current['%s'%name]
      print 'lock:\n%s\n'%self.lock
      self.pub.publish(str(self.lock))
      print "clock:", time.clock(),'\n\n'
      accout=getpass.getuser()
      store=open('/home/%s/RFIDSingleScan.txt'%accout,'a')
      store.writelines("%s\n"%str(self.lock))
      store.close()

    if name not in self.last and name not in self.lock:#4
     pass

  else:#2
   pass

 def __init__(self):
  self.current={}
  self.lock={}
  self.last={}
  #self.lastlock={}
  print 'current:',self.current,'\n','last:',self.last,'\n','lock:',self.lock
  self.pub = rospy.Publisher('particles', probability, queue_size=10)
  rospy.init_node('RFID_likihoode', anonymous=True)
  os.system('rosnode kill /RFID_Data_Handle_service')
  rospy.Subscriber("probability", probability, self.callback)
  rospy.spin()

if __name__=='__main__':
 try:
  likihood()
 except rospy.ROSInterruptException:
  pass
