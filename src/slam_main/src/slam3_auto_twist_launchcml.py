#!/usr/bin/env python
""" 
- Version 1.0 2015/9/30
 
Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

rostopic pub /move_base_simple/goal geometry_msgs/PoseStamped '{ header: { frame_id: "map" }, pose: { position: { x: 1.0, y: 0, z: 0 }, orientation: { x: 0, y: 0, z: 0, w: 1 } } }'

"""
import rospy, os
from robot_status.msg import robot_odom
from nav_msgs import OccupancyGrid, Pose
from geometry_msgs import Twist
from math import pi
from transform_utils import normalize_angle, quat_to_angle
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
from std_msgs.msg import String
from robot_status.srv import *

class slam():

 def publish_angular(self,cmd,rotation):
  pub = rospy.Publisher('/cmd_vel_mux/input/teleop', Twist, queue_size=5)
  self.rotation=quat_to_angle(rotation)
  angular_cmd=Twist()
  #angular_cmd.angular.z=init_goal #twist angular
  angular_cmd.angular.z=1 #twist angular
  if cmd>pi:
   self.init_goal=pi
   self.sub_goal=cmd-2.0 * pi
   while self.rotation<self.init_goal:
    pub.publish(angular_cmd)
   while self.rotation<self.sub_goal
    pub.publish(angular_cmd)
    return 'start'
  else:
   self.init_goal=cmd
   self.sub_goal=0
   while self.rotation<self.init_goal:
    pub.publish(angular_cmd)
    return 'start'

 def get_mapedge(self):
   #################
   #???????????????#
   #################
 def publish_next(self,signal):
   #################
   #???????????????#
   #################
 def gmapping_restart(self,signal):
  # restart gmapping
  while
   pub = rospy.Publisher('restartgmapping', String, queue_size=5)
   pub.publish(signal)

 # link to launch amcl server
 def map_amcl(self,count,signal):
  os.system('rosrun map_server map_saver -f /maps/map_%d'%count)#save map
  os.system('export TURTLEBOT_MAP_FILE=~/maps/map_%d.yaml'%count)#export map
  print 'please run launch amcl server'
  rospy.wait_for_service('launch_amcl')
  server=rospy.ServiceProxy('launch_amcl', launch_amcl)
  resp=server(signal)
  return resp.finish
  
################ main body ###############
 def getodom(self,data):
  self.location={}
  count=0
  self.odom=robot_odom()
  self.odom=data
  cellposition=Pose()
  cellposition.Point.x=self.odom.position.x/self.mapdata.resolution-1
  cellposition.Point.y=self.odom.position.y/self.mapdata.resolution-1
  cellposition.orientation=self.odom.rotation
  self.location['map_init_pose_%s'%count]=cellposition
  cmd=2*pi
  signal=self.publish_angular(cmd,cellposition.orientation)
  self.map_amcl(count,signal)# done

  ###################
  self.get_mapedge()
  
  self.location['map_init_pose_%s'%count]=self.get_mapedge()

  self.publish_next(signal)

  count+=1
  self.gmapping_restart(signal)

  ###################

 def mapposition(self,data):
  self.mapdata=OccupancyGrid()
  self.mapdata=data
  rospy.Subscriber("robot_odom", robot_odom, self.getodom)

 def __init__(self):
  print "start slamming"
  rospy.init_node('slam', anonymous=False)
  rospy.Subscriber("map", OccupancyGrid, self.mapposition)
  rospy.spin()
  
if __name__=='__main__':
 try:
  print "initialization system"
  slam()
  print "process done and quit"
 except rospy.ROSInterruptException:
  rospy.loginfo("slam_main node terminated.")
