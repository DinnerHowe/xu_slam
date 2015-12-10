#!/usr/bin/env python
""" speed_handle.py 

- Version 1.0 2015/9/9

this is the motion module--- handle speed linear acceleration and. 
    

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""

import rospy
from speed_handle.msg import speed
from geometry_msgs.msg import Twist

class SpeedHandle():

 def callback(self, current):
  pub = rospy.Publisher('/cmd_vel_mux/input/teleop', Twist, queue_size=5)
  self.cmd=Twist()
  self.cmd.linear.x=current[0]
  self.cmd.angular.z=current[1]
  self.steps=10 #speed will boost in 10 steps
  self.Linearacc=(self.speed.linear.x-self.cmd.linear.x)/self.steps
  self.Angularacc=(self.speed.angular.z-self.cmd.angular.z)/self.steps
  for i in range(self.steps):
   if self.speed.linear.x!=self.cmd.linear.x:
    if self.speed.angular.z!=self.cmd.angular.z:
     self.cmd.angular.x+=self.Angularacc
     self.cmd.linear.x+=self.Linearacc
     pub.publish(self.cmd)
    else:
     self.cmd.linear.x+=self.Linearacc
     pub.publish(self.cmd)

   else:
    if self.speed.angular.x==self.cmd.angular.x:
     pub.publish(self.cmd)
    else:
     self.cmd.angular.x+=self.Angularacc
     pub.publish(self.cmd)
 def Handle(self, data):
  self.speed=speed()
  self.speed=data
  rospy.loginfo(self.speed)
  self.speedarry=[[],[]]
  self.speedarry[1]=([self.speed.linear.x,self.speed.angular.z])
  if self.speedarry[0]!=self.speedarry[1]:
   self.callback(self.speedarry[1])
   self.speedarry[0]=self.speedarry[1]
  else:
   self.callback(self.speedarry[1])
   #rospy.Subscriber('/cmd_vel_mux/input/teleop', Twist, self.callback)
   #rospy.Subscriber('/cmd_vel', Twist, self.callback)

 def __init__(self):

  rospy.init_node('Speed_Handle', anonymous=True)
  rospy.Subscriber("speed", speed, self.Handle)
  rospy.spin()

#########################
##        main         ##
#########################
if __name__=='__main__':
 try:
  print "initialization system"
  SpeedHandle()
  print "process done and quit"
 except rospy.ROSInterruptException:
  rospy.loginfo("speed handle node terminated.")
