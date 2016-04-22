#!/usr/bin/env python
#coding=utf-8
"""
用来添加障碍物的3D模型

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""
import rospy,marker_reference,interactive_marker_server
from visualization_msgs.msg import InteractiveMarker,Marker,InteractiveMarkerControl
from std_msgs.msg import ColorRGBA
from geometry_msgs.msg import Vector3,Point
from nav_msgs.msg import OccupancyGrid
 

class obstacles():

 #def obstacle_callback(self, feedback):
  #print 'obstacles updataed'
  #pass
  #self.server.applyChanges()
  
  
 #方格的基础属性
 def make_obstacle_control(self,obstacles,color,scale):
  control = InteractiveMarkerControl()
  control.always_visible = True
  control.orientation_mode = InteractiveMarkerControl.VIEW_FACING
  control.independent_marker_orientation = True
  
  obstacle_cube=Marker()
  obstacle_cube.type=Marker.CUBE
  obstacle_cube.scale.x=scale.x
  obstacle_cube.scale.y=scale.y
  obstacle_cube.scale.z=scale.z

  obstacle_cube.color.r=color.r
  obstacle_cube.color.g=color.g
  obstacle_cube.color.b=color.b
  obstacle_cube.color.a=color.a
  
  control.markers.append( obstacle_cube )
  obstacles.controls.append( control )
  return control
    
 def __init__(self):
  rospy.init_node('obstacles')
    
  obstacle_control=InteractiveMarkerControl()
    
  scale=Vector3()
  color=ColorRGBA()
  position=Point()
  block_points=[]

  self.server=interactive_marker_server.InteractiveMarkerServer("obstacle_markers")
  map_data=rospy.wait_for_message('map',OccupancyGrid)
  
  scale.x=map_data.info.resolution
  scale.y=map_data.info.resolution
  scale.z=map_data.info.resolution*10
  
  ##这里添加param
  try:
   color.r=rospy.get_param('~color_r')
   color.g=rospy.get_param('~color_g')
   color.b=rospy.get_param('~color_b')
   color.a=rospy.get_param('~color_a')
   frameID=rospy.get_param('~frame_id')
  except:
   color.r=0.5
   color.g=0.5
   color.b=0.5
   color.a=1   
   frameID='map'
  
  block_points=marker_reference.get_effective_point(map_data)[1]
  
  for block_point in block_points:
   
   obstacles=InteractiveMarker()
   obstacles.header.frame_id=frameID
   obstacles.scale = scale.x

   [position.x,position.y]=block_point
 
   obstacles.pose.position.x = position.x
   obstacles.pose.position.y = position.y
   obstacles.pose.position.z = scale.z/2
   
   obstacles.name='%s,%s,%s'%(position.x,position.y,position.z)

   self.make_obstacle_control(obstacles,color,scale)
   
# tell the server to call obstacle_callback() when feedback arrives for it
   self.server.insert(obstacles)#,self.obstacle_callback)
   
  self.server.applyChanges()
  rospy.spin()
  

  
if __name__=="__main__":
 try:
  rospy.loginfo ("initialization system")
  obstacles()
  rospy.loginfo ("process done and quit")
 except rospy.ROSInterruptException:
  rospy.loginfo("robot twist node terminated.")
