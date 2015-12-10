#!/usr/bin/env python
""" 
- Version 1.0 2015/9/24

this code was written to start slam actions.

this code was Written for testing
    

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""
import rospy
import os
import subprocess
from math import pi
from transform_utils import normalize_angle

class slam():

 def command(self,robotpose):

  self.position=robotpose['position']
  print 'self.position:',self.position
  self.orientation=robotpose['orientation']
  print 'self.orientation',self.orientation
  self.frameid=robotpose['frame_id']
  print 'self.frameid',self.frameid
  self.pose='{ header: {stamp: now, frame_id: "%s"}, pose: { position: %s, orientation: %s}}' %(self.frameid,self.position, self.orientation)
  self.comm= 'rostopic pub /move_base_simple/goal geometry_msgs/PoseStamped "%s"'%self.pose
  print 'self.command:\n',self.comm
  return self.comm

 def buildmap(self):
  self.Gmapping=subprocess.Popen('roslaunch turtlebot_bringup minimal.launch',shell=True)
  rospy.sleep(10)
  self.Gmapping=subprocess.Popen('roslaunch turtlebot_navigation gmapping_demo.launch',shell=True)
  rospy.sleep(10)
  self.visualize=subprocess.Popen('roslaunch turtlebot_rviz_launchers view_navigation.launch',shell=True)
  rospy.sleep(5)

 def savemap(self,count):
  self.Gmapping=subprocess.call('rosrun map_server map_saver -f ~/maps/map_%d'%count,shell=True)

 def params(self,Sframe_id,Sorientation,Sposition):
  frameid=Sframe_id
  px=Sposition[0]
  py=Sposition[1]
  pz=Sposition[2]
  ox=Sorientation[0]
  oy=Sorientation[1]
  oz=Sorientation[2]
  ow=Sorientation[3]

  settingpose={'frame_id':frameid,'position':'{ x: %f, y: %f, z: %f}'%(px,py,pz),'orientation':'{ x: %f, y: %f, z: %f, w: %f }'%(ox,oy,oz,ow)}
  print 'settingpose\n',settingpose
  return settingpose

 def action(self,argue):
  self.twist=subprocess.Popen('%s'%argue,shell=True)
  rospy.sleep(2)
  self.twist.terminate()
  self.twist.kill()

 def initial(self,Sframe_id,distance):
  self.Sposition=[distance,0.0,0.0]
  self.Sorientation=[0.0,0.0,0.0,1.0]
  goalpose=self.params(Sframe_id,self.Sorientation,self.Sposition)
  argue=self.command(goalpose)
  self.action(argue)

 def scan(self,Sframe_id):
  i=0.0
  while not rospy.is_shutdown():
   self.Sposition=[0.0,0.0,0.0]
   angular=normalize_angle(i)
   self.Sorientation=[0.0,0.0,angular,1.0]
   print 'self.Sorientation: ',self.Sorientation
   goalpose=self.params(Sframe_id,self.Sorientation,self.Sposition)
   print 'goalpose\n',goalpose
   argue=self.command(goalpose)
   self.action(argue)
   print '############\n  i:',i
   print 'angular:',angular
   i+=pi/18
   if 0>angular>-0.05:
    break

 def forward(self,Sframe_id,distance):
  self.Sposition=[distance,0.0,0.0]
  self.Sorientation=[0.0,0.0,0.0,1.0]
  goalpose=self.params(self.Sframe_id,self.Sorientation,self.Sposition)
  argue=self.command(goalpose)
  self.action(argue)

 def slam(self):
  rospy.init_node('slam_solution_1')
  distance=0
  self.Sframe_id='map'

  self.buildmap()
  self.initial(self.Sframe_id,distance)
  self.scan(self.Sframe_id)
  self.Gmapping.kill()
  self.visualize.kill()
  self.savemap(self.mapnum)
  self.mapnum+=1

  subdistance=1.0
  self.forward(self.Sframe_id,subdistance)
  distance+=subdistance
  self.initial(self.Sframe_id,distance)
  self.Gmapping.kill()
  self.visualize.kill()
  self.savemap(self.mapnum)
  self.mapnum+=1



 def __init__(self):
  try:
   self.mapnum=0
   self.slam()
  except rospy.ROSInterruptException:
   pass

if __name__=='__main__':
 try:
  print "initialization system"
  slam()
  print "process done and quit"
 except rospy.ROSInterruptException:
  rospy.loginfo("slam_main node terminated.")
