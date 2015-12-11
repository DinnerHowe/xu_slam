#!/usr/bin/env python
#coding=utf-8

import rospy,actionlib
from geometry_msgs.msg import *
from nav_msgs.msg import *
from math import *
from tf.transformations import *
from actionlib_msgs.msg import *
from move_base_msgs.msg import *

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


#记录path的
def path_recorder():
 rospy.Subscriber("path_recorder", Path, path)
def path(data):
 recorder=data.pose
 return recorder
