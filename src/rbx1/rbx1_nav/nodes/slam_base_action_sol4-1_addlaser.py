#!/usr/bin/env python
""" slam_base_action_sol1.py 

- Version 3.4 2015/7/31

this is base_scan_action module 4 for SLAM

one node method 

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
from math import radians, copysign, sqrt, pow, pi
import roslib
import math
from sensor_msgs.msg import LaserScan
from std_msgs.msg import String

##################### Obstacle Avoidance Action #####################

class AbstacleAvoidance():
 print "Abstacle Avoidance Model"
 def Actionmodel(self,forwordsp,turnsp,info):
  print "Abstacle Avoidance Model"
  
  self.cmd_vel = rospy.Publisher('/cmd_vel_mux/input/navi', Twist, queue_size=5)
  while info != 'AllClear':
   move_cmd.linear.x = forwordsp-0.1
   move_cmd.angular.z = turnsp
   self.cmd_vel.publish(move_cmd)
   if info == 'AllClear':
    move_cmd.angular.z = 0
    move_cmd.linear.x = linear_speed
    self.cmd_vel.publish(move_cmd)
    return



 def AvoidanceAction(self, info):
  print "Abstacle Avoidance Action "
  global linear_speed 
  linear_speed = 0.2  
  # Set the rotation speed in rad/s
  global angular_speed 
  angular_speed = 1.0  
  if info=='RightObstacle':
   self.Actionmodel(linear_speed, angular_speed, info)

  elif info=='MiddleObstacle':
   self.Actionmodel(linear_speed, angular_speed, info)

  elif info=='LeftObstacle':
   self.Actionmodel(linear_speed, 0-angular_speed, info)

  elif info=='LeftDanger':
   self.Actionmodel(linear_speed, 0-angular_speed, info)

  elif info=='RightDanger':
   self.Actionmodel(linear_speed, angular_speed, info)

  elif info=='AllClear':
   self.Actionmodel(linear_speed, 0, info)

  elif info=='FrontDanger':
   self.Actionmodel(linear_speed, angular_speed, info)

  else:
   self.Actionmodel(linear_speed, 0, info)
############################ Obstacle Warning #########################

class ObstacleWarning():
 print "obstacle warning"
############### Obstacle Position Analysing (Laser) #########################

 def ObstacleAnalyse(self,right,middle,left):
  #print "obstacle analyse"
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
############################ main ###########################3
 def WarningPub(self,right_weight,middle_weight,left_weight):
  print "establishing laser_obstacle node"

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
   ObstacleWarn='FrontClear'

  # show pub info on screen
  rospy.loginfo(ObstacleWarn)

  # launch a auto-avoidance action
  cmd_avoid=AbstacleAvoidance()
  cmd_avoid.AvoidanceAction(ObstacleWarn)



########################## laser listener ######################
class ObstacleDetector():
 print "obstacle detector"
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
  print "scan callback"
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
  #print "calcultion of obstacle dirction liklihood is done"

  # send a warnig to robot
  print "right %d, middle %d, left %d"%(self.rweight,self.mweight,self.lweight)
 
  #take a warning for robot  
  warning=ObstacleWarning()
  warning.WarningPub(self.rweight,self.mweight,self.lweight)  
  
########################## main ########################### 
 def LaserDetector(self):
  #print "establishing laser_obstacle node"
  #rospy.init_node('laser_obstacle_detector')
  #listen to laser sensor
  print "subscribing to laser scanning"
  rospy.Subscriber('scan', LaserScan, self.scan_callback)
  rospy.spin()
  #print "procceed done"



class SlamActionSol4_1():
 print "slam action solution 4_1"
#################### normalize angel ##########################
 def NormalizeAngle(self, angle):
  res = angle
  while res > pi:
   res -= 2.0 * pi
  while res < -pi:
   res += 2.0 * pi
  return res

#################### Moving Forward ##########################
 def MoveForward(self, goal_distance):
  
  print "start going forward"

  # Get the starting position values     
  (position, rotation) = self.get_odom()                     
  x_start = position.x
  y_start = position.y            
  # Keep track of the distance traveled
  distance = 0

  # Enter the loop to move along a side
  while distance < goal_distance and not rospy.is_shutdown():
   # Set the movement command to forward motion
   move_cmd.linear.x = linear_speed 

   # AUTO detection and avoidance
   self.detector=ObstacleDetector()
   self.detector.LaserDetector()


   # Publish the Twist message and sleep 1 cycle         
   self.cmd_vel.publish(move_cmd)                
   #rospy.sleep(1)   
   
   # Get the current position
   (position, rotation) = self.get_odom()
                
   # Compute the Euclidean distance from the start
   distance = sqrt(pow((position.x-x_start),2)+pow((position.y-y_start),2))
 
  #return distance
  print "finish forwarding distance:%s"% distance

#################### Turning Angle ##########################
 def TurnAngle(self, goal_angle,turn_speed):
  print "start turning"
  # Get the current rotation
  (position, rotation) = self.get_odom()    
  # Set the movement command to a rotation
  move_cmd.angular.z = turn_speed
  print "turnnig speed: %s"%turn_speed
  # Track how far we have turned
  turn_angle = 0
  # Track the last angle measured
  last_angle = rotation
  while abs(turn_angle) < abs(goal_angle) and not rospy.is_shutdown():
   # Publish the Twist message and sleep 1 cycle         
   self.cmd_vel.publish(move_cmd)
   #rospy.sleep(1)           
   # Get the current rotation
   (position, rotation) = self.get_odom()           
   # Compute the amount of rotation since the last loop
   delta_angle = self.NormalizeAngle(rotation - last_angle)              
   # Add to the running total
   turn_angle += delta_angle
   last_angle = rotation
  #return last_angle
  print "finish turning last angular:%s"% last_angle
  
  
#################### Get Odom ##########################
 def get_odom(self):
  # Get the current transform between the odom and base frames
  try:
   (trans,rot)=self.tf_listener.lookupTransform(self.odom_frame, self.base_frame, rospy.Time(0))
  except (tf.Exception, tf.ConnectivityException, tf.LookupException):
   rospy.loginfo("TF Exception")
   return
  return (Point(*trans), quat_to_angle(Quaternion(*rot)))
        
#################### Shutting Down ##########################
 def shutdown(self):
  # Always stop the robot when shutting down the node.
  rospy.loginfo("Stopping the robot...")
  self.cmd_vel.publish(Twist())
  #rospy.sleep(1)

 def __init__(self):
  print "system preparing"
######################## initial setting#######################
  # Give the node a name
  rospy.init_node('slam_base_action4-1', anonymous=False)
  # Set rospy to execute a shutdown function when exiting       
  rospy.on_shutdown(self.shutdown)
  # Publisher to control the robot's speed in real robot
  self.cmd_vel = rospy.Publisher('/cmd_vel_mux/input/navi', Twist, queue_size=10)
  print "node was established"

  # Publisher to control the robot's speed in sim robot
  #self.cmd_vel = rospy.Publisher('/cmd_vel', Twist, queue_size=5)         
  # How fast will we update the robot's movement?
  rate = 40      
  # Set the equivalent ROS rate variable
  r = rospy.Rate(rate)        
  # Set the forward linear speed to 0.2 meters per second 
  global linear_speed 
  linear_speed = 0.2  
  # Set the rotation speed in rad/s
  global angular_speed 
  angular_speed = 1.0       
  # Set the travel distance in meters
  global travel_distance
  travel_distance = 10.0
     
  # Set the angular tolerance in degrees converted to radians
  global angular_tolerance

  angular_tolerance = radians(2.5)
  print "test"
  print "parameter setting is done"       
  # Create the tf listener
  self.tf_listener = tf.TransformListener()       
  # Give tf some time to fill its buffer
  rospy.sleep(0.1)       
  
  # Set the odom frame
  self.odom_frame = '/odom'
      
  # Find out if the robot uses /base_link or /base_footprint
  try:
   self.tf_listener.waitForTransform(self.odom_frame, '/base_footprint', rospy.Time(), rospy.Duration(1.0))
   self.base_frame = '/base_footprint'
  except (tf.Exception, tf.ConnectivityException, tf.LookupException):
   try:
    self.tf_listener.waitForTransform(self.odom_frame, '/base_link', rospy.Time(), rospy.Duration(1.0))
    self.base_frame = '/base_link'
   except (tf.Exception, tf.ConnectivityException, tf.LookupException):
    rospy.loginfo("Cannot find transform between /odom and /base_link or /base_footprint")
    rospy.signal_shutdown("tf Exception") 
        
  # Initialize the position variable as a Point type
  position = Point()

  print "system starting running"
  LoopNum=int(travel_distance/2.0)
##################### running loop #############################            
  # Loop once for each leg of the trip
  for i in range(LoopNum):
   # Initialize the movement command
   global move_cmd
   move_cmd = Twist()
   print "turning for checking"
####################### turning #######################            
         
   """#set up sub_goal0 and speed
   sub_goal_angle = pi/2.0
   angular_speed=pi/4
   #turn to sub goal0           
   self.TurnAngle(sub_goal_angle,angular_speed)             
   # Stop the robot before the next action
   #self.shutdown() 

   #set up sub_goal1 and speed
   sub_goal_angle = -pi/2.0
   angular_speed=sub_goal_angle/pi
   #turn to sub goal1 and speed          
   self.TurnAngle(sub_goal_angle,angular_speed)                
   # Stop the robot before the next action
   #self.shutdown()

   #set up sub_goal2 and speed
   sub_goal_angle = -pi/2.0
   angular_speed=sub_goal_angle/pi
   #turn to sub goal2 and speed          
   self.TurnAngle(sub_goal_angle,angular_speed)                
   # Stop the robot before the next action
   #self.shutdown() 

   #setting sub_goal3 and speed
   sub_goal_angle =pi/2.0
   angular_speed=sub_goal_angle/pi
   #turn to sub goal3
   self.TurnAngle(sub_goal_angle,angular_speed)             
   # Stop the robot before the next action
   #self.shutdown()      
   #move_cmd = Twist()"""
#################### go forward #######################                    

   # setting subgoal and moving forward
   sub_goal_distance = 3
   # moving forward
   self.MoveForward(sub_goal_distance)   
   # Stop the robot before the next action
   rospy.spin()
            
  # Stop the robot for good
  #self.cmd_vel.publish(Twist())

 
if __name__ == '__main__':
 try:
  SlamActionSol4_1()
  print "done"
  
 except:
  rospy.loginfo("slam_base_action node terminated.")
     
     
