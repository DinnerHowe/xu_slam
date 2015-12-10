#!/usr/bin/env python

"""
- Version 1.0 2015/9/11

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

Constructs a rotation by first applying a rotation of r around the x-axis, then a rotation of p around the original y-axis, and finally a rotation of y around the original z-axis

"""

import PyKDL
from math import *

def quat_to_angle(quat):
 rot = PyKDL.Rotation.Quaternion(quat[0], quat[1], quat[2], quat[3])
 return rot.GetRPY()[2]

def ort_pose(yaw,pose,r):
 x=sin(yaw)*r+pose[0]
 y=cos(yaw)*r+pose[1]
 return [x,y]

