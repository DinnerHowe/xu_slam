#!/usr/bin/env python
""" 
- Version 1.0 2015/9/28

this code was written to start slam actions.

working for simulation.9/28

this code was Written for testing (fail)
    

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
  
 def nav_visualize(self):
  argue='roslaunch turtlebot_rviz_launchers view_navigation.launch --screen'
  self.nav_visualize=subprocess.call('%s'%argue,shell=True)

 def savemap(self,count):
  self.savemap=subprocess.call('rosrun map_server map_saver -f ~/maps/map_slam_%d'%count,shell=True)

 def exportmap(self,num):
  argue='export TURTLEBOT_MAP_FILE= ~/maps/map_%d.yaml'%num
  self.exportmap=subprocess.call('%s'%argue,shell=True)

 def mapdata(self):
  os.system('cd ~/xu_slam\n rosrun utils map_sub.py')# for development
  #os.system('cd ~/slam\n rosrun utils map_sub.py')# for installation
  #return distance

 def buildmap(self):
  self.Gmapping=subprocess.Popen('roslaunch turtlebot_navigation gmapping_demo.launch',shell=True)


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
  #print 'settingpose\n',settingpose
  return settingpose

 def action(self,argue):
  self.twist=subprocess.Popen('%s'%argue,shell=True)
  rospy.sleep(6)
  #self.twist.terminate()
  self.twist.kill()

 def initial(self,Sframe_id,distance):
  self.Sposition=[distance,0.0,0.0]
  self.Sorientation=[0.0,0.0,0.0,1.0]
  goalpose=self.params(Sframe_id,self.Sorientation,self.Sposition)
  argue=self.command(goalpose)
  self.action(argue)

 def scan(self,Sframe_id,i,distance): #angular in rad from -pi~+pi
  #while not rospy.is_shutdown():
  for n in range (0, int(i*10), int(pi/4*10)):
   print 'n',n
   angular=normalize_angle(n/10.0)
   print 'angular:',angular

   self.Sposition=[distance,0.0,0.0]
   self.Sorientation=[0.0,0.0,angular,1.0]
   print 'self.Sorientation:%s \n,self.Sposition:%s\n'%(self.Sorientation,self.Sposition)

   goalpose=self.params(Sframe_id,self.Sorientation,self.Sposition)
   print 'goalpose\n',goalpose
   argue=self.command(goalpose)
   self.action(argue)

 def slam(self):

  #self.buildmap()
  #rospy.sleep(5)
  #self.buildmap.kill()

  self.initial(self.Sframe_id,self.distance) # went to next original position

  self.scan(self.Sframe_id,2*pi,self.distance)

  self.savemap(self.mapnum)
  #self.savemap.kill()

  self.mapdata()
  self.exportmap(self.mapnum)
  #self.exportmap.kill()


  self.nav_visualize()
  rospy.sleep(5)
  #self.nav_visualize.kill()

  self.mapnum+=1  
  self.distance+=0.1
  self.initial(self.Sframe_id,self.distance) # went to next original position

 def __init__(self):
  try:
   self.mapnum=0
   self.distance=0.0
   self.Sframe_id='map'
   rospy.init_node('slam_solution_1')
   for i in range(1):
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
