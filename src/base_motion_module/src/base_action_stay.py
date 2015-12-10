#!/usr/bin/env python
""" 

- Version 5.0 2015/8/26

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
  rospy.init_node('stay')

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
  i=data1+1
  while data1<i<data2 and not rospy.is_shutdown():
   if self.ranges[i] < 0.53 or math.isnan(self.ranges[i]):
    close+=1
   else:
    normal+=1
   i+=1
  #print "distance calculation is done"
  return close,normal

################# laser callback #######################
 def scan_callback(self, scan):
  #print "calculating obstacle dirction liklihood"
  self.ranges=scan.ranges

  #compare the right range data fingerout it's closing weight right
  close_num,normal_num=self.CompareDistance(0,int(2*len(self.ranges)/5))
  if close_num > normal_num:
   self.rweight=1
  else:
   self.rweight=0
  #compare the middle range data fingerout it's closing weight middle
  close_num,normal_num=self.CompareDistance(int(1*len(self.ranges)/5),int(3*len(self.ranges)/5))
  if close_num > normal_num:
   self.mrweight=1
  else:
   self.mrweight=0
  #compare the left range data fingerout it's closing weight left
  close_num,normal_num=self.CompareDistance(int(2*len(self.ranges)/5),int(4*len(self.ranges)/5))
  if close_num > normal_num:
   self.mlweight=1
  else:
   self.mlweight=0
  close_num,normal_num=self.CompareDistance(int(3*len(self.ranges)/5),int(len(self.ranges)))
  if close_num > normal_num:
   self.lweight=1
  else:
   self.lweight=0

  # running obsatcle warning staff   
  self.warning=ObstacleWarning()
  self.warning.WarningPub(self.rweight,self.mrweight,self.mlweight,self.lweight)
  print "%d %d %d %d"%(self.rweight,self.mrweight,self.mlweight,self.lweight) 

######################## obstacle warning module #########################
class ObstacleWarning():
############################ main ###########################3
 def WarningPub(self,right_weight,middle_right_weight,middle_left_weight,left_weight):
  #print "establishing laser_obstacle node"
  #publishing a obsatcle warning for robot
  self.right_weight=right_weight
  self.middle_right_weight=middle_right_weight
  self.middle_left_weight=middle_left_weight
  self.left_weight=left_weight

  # justify the position of obstacles throw ObstacleAnalyse
  #print "justify the position of obstacles"  
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

  #elif self.ObstacleAnalyse(self.right_weight,self.middle_right_weight,self.middle_left_weight,self.left_weight)=='num0':
   #ObstacleWarn='FrontDanger'

  elif self.ObstacleAnalyse(self.right_weight,self.middle_right_weight,self.middle_left_weight,self.left_weight)=='num0':
   ObstacleWarn='FrontObstacle'

  self.SlamSol5=SlamActionSol5()
  self.SlamSol5.AvoidAction(ObstacleWarn)
############### Obstacle Position Analysing  #########################
 def ObstacleAnalyse(self,right,middler,middlel,left):
  #print "obstacle analyse"
  #analysis obstacles postion likihood
  if right==1 and middler==0 and middlel==0 and left==0 :
   return 'RightWarning'
  elif right==0 and middler==1 and middlel==0 and left==0 :
   return 'AllClear'
  elif right==0 and middler==0 and middlel==1 and left==0 :
   return 'AllClear'
  elif right==0 and middler==0 and middlel==0 and left==1 :
   return 'LeftWarning'

  elif right==1 and middler==1 and middlel==0 and left==0 :
   return 'RightDanger'
  elif right==0 and middler==1 and middlel==1 and left==0 :
   return 'AllClear'
  elif right==0 and middler==0 and middlel==1 and left==1 :
   return 'LeftDanger'
  elif right==1 and middler==0 and middlel==0 and left==1 :
   return 'AllClear'
  elif right==1 and middler==0 and middlel==1 and left==0 :
   return 'RightWarning'
  elif right==0 and middler==1 and middlel==0 and left==1 :
   return 'LeftWarning'
  
  elif right==1 and middler==1 and middlel==1 and left==0 :
   return 'RightHDanger'
  elif right==0 and middler==1 and middlel==1 and left==1 :
   return 'LeftHDanger'
  elif right==1 and middler==0 and middlel==1 and left==1 :
   return 'LeftWarning'
  elif right==1 and middler==1 and middlel==0 and left==1 :
   return 'RightWarning'

  elif right==1 and middler==1 and middlel==1 and left==1 :
   return 'num0'
  elif right==0 and middler==0 and middlel==0 and left==0 :
   return 'AllClear'



  #print "obstacle analyse is done"

########################### forword test ##########################3
class SlamActionSol5():
 def AvoidAction(self,info):
  self.info=info
  LoopNum =  50
  self.linear_speed = -0.1  
  # Set the rotation speed in rad/s
  self.angular_speed = 1   
 ## running loop for forwarding         
  # Loop once for each leg of the trip
  print "system starting running"
  for i in range(LoopNum):                
   # moving forward
   if self.info=='RightObstacle':
    self.Actionmodel(self.linear_speed, -self.angular_speed/2)

   elif self.info=='RightDanger':
    self.Actionmodel(self.linear_speed, -self.angular_speed)
 
   elif self.info=='RightHDanger':
    self.Actionmodel(self.linear_speed/2, -1.5*self.angular_speed)

   elif self.info=='LeftHDanger':
    self.Actionmodel(self.linear_speed/2, 1.5*self.angular_speed)

   elif self.info=='LeftDanger':
    self.Actionmodel(self.linear_speed, self.angular_speed)

   elif self.info=='LeftObstacle':
    self.Actionmodel(self.linear_speed, self.angular_speed/2)

   elif self.info=='AllClear':
    self.Actionmodel(0, 0)

   elif self.info=='FrontObstacle':
    self.Actionmodel(self.linear_speed, 0)
   else:
    self.Actionmodel(self.linear_speed/2, 0)
  return

##################### Obstacle Avoidance Action module#####################
 def Actionmodel(self,forwordsp,turnsp):
  #print "Abstacle Avoidance Model"
  self.move_cmd = Twist()  
  self.cmd_vel = rospy.Publisher('/cmd_vel_mux/input/teleop', Twist, queue_size=10)
  rate = 20      
  # Set the equivalent ROS rate variable
  r = rospy.Rate(rate)

  print "%s"%self.info
  if self.info != 'AllClear' and self.info != 'FrontObstacle':
   #self.move_cmd.linear.x = forwordsp
   self.move_cmd.angular.z = turnsp
   self.cmd_vel.publish(self.move_cmd)

  elif self.info == 'AllClear':
   pass

  elif self.info == 'FrontObstacle':
   self.move_cmd.angular.z = (turnsp-0.1)
   self.move_cmd.linear.x = forwordsp
   self.cmd_vel.publish(self.move_cmd)
   rospy.sleep(0.001)  
  return


############################ main ###########################3

if __name__=='__main__':
 try:
  print "initialization system"
  ObstacleDetector()
  print "process done and quit"
 except rospy.ROSInterruptException:
  rospy.loginfo("stay node terminated.")

