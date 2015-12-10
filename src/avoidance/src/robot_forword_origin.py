#!/usr/bin/env python
""" 

- Version 1.0 2015/23/09

this is the motion module 
    
Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""
import rospy
from laser.msg import warning
from geometry_msgs.msg import Twist
import math

class Forward():
 def __init__(self):

  print "robot standby node"
  rospy.init_node('robot_forward',anonymous=True)
  #listen to laser_listener
  print "subscribing to obstacle detector"
  rospy.Subscriber('laser_sensor/warning', warning, self.ForwardAction)
  rospy.spin()
  print "procceed done"

 def ForwardAction(self,info):
  self.info=info.warning
  LoopNum =  10
  # set the speed in meter/s
  self.linear_speed = 0.1  
  # Set the rotation speed in rad/s
  self.angular_speed = 0.2

 # running loop for forwarding  Loop once for each leg of the trip
  print "system starting running" 
  for i in range(LoopNum):  

   print self.info      
         
   # moving forward
   if self.info=='RightWarning':
    self.speed=self.linear_speed
    self.angular=self.angular_speed
    self.Actionmodel(self.speed, self.angular, self.info)

   elif self.info=='RightDanger':
    self.speed=self.linear_speed
    self.angular=2*self.angular_speed
    self.Actionmodel(self.speed, self.angular, self.info)

   elif self.info=='RightHDanger':
    self.speed=self.linear_speed/2
    self.angular=3*self.angular_speed
    self.Actionmodel(self.speed, self.angular, self.info)

   elif self.info=='LeftHDanger':
    self.speed=self.linear_speed/2
    self.angular=-3*self.angular_speed
    self.Actionmodel(self.speed, self.angular, self.info)

   elif self.info=='LeftDanger':
    self.speed=self.linear_speed
    self.angular=-2*self.angular_speed
    self.Actionmodel(self.speed, self.angular, self.info)

   elif self.info=='LeftWarning':
    self.speed=self.linear_speed
    self.angular=-self.angular_speed
    self.Actionmodel(self.speed, self.angular, self.info)

   elif self.info=='AllClear':
    self.speed=self.linear_speed
    self.angular=0
    self.Actionmodel(self.speed, self.angular, self.info)

   elif self.info=='FrontObstacle':
    self.speed=0-self.linear_speed
    self.angular=math.pi/2
    self.Actionmodel(self.speed, self.angular, self.info)

   elif self.info=='Unknown':
    self.speed=self.linear_speed/2
    self.angular=math.pi/4
    self.Actionmodel(self.speed, self.angular, self.info)

   else:
    self.speed=self.linear_speed/2
    self.angular=0
    self.Actionmodel(self.speed, self.angular, self.info)

##################### Obstacle Avoidance Action module#####################
 def Actionmodel(self,forwordsp,turnsp,EnvWarn):
  print "Abstacle Avoidance Model"
  print forwordsp,turnsp,EnvWarn
  print type(forwordsp),type(turnsp),type(EnvWarn)

  self.EnvWarn=EnvWarn
  self.move_cmd= Twist()  
  self.cmd_vel = rospy.Publisher('/cmd_vel_mux/input/teleop', Twist, queue_size=10)

  if self.EnvWarn != 'AllClear' and self.EnvWarn != 'FrontObstacle' and self.EnvWarn != 'Unknown':
   self.move_cmd.linear.x = forwordsp
   self.move_cmd.angular.z = turnsp
   self.cmd_vel.publish(self.move_cmd)
  else:
   if self.EnvWarn == 'AllClear':
    self.move_cmd.linear.x = forwordsp
    self.move_cmd.angular.z = turnsp
    self.cmd_vel.publish(self.move_cmd)
   else:
    if self.EnvWarn == 'FrontObstacle' and self.EnvWarn == 'Unknown':
     self.move_cmd.linear.x = forwordsp
     self.move_cmd.angular.z = turnsp
     self.cmd_vel.publish(self.move_cmd)
    else:
     if self.EnvWarn=='Unkown':
      self.move_cmd.linear.x = forwordsp
      self.move_cmd.angular.z = turnsp
      self.cmd_vel.publish(self.move_cmd)
     else:
      self.move_cmd.linear.x = forwordsp
      self.move_cmd.angular.z = turnsp
      self.cmd_vel.publish(self.move_cmd)

  return
############################ main ###########################3

if __name__=='__main__':
 try:
  print "initialization system"
  Forward()
  print "process done and quit"
 except rospy.ROSInterruptException:
  rospy.loginfo("robot forward node terminated.")
