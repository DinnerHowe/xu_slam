#!/usr/bin/env python

import rospy
from geometry_msgs.msg import Twist

class twist():
 def __init__(self):
  rospy.init_node('robot_twist',anonymous=True)
  pub = rospy.Publisher('/cmd_vel_mux/input/teleop', Twist, queue_size=10)
  self.move_cmd= Twist() 
  rospy.loginfo(self.move_cmd)
  self.turnsp=0.5
  while not rospy.is_shutdown():
   self.move_cmd.angular.z =self.turnsp
   pub.publish(self.move_cmd)
   rospy.loginfo(self.move_cmd)

if __name__=='__main__':
 try:
  print "initialization system"
  twist()
  print "process done and quit"
 except rospy.ROSInterruptException:
  rospy.loginfo("robot twist node terminated.")
