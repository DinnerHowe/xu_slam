#!/usr/bin/env python

""" laser obstacle publisher.py 
laser_listener
- Version 3.1 2015/7/29

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


class ObstacleWarning():
 

############### Comparing distance (Laser) #########################
 def CompareDistance(self,data1, data2):

  print "start calculate distance"
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
  return close,far,normal
  print "distance calculation is done"

  print "%d~~~~%d"%(data1,data2)
  print "min num %s" % close
  print "normal %s" % normal
  print "max num %s"% far


################# laser callback#######################
 def scan_callback(self, scan):
  print "calculating obstacle dirction liklihood"
  self.ranges=scan.ranges

  #compare the right data fingerout it's closing weight right
  close_num,far_num,normal_num=self.CompareDistance(0,len(self.ranges)/4)
  if close_num>=normal_num and close_num >= far_num:
   self.rweight=1
  else:
   self.rweight=0
  #compare the middle data fingerout it's closing weight middle
  close_num,far_num,normal_num=self.CompareDistance(int(len(self.ranges)/4),int(len(self.ranges)/2))
  if close_num>=normal_num and close_num >= far_num:
   self.mweight=1
  else:
   self.mweight=0
  #compare the left data fingerout it's closing weight left
  close_num,far_num,normal_num=self.CompareDistance(int(len(self.ranges)/2),int((3*len(self.ranges))/4))
  if close_num>=normal_num and close_num >= far_num:
   self.lweight=1
  else:
   self.lweight=0
  print "calcultion of obstacle dirction liklihood is done"
  #return rweight,mweight,lweight
############### Obstacle Position Analysing (Laser) #########################
 def ObstacleAnalyse(self,right,middle,left):
  print "obstacle analyse"
  if right >middle and right>left:
   return 'RightWarning'
  elif middle>right and middle>left:
   return 'MiddleWarning'
  elif left>middle and left>right:
   return 'LeftWarning'
  else:
   return 'num'
  print "obstacle analyse is done"

############################ main ###########################3
 def __init__(self):

  self.rweight=0
  self.mweight=0
  self.lweight=0

  print "establishing laser_obstacle node"
  rospy.init_node('laser_obstacle')
  #listen to laser sensor
  print "subscribing to laser scanning"
 
  rospy.Subscriber('scan', LaserScan, self.scan_callback)

  right_weight=self.rweight
  middle_weight=self.mweight
  left_weight=self.lweight
  #rospy.sleep(1)
  AnalyseResult=self.ObstacleAnalyse(right_weight,middle_weight,left_weight)
  print "result= %s"%AnalyseResult
  # justify the position of obstacles throw ObstacleAnalyse
  print "justify the position of obstacles"  
  if self.ObstacleAnalyse(right_weight,middle_weight,left_weight)=='LeftWarning':
   ObstacleWarn='LeftObstacle'
  elif self.ObstacleAnalyse(right_weight,middle_weight,left_weight)=='RightWarning':
   ObstacleWarn='RightObstacle'
  elif self.ObstacleAnalyse(right_weight,middle_weight,left_weight)=='MiddleWarning':
   ObstacleWarn='MiddleObstacle'
  elif self.ObstacleAnalyse(right_weight,middle_weight,left_weight)=='num':
   ObstacleWarn='FrontClear'
  else:
   ObstacleWarn='middleObstacle'

  # establish a publisher
  print "establishing a obstacle warning publisher"
  pub=rospy.Publisher('laser_obstacle_warning',String, queue_size=10)
  # pub the position of obstacles at rate 10hz
  rate=rospy.Rate(10)


  print "publishing obstacle positin"
  #publish a topic
  pub.publish(ObstacleWarn)
  # show pub info on screen
  rospy.loginfo(ObstacleWarn)
  rospy.spin()
  print "procceed done"

if __name__=='__main__':
 try:
  ObstacleWarning()
 except rospy.ROSInterruptException:
  rospy.loginfo("laser_listener node terminated.")
  
