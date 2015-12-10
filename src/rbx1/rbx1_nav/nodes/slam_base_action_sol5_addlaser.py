#!/usr/bin/env python
""" slam_base_action_sol5.py 

- Version 1.0 2015/8/3

this is base_scan_action module 5 for SLAM. resolving the stop-run problem.

one node method modify program structure

problely would not work. the problely error would be staying in obstacle detector!

robot would turn left 90deg first and then turn back 90deg let robot face forward. Next, robot will turn right 90deg again and back to original position followed by forwarding about 1m.
    

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""


import rospy
from geometry_msgs.msg import Twist, Point, Quaternion
import tf
from rbx1_nav.transform_utils import quat_to_angle
#from math import radians, copysign, sqrt, pow, pi
import roslib
import math
from sensor_msgs.msg import LaserScan
from std_msgs.msg import String





########################## laser listener ######################
class ObstacleDetector():

 def __init__(self):

  print "establishing laser_obstacle node"
  rospy.init_node('laser_obstacle_detector5')

  #listen to laser sensor
  print "subscribing to laser scanning"
  rospy.Subscriber('scan', LaserScan, self.scan_callback)
  rospy.spin()
  print "procceed done"

############### Comparing distance #########################
 def CompareDistance(self,data1, data2):

  #print "start calculate distance"
  close=0
  far=0
  normal=0
  i=data1
  while (data1-1)<i<data2 and not rospy.is_shutdown():
   if self.ranges[i] < 1 or math.isnan(self.ranges[i]):
    close+=1
   elif self.ranges[i] > 8.0:
    far+=1
   else:
    normal+=1
   i+=1
  #print "distance calculation is done"
  return close,far,normal

################# laser callback #######################
 def scan_callback(self, scan):
  #print "calculating obstacle dirction liklihood"
  self.ranges=scan.ranges

  #compare the right range data fingerout it's closing weight right
  close_num,far_num,normal_num=self.CompareDistance(0,len(self.ranges)/4)

  if close_num>=normal_num and close_num >= far_num:
   self.rweight=1
  else:
   self.rweight=0
  #compare the middle range data fingerout it's closing weight middle
  close_num,far_num,normal_num=self.CompareDistance(int(len(self.ranges)/4),int(len(self.ranges)/2))
  if close_num>=normal_num and close_num >= far_num:
   self.mweight=1
  else:
   self.mweight=0
  #compare the left range data fingerout it's closing weight left
  close_num,far_num,normal_num=self.CompareDistance(int(len(self.ranges)/2),int((3*len(self.ranges))/4))
  if close_num>=normal_num and close_num >= far_num:
   self.lweight=1
  else:
   self.lweight=0
  #print "calcultion of obstacle dirction liklihood is done"
  #print "right %d, middle %d, left %d"%(self.rweight,self.mweight,self.lweight)

  # running obsatcle warning staff   
  self.warning=ObstacleWarning()
  self.warning.WarningPub(self.rweight,self.mweight,self.lweight)  

######################## obstacle warning module #########################
class ObstacleWarning():
############################ main ###########################3
 def WarningPub(self,right_weight,middle_weight,left_weight):
  #print "establishing laser_obstacle node"
  #publishing a obsatcle warning for robot
  self.right_weight=right_weight
  self.middle_weight=middle_weight
  self.left_weight=left_weight

  # justify the position of obstacles throw ObstacleAnalyse
  #print "justify the position of obstacles"  
  if self.ObstacleAnalyse(self.right_weight,self.middle_weight,self.left_weight)=='RightWarning':
   ObstacleWarn='RightObstacle'

  elif self.ObstacleAnalyse(self.right_weight,self.middle_weight,self.left_weight)=='MiddleWarning':
   ObstacleWarn='MiddleObstacle'

  elif self.ObstacleAnalyse(self.right_weight,self.middle_weight,self.left_weight)=='LeftWarning':
   ObstacleWarn='LeftObstacle'

  elif self.ObstacleAnalyse(self.right_weight,self.middle_weight,self.left_weight)=='LeftDanger':
   ObstacleWarn='LeftDanger'
  
  elif self.ObstacleAnalyse(self.right_weight,self.middle_weight,self.left_weight)=='RightDanger':
   ObstacleWarn='RightDanger'  

  elif self.ObstacleAnalyse(self.right_weight,self.middle_weight,self.left_weight)=='AllClear':
   ObstacleWarn='AllClear'

  elif self.ObstacleAnalyse(self.right_weight,self.middle_weight,self.left_weight)=='num':
   ObstacleWarn='FrontDanger'

  else:
   ObstacleWarn='AllClear'

  self.SlamSol5=SlamActionSol5()
  self.SlamSol5.AvoidAction(ObstacleWarn)
############### Obstacle Position Analysing  #########################
 def ObstacleAnalyse(self,right,middle,left):
  #print "obstacle analyse"
  #analysis obstacles postion likihood
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
  #print "obstacle analyse is done"

########################### forword test ##########################3
class SlamActionSol5():
 def AvoidAction(self,info):
  self.info=info
  # Publisher to control the robot's speed in real robot
  #self.cmd_vel = rospy.Publisher('/cmd_vel_mux/input/navi', Twist, queue_size=5)
  rate = 40      
  # Set the equivalent ROS rate variable
  r = rospy.Rate(rate)
  LoopNum =  50
  self.linear_speed = 0.2  
  # Set the rotation speed in rad/s
  self.angular_speed = 0.1
  self.move_cmd = Twist()     
 ## running loop for forwarding         
  # Loop once for each leg of the trip
  print "system starting running" 
  for i in range(LoopNum):                  
   # moving forward
   if self.info=='RightObstacle':
    self.Actionmodel(self.linear_speed, self.angular_speed)

   elif self.info=='MiddleObstacle':
    self.Actionmodel(self.linear_speed, self.angular_speed)

   elif self.info=='LeftObstacle':
    self.Actionmodel(self.linear_speed, (0-self.angular_speed))

   elif self.info=='LeftDanger':
    self.Actionmodel(self.linear_speed, (0-2*self.angular_speed))

   elif self.info=='RightDanger':
    self.Actionmodel(self.linear_speed, (2*self.angular_speed))

   elif self.info=='AllClear':
    self.Actionmodel(self.linear_speed, 0)
 
   elif self.info=='FrontDanger':
    self.Actionmodel((self.linear_speed-0.1), (2*self.angular_speed))

   else:
    self.Actionmodel(self.linear_speed, 0)
  

##################### Obstacle Avoidance Action module#####################
 def Actionmodel(self,forwordsp,turnsp):
  #print "Abstacle Avoidance Model"
 
  self.cmd_vel = rospy.Publisher('/cmd_vel_mux/input/navi', Twist, queue_size=10)
  if self.info != 'AllClear':
   self.move_cmd.linear.x = forwordsp-0.1
   self.move_cmd.angular.z = turnsp
   self.cmd_vel.publish(self.move_cmd)
   print "%s"%self.info
  if self.info == 'AllClear':
   self.move_cmd.angular.z = 0
   self.move_cmd.linear.x = self.linear_speed
   self.cmd_vel.publish(self.move_cmd)
  return


############################ main ###########################3

if __name__=='__main__':
 try:
  print "initialization system"
  ObstacleDetector()
  print "process done and quit"
 except rospy.ROSInterruptException:
  rospy.loginfo("laser_listener node terminated.")

        
