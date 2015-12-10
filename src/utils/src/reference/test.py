#!/usr/bin/env python
#coding=utf-8
""" 

- Version 2.0 2015/9/11

testing references

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""

import quat_to_angle,execl_coordinate_transfer,rospy

class testing():
 def __init__(self):
  excel_pose=execl_coordinate_transfer.coordinate2execl()
  print '\ntransfer robot position from coordinate to excel with oreintation:\n',excel_pose
  angle=quat_to_angle.quat_to_angle(excel_pose[2])
  print '\noreitation angle in rad: ',angle
  input_excl=excel_pose[0]+str(excel_pose[1])
  coordinate=execl_coordinate_transfer.excel2coordinate(input_excl)
  print '\ntransfer robot position from excel back to coordinate:\n',coordinate
  radius=0.4
  [rot_x,rot_y]=quat_to_angle.ort_pose(angle,coordinate,radius)
  print '\norientation pose: ',[rot_x,rot_y]
  excel_ort=execl_coordinate_transfer.pointed_coordinate2execl([rot_x,rot_y])
  print '\norientation pose in excel:\n',excel_ort


if __name__=='__main__':
 print "initialization system"
 rospy.init_node('excel_to_coordinate',anonymous=True)
 testing()
 print "process done and quit"


