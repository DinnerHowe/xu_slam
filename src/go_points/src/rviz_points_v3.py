#!/usr/bin/env python
#coding=utf-8
""" 2015/11/12
接受rviz上发布的点，然后依次过去
修改：改进闭环扫描的起点，起点定位机器人当前位置，替换之前的地图原点
修改：加入map_listener_reference.py的api，改进了机器朝向问题，朝向目标点


Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""
import rospy, actionlib
import actions_v2 as actions
from geometry_msgs.msg import *
from actionlib_msgs.msg import *
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
from tf.transformations import quaternion_from_euler
from nav_msgs.msg import *
from map_listener_reference import *

class go_points():
 def __init__(self):
  rospy.init_node('go_points')
  self.point_list=[]
  self.map_old=OccupancyGrid()
  #actions.twist(1,20,0.0)
  #actions.square(0.5)

  self.map_updated=False
  self.number=int(raw_input('Please input how many position you wanna achieve: '))
  rospy.Subscriber("clicked_point", PointStamped, self.points_collector)
  rospy.spin()


 def points_collector(self,data):
  self.point_list.append(data)
  if len(self.point_list)==self.number:
   status=self.run_points(self.point_list)
   self.point_list=[]
  else:
   pass

 def run_points(self,points):
  bin_number=self.number
  print bin_number
  move_base = actionlib.SimpleActionClient('move_base', MoveBaseAction)
  move_base.wait_for_server()
  goal = MoveBaseGoal()
  goal.target_pose.header.frame_id = rospy.get_param('bin_number', 'map')
  

  for sub_point in points:
   init_pose=rospy.wait_for_message("odom", Odometry)
   pre_point=PointStamped()
   pre_point.point=init_pose.pose.pose.position
   angle=angle_generater(sub_point,pre_point)
   goal.target_pose.pose.position=sub_point.point
   goal.target_pose.pose.orientation = Quaternion(*quaternion_from_euler(0, 0, angle))
   move_base.send_goal(goal)
   move_base.wait_for_result()
   state=move_base.get_state()
   if state==GoalStatus.SUCCEEDED:
    print True
   else:
    print False


if __name__ == '__main__':
 try:
  rospy.loginfo( "initialization system")
  go_points()
  rospy.loginfo( "process done and quit")
 except rospy.ROSInterruptException:
  rospy.loginfo("follower node terminated.")

