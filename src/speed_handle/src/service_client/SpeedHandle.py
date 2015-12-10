#!/usr/bin/env python
""" speed_handle.py 

- Version 1.0 2015/9/10

this is the motion module--- handle speed linear acceleration and. 
    

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""

import rospy
from speed_handle.srv import *
from geometry_msgs.msg import Twist

class SpeedHandle():

 def debug(self,lineardiff,angulardiff,cm):
  cmd=cm
  print "\nnew coming"
  print type(cmd)
  print cmd
  if cmd is not None:
   print type(cmd.linear.x)
   print "cmd:x:%s"%cmd.linear.x

  print "####################"
  print "\noragin"
  print type(self.speeddict['oragin'])
  print self.speeddict['oragin']
  if self.speeddict['oragin'] is not None:
   print type(self.speeddict['oragin'].linear.x)
   print "dict:x:%s"%self.speeddict['oragin'].linear.x
   print 'linear:',lineardiff,'angular:',angulardiff
   print ' self.Linearacc', self.Linearacc,'self.Angularacc',self.Angularacc



 def calibration(self,data):
  if self.speeddict['oragin'] is not None:
   cali=data
  else:
   cali=SpeedRequest()
  #print cali.linear,'\n',cali.angular
  if abs(cali.angular.z)<0.00001:
   cali.angular.z=0.0
  else:
   pass
  if abs(cali.linear.x)<0.00001:
   cali.linear.x=0.0
  else:
   pass
  return cali

 def diff(self,diffrencial,command):
  cmd=command
  spdiff=diffrencial
  if self.speeddict['oragin'] is not None:
   spdiff['lineardiff']=self.speeddict['oragin'].linear.x-cmd.linear.x
   spdiff['angulardiff']=self.speeddict['oragin'].angular.z-cmd.angular.z
  else:
   spdiff['lineardiff']=0
   spdiff['angulardiff']=0
  return spdiff

 def callback(self, current):
  pub = rospy.Publisher('/cmd_vel_mux/input/teleop', Twist, queue_size=100)
  cmd=Twist()
  cmd=current
  acr=10
  self.steps=10 #speed will boost in 10 steps
  spdiff={'lineardiff':None,'angulardiff':None}
  spdiff=self.diff(spdiff,cmd)
  self.Linearacc=spdiff['lineardiff']/self.steps
  self.Angularacc=spdiff['angulardiff']/self.steps

  #self.debug(spdiff['lineardiff'],spdiff['angulardiff'],cmd)

  if self.speeddict['oragin'] is not None:
   for i in range(self.steps):
    if spdiff['lineardiff']:
     if spdiff['angulardiff']:
      self.speeddict['oragin'].angular.z-=self.Angularacc
      self.speeddict['oragin'].linear.x-=self.Linearacc
      self.speeddict['oragin']=self.calibration(self.speeddict['oragin'])
      for i in range(acr):
       pub.publish(self.speeddict['oragin'])
      print '1'
      print 'self.Angularacc',self.Angularacc,'self.Linearacc',self.Linearacc
      rospy.loginfo(self.speeddict['oragin'])
      spdiff=self.diff(spdiff,cmd)
     else:
      self.speeddict['oragin'].linear.x-=self.Linearacc
      self.speeddict['oragin']=self.calibration(self.speeddict['oragin'])
      for i in range(acr):
       pub.publish(self.speeddict['oragin'])   
      print '2'
      rospy.loginfo(self.speeddict['oragin'])
      spdiff=self.diff(spdiff,cmd)
             
    elif spdiff['lineardiff']==0:
     if spdiff['angulardiff']:
      self.speeddict['oragin'].angular.z-=self.Angularacc
      self.speeddict['oragin']=self.calibration(self.speeddict['oragin'])
      for i in range(acr):
       pub.publish(self.speeddict['oragin'])
      print '3'
      rospy.loginfo(self.speeddict['oragin'])
      spdiff=self.diff(spdiff,cmd)
      spdiff['lineardiff']=0
     else:
      self.speeddict['oragin']=self.calibration(self.speeddict['oragin'])
      for i in range(acr):
       pub.publish(self.speeddict['oragin'])
      spdiff=self.diff(spdiff,cmd)
      print '4'
      rospy.loginfo(self.speeddict['oragin'])
    
    else:
     self.speeddict['oragin']=self.calibration(self.speeddict['oragin'])
     for i in range(acr):
      pub.publish(self.speeddict['oragin'])
     spdiff=self.diff(spdiff,cmd)
     print '5'
     rospy.loginfo(self.speeddict['oragin'])
  else:
   self.speeddict['oragin']=self.calibration(self.speeddict['oragin'])
   for i in range(acr):
    pub.publish(self.speeddict['oragin'])
   spdiff=self.diff(spdiff,cmd)
   print '6'
   rospy.loginfo(self.speeddict['oragin'])


 def Handle(self, data):
  self.speeddict['changer']=data
  if self.speeddict['oragin']!=self.speeddict['changer'] and self.speeddict['oragin'] is not None:
   self.callback(self.speeddict['changer'])
   self.speeddict['oragin']=self.speeddict['changer']
  elif self.speeddict['oragin'] is None:
   self.callback(self.speeddict['changer'])
   self.speeddict['oragin']=self.speeddict['changer']
  else:
   self.callback(self.speeddict['oragin'])
  return 'pubed'

 def __init__(self):

  self.speeddict={'oragin':None,'oragin':None}
  rospy.init_node('Speed_Handle', anonymous=True)
  server = rospy.Service('speed', Speed, self.Handle)
  rospy.spin()

#########################
##        main         ##
#########################
if __name__=='__main__':
 try:
  print "initialization system"
  SpeedHandle()
  print "process done and quit"
 except rospy.ROSInterruptException:
  rospy.loginfo("speed handle node terminated.")
