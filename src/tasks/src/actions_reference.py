#!/usr/bin/env python
#coding=utf-8
""" 2016/04/05

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""

import rospy,actionlib,getpass,move_reference,string
from geometry_msgs.msg import PointStamped
from nav_msgs.msg import Path,Odometry
from move_base_msgs.msg import MoveBaseAction
from visualization_msgs.msg import Marker
from math import *

#导航入口
def cruise():
 marker_point=rospy.wait_for_message("visualization_marker", Marker)
 pose_list=marker_point.points
 intial_position=pose_list[0]
 task_position=pose_list[1:]
 tasks=task_position
 if intial_position not in tasks:
  tasks.append(intial_position)
 else:
  pass
 tasks(len(pose_list),tasks)
  
#任务执行
def tasks(pose_number,pose_list):
 likelihood,weight=0,0.0
 move_base = actionlib.SimpleActionClient('move_base', MoveBaseAction)
 move_base.wait_for_server()
 goal = MoveBaseGoal()
 for goal_pose in pose_list:
  init_pose=rospy.wait_for_message("odom",Odometry)
  pre_position=PointStamped()
  pre_position.point=init_pose.pose.pose.position
  angle=angle_generater(goal_pose.point,pre_position.point)
  try:
   goal.target_pose.header.frame_id = goal_pose.header.frame_id
  except:
   goal.target_pose.header.frame_id = 'map'
  goal.target_pose.pose.position=goal_pose.point
  goal.target_pose.pose.orientation=Quaternion(*quaternion_from_euler(0,0,angle))
  move_base.send_goal(goal)
  move_base.wait_for_result(rospy.Duration.from_sec(30.0))
  state=move_base.get_state()
  if state==GoalStatus.SUCCEEDED:
   print 'Achieved Goal'
   weight-=1
   if weight<=0:
    weight=0
   likelihood=weight/pose_number
  else:
   print 'Fail to Achieve Goal'
   weight+=1
   likelihood=weight/pose_number
   #twist(2,1,0.0)
  print 'path reset rate : %s percent'%likelihood
  if likelihood>=1:
   move_base.cancel_goal()
   likelihood,weight=0,0.0
   print 'goal unchievable, tring to find way out'
  else:
   pass
 return

#curse默认模式的注册程序
def pre_regist(odom,modle):
 if odom:
  intial=rospy.wait_for_message("odom",Odometry)
  intial_point=PointStamped()
  intial_point.point=intial.pose.pose.position
  intial_point.header.stamp=rospy.Time.now()
  intial_point.header.frame_id='map'
 else:
  pass
 pose_list,pose_dic,poses=[],{},{}
 if modle=='cruise':
  for i in range(3):#default 3
   rospy.loginfo('请在地图上用 publish point 输入第%s个您希望机器人到达的位置'%(i+1))
   pose=rospy.wait_for_message("clicked_point", PointStamped)
   pose_list.append(pose)
   pose_dic={'pose_%s'%i:{'x':pose.point.x,'y':pose.point.y,'z':pose.point.z}}
   poses.update(pose_dic)
   print 'position',1+i,'recieved'

 elif modle=='voice_interface':
  for i in range(10):
   rospy.loginfo('请在地图上用 publish point 输入第%s个您希望机器人到达的位置'%(i+1))
   pose=rospy.wait_for_message("clicked_point", PointStamped)
   pose_list.append(pose)
   pose_dic={'pose_%s'%i:{'x':pose.point.x,'y':pose.point.y,'z':pose.point.z}}
   poses.update(pose_dic)
   print 'position',1+i,'recieved'

 else:
  rospy.loginfo('error unkown module')

# if back to initial
 try:
  pose_list.append(intial_point)
 except:
  pass

# store
 count=getpass.getuser()
 try:
  write=open('/home/%s/xu_slam/src/nav_staff/map/pre_regist_pose.txt'%count,'w')
 except:
  os.makedirs('/home/%s/xu_slam/src/nav_staff/map'%count)
  write=open('/home/%s/xu_slam/src/nav_staff/map/pre_regist_pose.txt'%count,'w')
 write.writelines('%s'%poses)
 write.close()
 tasks(len(pose_list),pose_list)

#默认模式的读取预注册程序
def pre_load():
 rospy.loginfo('检测到预注册的位置')
 rospy.loginfo('读取预设位置')
 count=getpass.getuser()
 read=open('/home/%s/xu_slam/src/nav_staff/map/pre_regist_pose.txt'%count,'r')
 pose=read.readlines()
 read.close()
 poses=eval(pose[0])
 try:
  intial=rospy.wait_for_message("odom",Odometry)
  intial_point=PointStamped()
  intial_point.point=intial.pose.pose.position
  intial_point.header.stamp=rospy.Time.now()
  intial_point.header.frame_id='map'
 except:
  pass
 pose_list=[]
 for i in range(len(poses)):
  default_point=PointStamped()
  default_point.header.frame_id='map'
  default_point.header.stamp=rospy.Time.now()
  default_point.point.x=poses['pose_%s'%i]['x']
  default_point.point.y=poses['pose_%s'%i]['y']
  default_point.point.z=poses['pose_%s'%i]['z']
  default_point.header.seq=i+1
  pose_list.append(default_point)
 pose_list.append(intial_point)
 tasks(len(pose_list),pose_list)

