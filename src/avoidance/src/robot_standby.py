#!/usr/bin/env python
""" 

- Version 1.0 2015/24/09

this is the motion module--- robot standby with auto avoidance. 
    

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""
import rospy
from laser.msg import warning
from geometry_msgs.msg import Twist
import math

class standby():

 def __init__(self):
  print "robot standby node"
  rospy.init_node('robot_standby',anonymous=True)
  self.status=''
  self.rewarp()
  print "subscribing to obstacle detector"
  rospy.Subscriber('laser_sensor/warning', warning, self.ForwardAction)
  rospy.spin()
  print "procceed done"

 def ForwardAction(self,info):
  self.info=info.warning
  LoopNum =  10
  self.linear_speed = -0.1  
  #self.angular_speed = math.pi/8
  print "system starting running" 
  for i in range(LoopNum):  
   
   print [self.status,self.info]

   if [self.status,self.info] in self.special:
    print 'special time'
    self.angular_speed=abs(self.AGDIFF['%s'%self.info]-self.AGDIFF['%s'%self.status])*(math.pi/8)
   else:
    print 'normal time'
    self.angular_speed = math.pi/8

   self.rules=self.rename(self.status,self.info)
   print 'rule value',self.rules


   SPratio=self.defineSP['%s'%self.ruletable['%s'%self.rules][0]]
   print SPratio

   AGratio=self.defineAG['%s'%self.ruletable['%s'%self.rules][1]]
   self.speed=self.linear_speed*SPratio
   self.angular=self.angular_speed*AGratio
   self.Actionmodel(self.speed, self.angular, self.info)
   self.status=self.info

 def rename(self, last, current):
  rename=last+'_'+current
  return rename


 def rewarp(self):
  print 'system parameter setting'

  self.special=[['RightWarning','LeftWarning'],['RightDanger','LeftDanger'],['RightHDanger','LeftHDanger'],['LeftWarning','RightWarning'],['LeftDanger','RightDanger'],['LeftHDanger','RightHDanger']]

  self.AGDIFF={
'RightWarning':1,'RightDanger':2,'RightHDanger':3,
'LeftWarning':-1,'LeftDanger':-2,'LeftHDanger':-3}  

  self.defineSP={'EXHDanger':0.2,'HDanger':0.4,'Danger':0.6,'Warning':0.8,'Unknown':1.0,'AllClear':0,'FrontObstacle':0}

  self.defineAG={'Warning':1,'-Warning':-1,'Danger':2,'-Danger':-2,'HDanger':3,'-HDanger':-3,'AllClear':0,'FrontObstacle':4,'Unknown':0,'diff':0.25,'-diff':-0.25}

  self.ruletable={
'RightWarning_RightWarning':['Warning','Warning'],'RightDanger_RightWarning':['Danger','Warning'],'RightHDanger_RightWarning':['Danger','Warning'],
'RightWarning_RightDanger':['Danger','Danger'],'RightDanger_RightDanger':['HDanger','Danger'],'RightHDanger_RightDanger':['HDanger','Danger'],
'RightWarning_RightHDanger':['HDanger','HDanger'],'RightDanger_RightHDanger':['HDanger','HDanger'],'RightHDanger_RightHDanger':['EXHDanger','HDanger'],
                  
'LeftWarning_LeftWarning':['Warning','-Warning'],'LeftDanger_LeftWarning':['Danger','-Warning'],'LeftHDanger_LeftWarning':['Danger','-Warning'],
'LeftWarning_LeftDanger':['Danger','-Danger'],'LeftDanger_LeftDanger':['HDanger','-Danger'],'LeftHDanger_LeftDanger':['HDanger','-Danger'],
'LeftWarning_LeftHDanger':['HDanger','-HDanger'],'LeftDanger_LeftHDanger':['HDanger','-HDanger'],'LeftHDanger_LeftHDanger':['EXHDanger','-HDanger'],

'AllClear_AllClear':['AllClear','AllClear'],'FrontObstacle_FrontObstacle':['FrontObstacle','FrontObstacle'],'Unknown_Unknown':['Unknown','Unknown'],

'RightWarning_LeftWarning':['Warning','-diff'],'RightDanger_LeftWarning':['Danger','-Warning'],'RightHDanger_LeftWarning':['Danger','-Warning'],
'RightWarning_LeftDanger':['Danger','-Danger'],'RightDanger_LeftDanger':['HDanger','-diff'],'RightHDanger_LeftDanger':['HDanger','-Danger'],
'RightWarning_LeftHDanger':['HDanger','-HDanger'],'RightDanger_LeftHDanger':['HDanger','-HDanger'],'RightHDanger_LeftHDanger':['EXHDanger','-diff'],

'RightWarning_AllClear':['AllClear','AllClear'],'RightDanger_AllClear':['AllClear','AllClear'],'RightHDanger_AllClear':['AllClear','AllClear'],

'RightWarning_FrontObstacle':['FrontObstacle','FrontObstacle'],'RightDanger_FrontObstacle':['FrontObstacle','FrontObstacle'],'RightHDanger_FrontObstacle':['FrontObstacle','FrontObstacle'],
'RightWarning_Unknown':['Unknown','Unknown'],'RightDanger_Unknown':['Unknown','Unknown'],'RightHDanger_Unknown':['Unknown','Unknown'],

'LeftWarning_RightWarning':['Warning','diff'],'LeftDanger_RightWarning':['Danger','Warning'],'LeftHDanger_RightWarning':['Danger','Warning'],
'LeftWarning_RightDanger':['Danger','Danger'],'LeftDanger_RightDanger':['HDanger','diff'],'LeftHDanger_RightDanger':['HDanger','Danger'],
'LeftWarning_RightHDanger':['HDanger','HDanger'],'LeftDanger_RightHDanger':['HDanger','HDanger'],'LeftHDanger_RightHDanger':['EXHDanger','diff'],

'LeftWarning_AllClear':['AllClear','AllClear'],'LeftDanger_AllClear':['AllClear','AllClear'],'LeftHDanger_AllClear':['AllClear','AllClear'],

'LeftWarning_FrontObstacle':['FrontObstacle','FrontObstacle'],'LeftDanger_FrontObstacle':['FrontObstacle','FrontObstacle'],'LeftHDanger_FrontObstacle':['FrontObstacle','FrontObstacle'],
'LeftWarning_Unknown':['Unknown','Unknown'],'LeftDanger_Unknown':['Unknown','Unknown'],'LeftHDanger_Unknown':['Unknown','Unknown'],

'AllClear_RightWarning':['Warning','Warning'],'AllClear_RightDanger':['Danger','Danger'],'AllClear_RightHDanger':['HDanger','HDanger'],

'AllClear_LeftWarning':['Warning','-Warning'],'AllClear_LeftDanger':['Danger','-Danger'],'AllClear_LeftHDanger':['HDanger','-HDanger'],

'AllClear_FrontObstacle':['FrontObstacle','FrontObstacle'],'AllClear_Unknown':['Unknown','Unknown'],

'FrontObstacle_RightWarning':['HDanger','Warning'],'FrontObstacle_RightDanger':['EXHDanger','Danger'],'FrontObstacle_RightHDanger':['FrontObstacle','HDanger'],

'FrontObstacle_LeftWarning':['HDanger','-Warning'],'FrontObstacle_LeftDanger':['EXHDanger','-Danger'],'FrontObstacle_LeftHDanger':['FrontObstacle','-HDanger'],

'FrontObstacle_AllClear':['AllClear','AllClear'],'FrontObstacle_Unknown':['Unknown','Unknown'],

'Unknown_RightWarning':['Warning','Warning'],'Unknown_RightDanger':['Danger','Danger'],'Unknown_RightHDanger':['HDanger','HDanger'],

'Unknown_LeftWarning':['Warning','-Warning'],'Unknown_LeftDanger':['Danger','-Danger'],'Unknown_LeftHDanger':['HDanger','-HDanger'],

'Unknown_AllClear':['AllClear','AllClear'],'Unknown_FrontObstacle':['FrontObstacle','FrontObstacle'],

'_AllClear':['AllClear','AllClear'],'_FrontObstacle':['FrontObstacle','FrontObstacle'],'_Unknown':['Unknown','Unknown'],
'_RightWarning':['HDanger','Warning'],'_RightDanger':['HDanger','Danger'],'_RightHDanger':['HDanger','HDanger'],
'_LeftWarning':['HDanger','-Warning'],'_LeftDanger':['HDanger','-Danger'],'_LeftHDanger':['HDanger','-HDanger']
}


 def Actionmodel(self,forwordsp,turnsp,EnvWarn):
  print "Abstacle Avoidance Model"
  print 'linear speed:',forwordsp,'angular speed:',turnsp,'environment info:',EnvWarn
  print type(forwordsp),type(turnsp),type(EnvWarn)

  self.move_cmd= Twist()  
  self.cmd_vel = rospy.Publisher('/cmd_vel_mux/input/teleop', Twist, queue_size=5)
  self.move_cmd.linear.x = forwordsp
  self.move_cmd.angular.z = turnsp
  self.cmd_vel.publish(self.move_cmd)




if __name__=='__main__':
 try:
  print "initialization system"
  standby()
  print "process done and quit"
 except rospy.ROSInterruptException:
  rospy.loginfo("robot standby node terminated.")
