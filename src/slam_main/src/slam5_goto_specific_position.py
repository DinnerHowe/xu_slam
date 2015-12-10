#!/usr/bin/env python
#coding=utf-8
""" 
- Version 2.0 2015/10/11
 
Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

go to specific position in map and back(worked,done).add aotu point fixing. in the point aborted check others around by

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

rostopic pub /move_base_simple/goal geometry_msgs/PoseStamped '{ header: { frame_id: "map" }, pose: { position: { x: 1.0, y: 0, z: 0 }, orientation: { x: 0, y: 0, z: 0, w: 1 } } }'

need to os.system('export TURTLEBOT_MAP_FILE=~/maps/map_%d.yaml'%self.count)#export map

this file work with helping of following files:

robot_status/tf_listener.py; or rosrun robot_pose_ekf robot_pose_ekf
utils/execl_coordinate_without_positive_coordinate.py
robot_status/map_lisenter_without_positive_coordinate.py
gmapping
"""
import rospy, actionlib, os, getpass,math,collections
from actionlib_msgs.msg import *
from geometry_msgs.msg import Pose
from nav_msgs.msg import Odometry
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
from std_msgs.msg import String

from openpyxl import load_workbook
from openpyxl import  Workbook

class goto_specified_position():

 def goal_fixer(self,ori_goal,x_increase,y_increase):
  new.goal=MoveBaseGoal()
  new_goal.target_pose.pose.position.x=ori_goal.target_pose.pose.position.x+x_increase
  new_goal.target_pose.pose.position.y=ori_goal.target_pose.pose.position.y+y_increase
  new_goal.target_pose.pose.orientation.w=1
  new_goal.target_pose.header.frame_id="map"
  new_goal.target_pose.header.stamp=rospy.Time.now()
  return new_goal

 def goals(self,goal,maxlen=1000):
  self.stampedpose=cllections.deque(maxlen=maxlen)
  print 'goal.data is :',goal.data 
  if goal.data!='start':
   self.action=actionlib.SimpleActionClient('move_base',MoveBaseAction)
   self.action.wait_for_server(rospy.Duration(60))

   self.goal,self.fixed_goal=MoveBaseGoal()
   self.goal.target_pose.pose.position.x=float(goal.data.split(',')[0])
   self.goal.target_pose.pose.position.y=float(goal.data.split(',')[1])
   self.goal.target_pose.pose.orientation.w=1
   self.goal.target_pose.header.frame_id="map"
   self.goal.target_pose.header.stamp=rospy.Time.now()
   self.fixed_goal=self.goal
   goal_states={
	'%s'%GoalStatus.PENDING:'PENDING',
	'%s'%GoalStatus.ACTIVE:'ACTIVE',
	'%s'%GoalStatus.SUCCEEDED:'SUCCEEDED',
	'%s'%GoalStatus.PREEMPTED:'PREEMPTED',
	'%s'%GoalStatus.ABORTED:'ABORTED',
	'%s'%GoalStatus.REJECTED:'REJECTED',
	'%s'%GoalStatus.PREEMPTING:'PREEMPTING',
	'%s'%GoalStatus.RECALLING:'RECALLING',
	'%s'%GoalStatus.RECALLED:'RECALLED',
	'%s'%GoalStatus.LOST:'LOST'}

   # 发song目标坐标
   print 'self.goal ',self.goal
   self.action.send_goal(self.goal)

   finish_time=self.action.wait_for_result()
   print 'finish_time',finish_time #ture or false

   state=self.action.get_state()
   print 'goal_states ',goal_states['%s'%state]

   robot_inital=Pose()
   robot_inital=self.init_odoms()
   rospy.loginfo('robot initial pose: \n%s'%robot_inital)


   if not finish_time or not state==GoalStatus.SUCCEEDED:
    self.action.cancel_goal()
    print state,'out of time'
    if not self.fixed_goal.target_pose.pose.position.x-self.goal.target_pose.pose.position.x>0:
     increasex=1
     increasey=0
     self.fixed_goal=self.goal_fixer(self.goal，increasex，increasey)
    else:
     increasey=1
     increasex=0
     self.fixed_goal=self.goal_fixer(self.goal，increasex，increasey)

   if state==GoalStatus.SUCCEEDED:
    print state,'goal is currently achieved'
    print 'going back'

##############################################################################
###############################################################################
##############################################################################

    print 'home coordinate:\n',robot_inital
    self.goal.target_pose.pose.position=robot_inital.position
    self.goal.target_pose.pose.orientation=robot_inital.orientation
    self.action.send_goal(self.goal)
    back_time=self.action.wait_for_result()
    print back_time
    state=self.action.get_state()

    if not back_time :
     self.action.cancel_goal()
     print state,'out of time'
    if state==GoalStatus.SUCCEEDED:
     print state,'home is currently achieved'
     self.odoms_store(robot_inital)
    else:
     print 'cannot be achieved the home due to:', state,str(goal_states['%s'%state])
     self.odoms_store(robot_inital)

   else:
    print 'cannot be achieved the goal due to:', state, str(goal_states['%s'%state])
    self.odoms_store(robot_inital)
    print 'going back'

    robot_inital=self.init_odoms() #读init坐标

    #存init坐标
    self.stampedpose.append(robot_inital)
    #self.odoms_store(robot_inital) 

    print 'home coordinate:\n',robot_inital
    self.goal.target_pose.pose.position=robot_inital.position
    self.goal.target_pose.pose.orientation=robot_inital.orientation
    self.action.send_goal(self.goal)
    back_time=self.action.wait_for_result()
    state=self.action.get_state()
    if not back_time :
     self.action.cancel_goal()
     print state,'out of time'
    if state==GoalStatus.SUCCEEDED:
     print state,'home is currently achieved'
     self.odoms_store(robot_inital)
    else:
     print 'cannot be achieved the home due to:', state,str(goal_states['%s'%state])
     self.odoms_store(robot_inital)

    self.travel_distance= math.sqrt(pow((self.current_odom.pose.pose.position.x-robot_inital.position.x),2)+pow((self.current_odom.pose.pose.position.y-robot_inital.position.y),2))
    pub = rospy.Publisher('travel_distance', String, queue_size=5)
    pub.publish('%s'%str(self.travel_distance))
  else:
   print ''


   

 def tfcallback(self,data):
  self.current_pose=Odometry()
  self.current_odom=Odometry()
  self.current_odom=data

 def __init__(self):
  self.count=1
  self.travel_distance=0.0
  self.accout=getpass.getuser()
  self.robot_odom=Pose()
  print "start slamming"
  rospy.init_node('goto_specified_position', anonymous=False)
  rospy.wait_for_message('excel_to_coordinate', String)
  rospy.Subscriber('excel_to_coordinate', String, self.goals)
  rospy.Subscriber("/odom", Odometry, self.tfcallback)
  rospy.spin()
  
if __name__=='__main__':
 try:
  print "initialization system"
  goto_specified_position()
  print "process done and quit"
 except rospy.ROSInterruptException:
  rospy.loginfo("goto specified position node terminated.")
