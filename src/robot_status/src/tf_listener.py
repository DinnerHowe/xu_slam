#!/usr/bin/env python  
""" 

- Version 1.0 2015/9/29

this is tf listener 
    

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""

import rospy 
import tf
from geometry_msgs.msg import Quaternion, Point
from robot_status.msg import robot_odom
from math import pi
import PyKDL

class tf_listener():

 def quat_to_angle(self,quat):
  rot = PyKDL.Rotation.Quaternion(quat.x, quat.y, quat.z, quat.w)
  return rot.GetRPY()[2]
 
 def normalize_angle(self,angle):
  res = angle
  while res > pi:
   res -= 2.0 * pi
  while res < -pi:
   res += 2.0 * pi
  return res


 def frame_checker(self,frame):
  # find out robot frame
  timeout=rospy.Duration()
  wantedframe = ''
  try:
   print 'try /base_footprint'
   self.tf_listener.waitForTransform(frame, '/base_footprint',self.now,timeout)
   wantedframe='/base_footprint'
  except (tf.Exception, tf.ConnectivityException, tf.LookupException):
   try:
    print 'try /base_link'
    self.tf_listener.waitForTransform(frame, '/base_link',self.now,timeout)
    wantedframe = '/base_link'
   except (tf.Exception, tf.ConnectivityException, tf.LookupException):
    rospy.loginfo("Cannot find transform between /odom and /base_link or /base_footprint")
    rospy.signal_shutdown("tf Exception")
  print 'get wantedframe:', wantedframe
  return wantedframe

 def __init__(self):
  position=Point()
  rotation=Quaternion()
  rospy.init_node('tf_listener')
  self.pub = rospy.Publisher('robot_odom', robot_odom, queue_size=10)
  self.now=rospy.Time()
  self.tf_listener=tf.TransformListener()
  rospy.sleep(0.5)
  frame='/odom'
  wantedframe = self.frame_checker(frame)

  while not rospy.is_shutdown():
   (po,ro)=self.get_odom(frame,wantedframe)
   position.x=po[0]
   position.y=po[1]
   position.z=po[2]
   rotation.x=ro[0]
   rotation.y=ro[1]
   rotation.z=ro[2]
   rotation.w=ro[3]
   #rospy.sleep()
   self.publish(position,rotation,wantedframe)

   #print 'position: \n',position,'\n','rotation: \n',self.quat_to_angle(rotation),'time: ', self.robot_odom.header.stamp
   print self.robot_odom,'\nangular: ',self.quat_to_angle(self.robot_odom.rotation)#self.normalize_angle(self.quat_to_angle(self.robot_odom.rotation))
   
 def publish(self,position,rotation,wantedframe):
  self.robot_odom=robot_odom()
  self.robot_odom.position=position
  self.robot_odom.rotation=rotation
  self.robot_odom.header.stamp=rospy.Time.now()
  self.robot_odom.header.frame_id=wantedframe
  self.pub.publish(self.robot_odom)

 def get_odom(self,frame,wantedframe):
  try:
   (trans,rot)=self.tf_listener.lookupTransform(frame, wantedframe, self.now)
  except (tf.Exception, tf.ConnectivityException, tf.LookupException):
   rospy.loginfo("TF Exception")
   return
  return (trans,rot)

if __name__ == '__main__':
 try: 
  tf_listener()
 except rospy.ROSInterruptException:
  pass
