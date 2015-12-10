#!/usr/bin/env python

""" laser obstacle publisher.py 
laser_listener
- Version 3.2 2015/7/30

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
 def ObstacleAnalyse(self,right,middle,left):
  print "obstacle analyse"
  if right==1 and left==0 and middle==0:
   return 'RightWarning'
  elif middle==1 and left==0 and right==0:
   return 'MiddleWarning'
  elif left==1 and right==0 and middle==0:
   return 'LeftWarning'
  elif left==1 and middle==1 and right==0:
   return 'LeftDanger'
  elif right==1 and middle==1 and left==0:
   return 'RightDanger'
  elif right==0 and middle==0 and left==0:
   return 'AllClear'
  elif right==1 and middle==1 and left==1:
   return 'num'
  else:
   return 'num'
  print "obstacle analyse is done"
############################ main ###########################3
 def __init__(self):
  print "establishing laser_obstacle node"
  #rospy.init_node('obstacle_warning',anonymous=True)

  right_weight=rweight
  middle_weight=mweight
  left_weight=lweight

  AnalyseResult=self.ObstacleAnalyse(right_weight,middle_weight,left_weight)
  print "result= %s"%AnalyseResult

  # justify the position of obstacles throw ObstacleAnalyse
  print "justify the position of obstacles"  
  if self.ObstacleAnalyse(right_weight,middle_weight,left_weight)=='RightWarning':
   ObstacleWarn='RightObstacle'

  elif self.ObstacleAnalyse(right_weight,middle_weight,left_weight)=='MiddleWarning':
   ObstacleWarn='MiddleObstacle'

  elif self.ObstacleAnalyse(right_weight,middle_weight,left_weight)=='LeftWarning':
   ObstacleWarn='LeftObstacle'

  elif self.ObstacleAnalyse(right_weight,middle_weight,left_weight)=='LeftDanger':
   ObstacleWarn='LeftDanger'
  
  elif self.ObstacleAnalyse(right_weight,middle_weight,left_weight)=='RightDanger':
   ObstacleWarn='RightDanger'  

  elif self.ObstacleAnalyse(right_weight,middle_weight,left_weight)=='AllClear':
   ObstacleWarn='AllClear'

  elif self.ObstacleAnalyse(right_weight,middle_weight,left_weight)=='num':
   ObstacleWarn='FrontDanger'

  else:
   ObstacleWarn='FrontClear'

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
  print "%s"%ObstacleWarn
  rate.sleep()



########################## laser listener ######################


class ObstacleDetector():
 
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

  global rweight
  global mweight
  global lweight

  #compare the right data fingerout it's closing weight right
  close_num,far_num,normal_num=self.CompareDistance(0,len(self.ranges)/4)
  if close_num>=normal_num and close_num >= far_num:
   rweight=1
  else:
   rweight=0
  #compare the middle data fingerout it's closing weight middle
  close_num,far_num,normal_num=self.CompareDistance(int(len(self.ranges)/4),int(len(self.ranges)/2))
  if close_num>=normal_num and close_num >= far_num:
   mweight=1
  else:
   mweight=0
  #compare the left data fingerout it's closing weight left
  close_num,far_num,normal_num=self.CompareDistance(int(len(self.ranges)/2),int((3*len(self.ranges))/4))
  if close_num>=normal_num and close_num >= far_num:
   lweight=1
  else:
   lweight=0
  print "calcultion of obstacle dirction liklihood is done"
  #return rweight,mweight,lweight
  print "right %d, middle %d, left %d"%(rweight,mweight,lweight)

############################ main ###########################3
 def __init__(self):


  print "establishing laser_obstacle node"
  rospy.init_node('laser_obstacle_detector')

  #listen to laser sensor
  print "subscribing to laser scanning"
  rospy.Subscriber('scan', LaserScan, self.scan_callback)
  
  rospy.spin()
  print "procceed done"

if __name__=='__main__':
 try:
  ObstacleDetector()
  ObstacleWarning()
 except rospy.ROSInterruptException:
  rospy.loginfo("laser_listener node terminated.")
  
