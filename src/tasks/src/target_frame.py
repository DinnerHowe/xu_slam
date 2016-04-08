#!/usr/bin/env python  
#coding=utf-8

""" 2016/04/05

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""

import rospy,tf,move_reference
from nav_msgs.msg import Odometry
from geometry_msgs.msg import PointStamped

class target_frame():
 def clicked_callback(self,data):
  self.msg=data
  
 def odom_callback(self,data):
  self.odom_pose=data.pose.pose.position
  broadcaster = tf.TransformBroadcaster()
  angle=move_reference.angle_generater(self.msg.point,self.odom_pose)
  quaterion=move_reference.angle_to_quat(angle)
  broadcaster.sendTransform((self.msg.point.x,self.msg.point.y,self.msg.point.z),quaterion,rospy.Time.now(),'target_frame','map')
  print self.msg
  
 def __init__(self):
  rospy.init_node('target_tf_broadcaster')
  self.msg,self.odom_pose=PointStamped(),Odometry()
  rospy.Subscriber('/clicked_point',PointStamped,self.clicked_callback)
  rospy.Subscriber("odom",Odometry,self.odom_callback)
  rospy.spin()


if __name__ == '__main__':
 try:
  rospy.loginfo( "initialization system")
  target_frame()
  rospy.loginfo( "process done and quit")
 except rospy.ROSInterruptException:
  rospy.loginfo("follower node terminated.")
 
