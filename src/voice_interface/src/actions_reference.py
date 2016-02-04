#!/usr/bin/env python
#coding=utf-8

import rospy,actionlib
from geometry_msgs.msg import *
from nav_msgs.msg import *
from math import *
from tf.transformations import *
from actionlib_msgs.msg import *
from move_base_msgs.msg import *
from map_listener_reference import *


#turn_speed in rad/s,radius in meter, duration in sec
def twist(turn_speed,duration,radius):
 pub = rospy.Publisher('/cmd_vel_mux/input/teleop', Twist, queue_size=1)
 move_cmd= Twist() 
 time_stamp=rospy.get_rostime()
 while (rospy.get_rostime()-time_stamp)<=rospy.Duration(duration):
  move_cmd.angular.z = turn_speed
  move_cmd.linear.x = radius
  pub.publish(move_cmd)


#正方形移动，边长可变
def square(square_size):
 init_pose=rospy.wait_for_message("odom", Odometry)
 quaternions,waypoints= list(),list()
 euler_angles = (pi/2, pi, 3*pi/2, 0)
 
 for angle in euler_angles:
  q_angle = quaternion_from_euler(0, 0, angle, axes='sxyz')
  quaternion = Quaternion(*q_angle)
  quaternions.append(quaternion)

 waypoints.append(Pose(Point(init_pose.pose.pose.position.x, init_pose.pose.pose.position.y, init_pose.pose.pose.position.z), quaternions[3]))
 waypoints.append(Pose(Point(init_pose.pose.pose.position.x+square_size, init_pose.pose.pose.position.y, init_pose.pose.pose.position.z), quaternions[0]))
 waypoints.append(Pose(Point(init_pose.pose.pose.position.x+square_size, init_pose.pose.pose.position.y+square_size, init_pose.pose.pose.position.z), quaternions[1]))
 waypoints.append(Pose(Point(init_pose.pose.pose.position.x, init_pose.pose.pose.position.y+square_size, init_pose.pose.pose.position.z), quaternions[2]))
 waypoints.append(Pose(Point(init_pose.pose.pose.position.x, init_pose.pose.pose.position.y, init_pose.pose.pose.position.z), quaternions[3]))

 move_base = actionlib.SimpleActionClient('move_base', MoveBaseAction)
 move_base.wait_for_server()
 goal = MoveBaseGoal()
 goal.target_pose.header.frame_id = 'map'
 for i in range(len(waypoints)):
  goal.target_pose.header.stamp = rospy.Time.now()
  goal.target_pose.pose=waypoints[i]
  move_base.send_goal(goal)
  move_base.wait_for_result()
  state=move_base.get_state()
  if state==GoalStatus.SUCCEEDED:
   print True
  else:
   print False

#generate a path
def path_gen(goal):
 init_pose=rospy.wait_for_message("odom",Odometry)
 goal.target_pose.pose.position

#记录path的
def path_recorder():
 rospy.Subscriber("move_base", Path, path)
def path(data):
 recorder=data.pose
 return recorder

def tasks(pose_number,pose_list):
 likelihood,weight=0,0.0
 move_base = actionlib.SimpleActionClient('move_base', MoveBaseAction)
 move_base.wait_for_server()
 goal = MoveBaseGoal()
 for goal_pose in pose_list:
  init_pose=rospy.wait_for_message("odom",Odometry)
  pre_position=PointStamped()
  pre_position.point=init_pose.pose.pose.position
  angle=angle_generater(goal_pose,pre_position)
  try:
   goal.target_pose.header.frame_id = goal_pose.header.frame_id
  except:
   goal.target_pose.header.frame_id =  'map'
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
  print 'path reset rate : %s percent'%likelihood
  if likelihood>=1:
   move_base.cancel_goal()
   likelihood,weight=0,0.0
   print 'goal unchievable, tring to find way out'
   twist(2,1,0.0)

#巡航模式(选定几个点一直跑)
def cruise(pose_number):
 pose_list=[]
 for i in range(pose_number):
  pose=rospy.wait_for_message("clicked_point", PointStamped)
  pose_list.append(pose)
  print 'position',1+i,'recieved'
 while not rospy.is_shutdown():
  tasks(pose_number,pose_list)

#vioce task模式
def vioce_tasks(pose_number,pose_list,orientation):
 if type(pose_list) is list:
  tasks(pose_number,pose_list)
 else:
  move_base = actionlib.SimpleActionClient('move_base', MoveBaseAction)
  move_base.wait_for_server()
  goal = MoveBaseGoal()
  goal.target_pose.header.frame_id = pose_list.header.frame_id
  goal.target_pose.pose.position=pose_list.point
  goal.target_pose.pose.orientation=orientation
  move_base.send_goal(goal)
  move_base.wait_for_result(rospy.Duration.from_sec(30.0))
  state=move_base.get_state()
  if state==GoalStatus.SUCCEEDED:
   print 'Achieved Goal'
  else:
   print 'Fail to Achieve Goal'
   move_base.cancel_goal()
   twist(2,1,0.0)
   #vioce_tasks(pose_number,pose_list,orientation)#??????????
 return state
