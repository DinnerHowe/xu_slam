#!/usr/bin/env python

""" laser obstacle publisher.py 
laser_listener
- Version 3.3 2015/7/30

this code is a listener of laser scanner for SLAM

this code would listen to kinect scanner, and publish a obstacle warning 
    

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""


import roslib
import rospy 
from sensor_msgs.msg import LaserScan
from std_msgs.msg import String
import math

########################### result publisher #####################


class ObstacleWarning():
############### Obstacle Position Analysing (Laser) #########################
 def ObstacleAnalyse(self,right,middler,middlel,left):
  #print "obstacle analyse"
  if right==1 and middler==0 and middlel==0 and left==0 :
   return 'RightWarning'
  elif right==0 and middler==1 and middlel==0 and left==0 :
   return 'RightDanger'
  elif right==0 and middler==0 and middlel==1 and left==0 :
   return 'LeftDanger'
  elif right==0 and middler==0 and middlel==0 and left==1 :
   return 'LeftWarning'
  elif right==1 and middler==1 and middlel==0 and left==0 :
   return 'RightDanger'
  elif right==0 and middler==1 and middlel==1 and left==0 :
   return 'num'
  elif right==0 and middler==0 and middlel==1 and left==1 :
   return 'LeftDanger'
  elif right==1 and middler==0 and middlel==0 and left==1 :
   return 'AllClear'
  elif right==0 and middler==0 and middlel==0 and left==0 :
   return 'AllClear'
  else:
   return 'num'
  #print "obstacle analyse is done"
############################ main ###########################3

 def WarningPub(self,right_weight,middle_right_weight,middle_left_weight,left_weight):
  #print "establishing laser_obstacle node"

  self.right_weight=right_weight
  self.middle_right_weight=middle_right_weight
  self.middle_left_weight=middle_left_weight
  self.left_weight=left_weight


  AnalyseResult=self.ObstacleAnalyse(self.right_weight,self.middle_right_weight,self.middle_left_weight,self.left_weight)
  #print "result= %s"%AnalyseResult

  # justify the position of obstacles throw ObstacleAnalyse
  #print "justify the position of obstacles"  
  if self.ObstacleAnalyse(self.right_weight,self.middle_right_weight,self.middle_left_weight,self.left_weight)=='RightWarning':
   ObstacleWarn='RightObstacle'

  elif self.ObstacleAnalyse(self.right_weight,self.middle_right_weight,self.middle_left_weight,self.left_weight)=='RightDanger':
   ObstacleWarn='RightDanger'

  elif self.ObstacleAnalyse(self.right_weight,self.middle_right_weight,self.middle_left_weight,self.left_weight)=='LeftDanger':
   ObstacleWarn='LeftDanger'

  elif self.ObstacleAnalyse(self.right_weight,self.middle_right_weight,self.middle_left_weight,self.left_weight)=='LeftWarning':
   ObstacleWarn='LeftWarning' 

  elif self.ObstacleAnalyse(self.right_weight,self.middle_right_weight,self.middle_left_weight,self.left_weight)=='AllClear':
   ObstacleWarn='AllClear'

  elif self.ObstacleAnalyse(self.right_weight,self.middle_right_weight,self.middle_left_weight,self.left_weight)=='num':
   ObstacleWarn='FrontDanger'

  else:
   ObstacleWarn='AllClear'

  # establish a publisher
  #print "establishing a obstacle warning publisher"
  pub=rospy.Publisher('laser_obstacle_warning',String, queue_size=10)
  # pub the position of obstacles at rate 10hz
  rate=rospy.Rate(10)


  #print "publishing obstacle positin"
  #publish a topic
  pub.publish(ObstacleWarn)
  # show pub info on screen
  rospy.loginfo(ObstacleWarn)
  #print "%s"%ObstacleWarn




########################## Obstacle Detector module ######################


class ObstacleDetector():
 
############### Comparing distance (Laser) #########################
 def CompareDistance(self,data1, data2):

  #print "start calculate distance"
  close=0
  far=0
  normal=0
  i=data1
  while (data1-1)<i<data2 and not rospy.is_shutdown():
   if self.ranges[i] < 1.0 or math.isnan(self.ranges[i]):
    close+=1
   elif self.ranges[i] > 8.0:
    far+=1
   else:
    normal+=1
   i+=1
  #print "distance calculation is done"

  return close,far,normal


################# laser callback#######################
 def scan_callback(self, scan):
  #print "calculating obstacle dirction liklihood"
  self.ranges=scan.ranges

  #compare the right range data fingerout it's closing weight right
  close_num,far_num,normal_num=self.CompareDistance(0,int(len(self.ranges)/4))
  if close_num>=normal_num and close_num >= far_num:
   self.rweight=1
  else:
   self.rweight=0
  #compare the middle range data fingerout it's closing weight middle
  close_num,far_num,normal_num=self.CompareDistance(int(len(self.ranges)/4),int(len(self.ranges)/2))
  if close_num>=normal_num and close_num >= far_num:
   self.mrweight=1
  else:
   self.mrweight=0
  #compare the left range data fingerout it's closing weight left
  close_num,far_num,normal_num=self.CompareDistance(int(len(self.ranges)/2),int(3*len(self.ranges)/4))
  if close_num>=normal_num and close_num >= far_num:
   self.mlweight=1
  else:
   self.mlweight=0
  close_num,far_num,normal_num=self.CompareDistance(int(3*len(self.ranges)/4),int(len(self.ranges)))
  if close_num>=normal_num and close_num >= far_num:
   self.lweight=1
  else:
   self.lweight=0
  #print "calcultion of obstacle dirction liklihood is done"

  print "right %d, middle-right %d, middle-left %d left %d"%(self.rweight,self.mrweight,self.mlweight,self.lweight)
  
  warning=ObstacleWarning()
  warning.WarningPub(self.rweight,self.mrweight,self.mlweight,self.lweight)  

  #return self.rweight,self.mweight,self.lweight

 def __init__(self):

  print "establishing laser_obstacle node"
  rospy.init_node('laser_obstacle_detector')

  #listen to laser sensor
  print "subscribing to laser scanning"
  rospy.Subscriber('scan', LaserScan, self.scan_callback)
  
  rospy.spin()
  print "procceed done"

############################ main ###########################3

if __name__=='__main__':
 try:

  warnner=ObstacleDetector()

 except rospy.ROSInterruptException:
  rospy.loginfo("laser_listener node terminated.")

  
