#!/usr/bin/env python
""" 
- Version 4.0 2015/09/17

this is a base_scan_action module for SLAM

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

class SlamActionSol1():

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
  # Set the movement command to forward motion
  move_cmd.linear.x = linear_speed 
  # Enter the loop to move along a side
  while distance < goal_distance and not rospy.is_shutdown():

   # Publish the Twist message and sleep 1 cycle         
   self.cmd_vel.publish(move_cmd)                
    
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
   rospy.sleep(1)           
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
  rospy.sleep(1) 
  
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
  rospy.sleep(1)

 def __init__(self):
  print "system preparing"
######################## initial setting#######################
  # Give the node a name
  rospy.init_node('base_action', anonymous=False)
  # Set rospy to execute a shutdown function when exiting       
  rospy.on_shutdown(self.shutdown)
  # Publisher to control the robot's speed in real robot
  self.cmd_vel = rospy.Publisher('/cmd_vel_mux/input/teleop', Twist, queue_size=5)         
  # How fast will we update the robot's movement?
  rate = 40      
  # Set the equivalent ROS rate variable
  r = rospy.Rate(rate)        
  # Set the forward linear speed to 0.2 meters per second 
  global linear_speed 
  linear_speed = 0.3        
  # Set the travel distance in meters
  global travel_distance
  travel_distance = 10.0
  # Set the rotation speed in radians per second
  #global angular_speed 
  #angular_speed = 1.0       
  # Set the angular tolerance in degrees converted to radians
  global angular_tolerance
  angular_tolerance = radians(2.5)       
  # Create the tf listener
  self.tf_listener = tf.TransformListener()       
  # Give tf some time to fill its buffer
  rospy.sleep(1)       
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
         
   #set up sub_goal0 and speed
   sub_goal_angle = pi/2.0
   AngularSpeed=pi/4
   #turn to sub goal0           
   self.TurnAngle(sub_goal_angle,AngularSpeed)             
   # Stop the robot before the next action
   self.StopRobot() 

   #set up sub_goal1 and speed
   sub_goal_angle = -pi/2.0
   AngularSpeed=sub_goal_angle/pi
   #turn to sub goal1 and speed          
   self.TurnAngle(sub_goal_angle,AngularSpeed)                
   # Stop the robot before the next action
   self.StopRobot()

   #set up sub_goal2 and speed
   sub_goal_angle = -pi/2.0
   AngularSpeed=sub_goal_angle/pi
   #turn to sub goal2 and speed          
   self.TurnAngle(sub_goal_angle,AngularSpeed)                
   # Stop the robot before the next action
   self.StopRobot() 

   #setting sub_goal3 and speed
   sub_goal_angle =pi/2.0
   AngularSpeed=sub_goal_angle/pi
   #turn to sub goal3
   self.TurnAngle(sub_goal_angle,AngularSpeed)             
   # Stop the robot before the next action
   self.StopRobot()      
   move_cmd = Twist()
#################### go forward #######################                    

   # setting subgoal and moving forward
   sub_goal_distance = 2
   # moving forward
   self.MoveForward(sub_goal_distance)   
   # Stop the robot before the next action
  
            
  # Stop the robot for good
  self.cmd_vel.publish(Twist())
        

 
if __name__ == '__main__':
 try:
  SlamActionSol1()
  print "done"
 except:
  rospy.loginfo("base_action node terminated.")
        
