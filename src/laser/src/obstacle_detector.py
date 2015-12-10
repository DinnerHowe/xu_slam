#!/usr/bin/env python
""" obstacle detector.py 

- Version 1.0 2015/8/26

this is the --- obstacle detector. 
    

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""
import rospy
from laser.msg import LaserLikihood
from laser.msg import warning

class Detector():
 def __init__(self):

  print "detector node"
  rospy.init_node('Detector',anonymous=True)
  #listen to laser_listener
  print "subscribing to laser listener"
  rospy.Subscriber('Laser_Likihood', LaserLikihood, self.WarningPub)
  rospy.spin()
  print "procceed done"

 def WarningPub(self,Likihood):
  print "establishing Detector node"
  #publishing a obsatcle warning for robot
  self.right_weight=Likihood.rweight
  self.middle_right_weight=Likihood.mrweight
  self.middle_left_weight=Likihood.mlweight
  self.left_weight=Likihood.lweight
  # justify the position of obstacles throw ObstacleAnalyse
  print "justify the position of obstacles"  
  if self.ObstacleAnalyse(self.right_weight,self.middle_right_weight,self.middle_left_weight,self.left_weight)=='RightWarning':
   ObstacleWarn='RightObstacle'

  elif self.ObstacleAnalyse(self.right_weight,self.middle_right_weight,self.middle_left_weight,self.left_weight)=='RightDanger':
   ObstacleWarn='RightDanger'

  elif self.ObstacleAnalyse(self.right_weight,self.middle_right_weight,self.middle_left_weight,self.left_weight)=='RightHDanger':
   ObstacleWarn='RightHDanger'

  elif self.ObstacleAnalyse(self.right_weight,self.middle_right_weight,self.middle_left_weight,self.left_weight)=='LeftHDanger':
   ObstacleWarn='LeftHDanger'

  elif self.ObstacleAnalyse(self.right_weight,self.middle_right_weight,self.middle_left_weight,self.left_weight)=='LeftDanger':
   ObstacleWarn='LeftDanger'

  elif self.ObstacleAnalyse(self.right_weight,self.middle_right_weight,self.middle_left_weight,self.left_weight)=='LeftWarning':
   ObstacleWarn='LeftObstacle' 

  elif self.ObstacleAnalyse(self.right_weight,self.middle_right_weight,self.middle_left_weight,self.left_weight)=='AllClear':
   ObstacleWarn='AllClear'

  elif self.ObstacleAnalyse(self.right_weight,self.middle_right_weight,self.middle_left_weight,self.left_weight)=='FrontObstacle':
   ObstacleWarn='FrontObstacle'

  elif self.ObstacleAnalyse(self.right_weight,self.middle_right_weight,self.middle_left_weight,self.left_weight)=='Unknown':
   ObstacleWarn='Unknown'

############### Obstacle Position Analysing  #########################
 def ObstacleAnalyse(self,right,middler,middlel,left):
  print "obstacle analyse"
  self.warning=warning.warning
  #analysis obstacles postion likihood
  if right==1 and middler==0 and middlel==0 and left==0 :
   self.warning='RightWarning'
  elif right==0 and middler==1 and middlel==0 and left==0 :
   self.warning='Unknown'
  elif right==0 and middler==0 and middlel==1 and left==0 :
   self.warning='Unknown'
  elif right==0 and middler==0 and middlel==0 and left==1 :
   self.warning='LeftWarning'

  elif right==1 and middler==1 and middlel==0 and left==0 :
   self.warning='RightDanger'
  elif right==0 and middler==1 and middlel==1 and left==0 :
   self.warning='Unknown'
  elif right==0 and middler==0 and middlel==1 and left==1 :
   self.warning='LeftDanger'
  elif right==1 and middler==0 and middlel==0 and left==1 :
   self.warning='AllClear'
  elif right==1 and middler==0 and middlel==1 and left==0 :
   self.warning='RightWarning'
  elif right==0 and middler==1 and middlel==0 and left==1 :
   self.warning='LeftWarning'
  
  elif right==1 and middler==1 and middlel==1 and left==0 :
   self.warning='RightHDanger'
  elif right==0 and middler==1 and middlel==1 and left==1 :
   self.warning='LeftHDanger'
  elif right==1 and middler==0 and middlel==1 and left==1 :
   self.warning='LeftWarning'
  elif right==1 and middler==1 and middlel==0 and left==1 :
   self.warning='RightWarning'

  elif right==1 and middler==1 and middlel==1 and left==1 :
   self.warning='FrontObstacle'
  elif right==0 and middler==0 and middlel==0 and left==0 :
   self.warning='AllClear'

  pub = rospy.Publisher('warning', warning, queue_size=5)
  rospy.loginfo(self.warning)
  pub.publish(self.warning)

############################ main ###########################3

if __name__=='__main__':
 try:
  print "initialization system"
  Detector()
  print "process done and quit"
 except rospy.ROSInterruptException:
  rospy.loginfo("Detector node terminated.")

