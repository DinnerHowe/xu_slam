#!/usr/bin/env python
#coding=utf-8
""" 
用来单键盘控制多机器的

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""
import rospy, sys, termios, tty

from geometry_msgs.msg import Twist


class multi_keybroad_handle():
 def define(self):
  rospy.init_node('multi_keyboard_teleop')
  self.first_pub = rospy.Publisher('/first_robot/cmd_vel_mux/input/teleop', Twist, queue_size = 1)
  self.second_pub = rospy.Publisher('/second_robot/cmd_vel_mux/input/teleop', Twist, queue_size = 1)
  
  self.msg = """
   Reading from the keyboard  and Publishing to Twist!
   ---------------------------
   first robot Moving around:
           i     
      j    k    l
           ,     
           
           

   ---------------------------
   second robot Moving around:
           w     
      a    s    d
           x     
           
   CTRL-C to quit
   """

  self.first_robot_control = {
		'i':(1,0,0,0),
		'j':(0,0,0,1),
		'l':(0,0,0,-1),
		'k':(0,0,0,0),
		',':(-1,0,0,0),
		
		'I':(1,0,0,0),
		'J':(0,1,0,0),
		'L':(0,-1,0,0),
		'K':(0,0,0,0)
		}
		
  self.second_robot_control = {	
		'w':(1,0,0,0),
		'a':(0,0,0,1),
		'd':(0,0,0,-1),
		'x':(-1,0,0,0),
		's':(0,0,0,0),
		
		'W':(1,0,0,0),
		'A':(0,1,0,0),
		'D':(0,-1,0,0),
		'X':(-1,0,0,0),
		'S':(0,0,0,0)
	        }

  self.first_cmd = Twist()
  self.second_cmd = Twist()

 def getKey(self):

  tty.setraw(sys.stdin.fileno())
  key = sys.stdin.read(1)
  termios.tcsetattr(sys.stdin, termios.TCSADRAIN, self.old_settings)
  return key


 def __init__(self):
  self.define()
  self.old_settings = termios.tcgetattr(sys.stdin)
  x = 0
  th = 0
  speed=0.4
  status=0
  
  try:
   print self.msg
   
   while (1):
    key = self.getKey()
    
    # first robot
    if key in self.first_robot_control.keys():
     x = self.first_robot_control[key][0]*speed
     y = self.first_robot_control[key][1]*speed
     z = self.first_robot_control[key][2]*speed
     th = self.first_robot_control[key][3]
     self.first_cmd.linear.x = x
     self.first_cmd.angular.z = th
     self.second_cmd = Twist()
     if status:
      print msg
      status = (status + 1) % 10
     
    # second robot
    if key in self.second_robot_control.keys():
     x = self.second_robot_control[key][0]*speed
     y = self.second_robot_control[key][1]*speed
     z = self.second_robot_control[key][2]*speed
     th = self.second_robot_control[key][3]
     self.second_cmd.linear.x = x
     self.second_cmd.angular.z = th
     self.first_cmd = Twist()
     if status:
      print msg
      status = (status + 1) % 10
     
    if key not in self.second_robot_control.keys() and key not in self.first_robot_control.keys():
     x = 0
     th = 0
     if (key == '\x03'):
      break
     
    self.first_pub.publish(self.first_cmd)
    self.second_pub.publish(self.second_cmd)
    self.first_cmd = Twist()
    self.second_cmd = Twist()
    
  except:
   print e

  finally:
   self.first_cmd = Twist()
   self.first_pub.publish(self.first_cmd)
   self.second_cmd = Twist()
   self.second_pub.publish(self.second_cmd)
   #termios.tcsetattr(sys.stdin, termios.TCSADRAIN, self.old_settings)
    		
if __name__=='__main__':
 try:
  print "initialization system"
  multi_keybroad_handle()
  print "process done and quit"
 except rospy.ROSInterruptException:
  rospy.loginfo("robot excel_to_coordinate node terminated.")

