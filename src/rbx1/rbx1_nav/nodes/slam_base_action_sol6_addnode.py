#!/usr/bin/env python
""" slam_base_action_sol1.py 

- Version 6.0 2015/8/4

this is base_scan_action module 6 for SLAM

two nodes method


robot would turn left 90deg first and then turn back 90deg let robot face forward. Next, robot will turn right 90deg again and back to original position followed by forwarding about 1m. also the obstacle avoidance module will be fixed in.
    

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""

import rospy
from geometry_msgs.msg import Twist, Point, Quaternion
import tf
from math import radians, copysign, sqrt, pow, pi
from std_msgs.msg import String
#from tf import TransformListener

class SlamActionSol6():

#################### normalize angel ##########################
 def NormalizeAngle(self, angle):
  res = angle
  while res > pi:
   res -= 2.0 * pi
  while res < -pi:
   res += 2.0 * pi
  return res

 ####################### action model ############################
 def Actionmodel(self,forwordsp,turnsp,info):
  print "Abstacle Avoidance Model"
  self.cmd_vel = rospy.Publisher('/cmd_vel_mux/input/navi', Twist, queue_size=10)
  while info != 'AllClear':
   move_cmd.linear.x = forwordsp-0.1
   move_cmd.angular.z = turnsp
   self.cmd_vel.publish(move_cmd)
   if info == 'AllClear':
    move_cmd.angular.z = 0
    move_cmd.linear.x = linear_speed
    self.cmd_vel.publish(move_cmd)
    return
####################### avoid action ############################
 def AvoideAction(self, info):
  print "Abstacle Avoidance Action "

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

#################### Get Odom ##########################
 def get_odom(self):
  print "get odom"
  #self.tf_listener = tf.TransformListener()
  # listen to TF
  print "listen to TF"
  try:
   trans,rot=self.tf_listener.lookupTransform('/odom','/base_footprint',rospy.Time(0))
  except(tf.Exception, tf.ConnectivityException, tf.LookupException)"
   return
  print "Point, quat_to_angle "
  return (Point(*trans), quat_to_angle(Quaternion(*rot)))  

#################### Moving Forward ##########################
 def MoveForward(self, goal_distance):
  
  print "start going forward"
  # Get the starting position values     
  (position, rotation) = self.get_odom()                     
  x_start = position.x
  y_start = position.y            
  # Keep track of the distance traveled
  distance = 0
  # Set the movement command to forward motion
  move_cmd.linear.x = linear_speed 

  # Enter the loop to move along a side
  while distance < goal_distance and not rospy.is_shutdown():

   # Publish the Twist message and sleep 1 cycle         
   self.cmd_vel.publish(move_cmd)
                
   # listen to laser obstacle warning
   rospy.Subscriber('laser_obstacle_warning',String, AvoideAction)     
   # Get the current position
   (position, rotation) = self.get_odom()
                
   # Compute the Euclidean distance from the start
   distance = sqrt(pow((position.x-x_start),2)+pow((position.y-y_start),2))

  #return distance
  print "finish forwarding distance:%s"% distance

#################### Turning Angle ##########################
 def TurnAngle(self, goal_angle,turn_speed):
  print "start turning"
   
  # Set the movement command to a rotation
  move_cmd.angular.z = turn_speed
  print "turnnig speed: %s"%turn_speed
  # Track how far we have turned
  turn_angle = 0
  # Track the last angle measured
  (position, rotation) = self.get_odom()
  last_angle = rotation
  while abs(turn_angle) < abs(goal_angle) and not rospy.is_shutdown():
   # Publish the Twist message and sleep 1 cycle         
   self.cmd_vel.publish(move_cmd)
        
   # Get the current rotation
   (position, rotation) = self.get_odom()           
   # Compute the amount of rotation since the last loop
   delta_angle = self.NormalizeAngle(rotation - last_angle)              
   # Add to the running total
   turn_angle += delta_angle
   last_angle = rotation
  #return last_angle
  print "finish turning last angular:%s"% last_angle
  

#################### stop #######################               
 def StopRobot(self):
  print "stop"
  # Stop the robot before the next action
  move_cmd = Twist()
  self.cmd_vel.publish(move_cmd)
       
#################### Shutting Down ##########################
 def shutdown(self):
  # Always stop the robot when shutting down the node.
  rospy.loginfo("Stopping the robot...")
  self.cmd_vel.publish(Twist())


######################### main ########################3
 def __init__(self):
  print "system preparing"
######################## initial setting#######################
  rospy.init_node('slam_base_action', anonymous=False)
  self.cmd_vel = rospy.Publisher('/cmd_vel_mux/input/navi', Twist, queue_size=5)
  # Publisher to control the robot's speed in sim robot
  #self.cmd_vel = rospy.Publisher('/cmd_vel', Twist, queue_size=5)
         
  # Set the equivalent ROS rate variable
  rate = 40
  r = rospy.Rate(rate)        
  # Set the forward linear speed in m/s
  global linear_speed 
  linear_speed = 0.1        
  # Set the rotation speed in rad/s
  global angular_speed 
  angular_speed = 1.0 
  # Set the travel distance in meters
  global travel_distance
  travel_distance = 10.0      
  # Set the angular tolerance in degrees converted to radians
  global angular_tolerance
  angular_tolerance = radians(1)    
  self.tf_listener = tf.TransformListener()
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
  ### running loop 
  print "system starting running"
  LoopNum=int(travel_distance/2.0)           
  # Loop once for each leg of the trip
  for i in range(LoopNum):
   # Initialize the movement command
   global move_cmd
   move_cmd = Twist()
   print "turning for checking"
   ### turning                     
   #set up sub_goal0 and speed
   sub_goal_angle = pi/2.0
   #turn to sub goal0           
   self.TurnAngle(sub_goal_angle,angular_speed)             
   # Stop the robot before the next action
   #self.StopRobot() 

   #set up sub_goal1 and speed
   sub_goal_angle = -pi/2.0
   #turn to sub goal1 and speed          
   self.TurnAngle(sub_goal_angle,angular_speed)                
   # Stop the robot before the next action
   #self.StopRobot()

   #set up sub_goal2 and speed
   sub_goal_angle = -pi/2.0
   #turn to sub goal2 and speed          
   self.TurnAngle(sub_goal_angle,angular_speed)                
   # Stop the robot before the next action
   #self.StopRobot() 

   #setting sub_goal3 and speed
   sub_goal_angle =pi/2.0
   #turn to sub goal3
   self.TurnAngle(sub_goal_angle,angular_speed)             
   # Stop the robot before the next action
   #self.StopRobot()      
   self.cmd_vel.publish(Twist())


   ### go forward 
   # setting subgoal and moving forward
   sub_goal_distance = 2
   # moving forward
   self.MoveForward(sub_goal_distance)   
   # Stop the robot before the next action
              
  # Stop the robot for good
  self.cmd_vel.publish(Twist())
        

 
if __name__ == '__main__':
 try:
  SlamActionSol6()
  print "done"
 except:
  rospy.loginfo("slam_base_action node terminated.")
