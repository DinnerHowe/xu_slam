#!/usr/bin/env python
#coding=utf-8


import rospy
import actionlib
from actionlib_msgs.msg import *
from geometry_msgs.msg import Pose, Point, Quaternion, Twist
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
from tf.transformations import quaternion_from_euler
from visualization_msgs.msg import Marker
from math import radians, pi

class MoveBaseSquare():
 def goal_generator(self):

  quaternions,waypoints= list(),list()
  euler_angles = (pi/2, pi, 3*pi/2, 0)
  for angle in euler_angles:
   q_angle = quaternion_from_euler(0, 0, angle, axes='sxyz')
   q = Quaternion(*q_angle)
   quaternions.append(q)
  try:
   square_size = rospy.get_param("~square_size", 1.5) # meters
  except:
   square_size = 1.4

  waypoints.append(Pose(Point(square_size, 0.0, 0.0), quaternions[0]))
  waypoints.append(Pose(Point(square_size, square_size, 0.0), quaternions[1]))
  waypoints.append(Pose(Point(0.0, square_size, 0.0), quaternions[2]))
  waypoints.append(Pose(Point(0.0, 0.0, 0.0), quaternions[3]))
  return waypoints

 def __init__(self):
  rospy.init_node('nav_test')
  self.shutdown()
  waypoints=self.goal_generator()

# 仿真用
  self.cmd_vel_pub = rospy.Publisher('cmd_vel_mux/input/navi', Twist, queue_size=10)

# 实物用
  #self.cmd_vel_pub = rospy.Publisher('/cmd_vel_mux/input/teleops', Twist, queue_size=10)

  self.move_base = actionlib.SimpleActionClient("move_base", MoveBaseAction)

  rospy.loginfo("Waiting for move_base action server...")
  self.move_base.wait_for_server(rospy.Duration(30))
  rospy.loginfo("Connected to move base server")
  rospy.loginfo("Starting navigation test")
  i,j=0,0
  while j < 4 and not rospy.is_shutdown():
   try:
    waypoints,i=self.move(waypoints,i)
   except:
    self.move(waypoints,i)
   i+=1
   if i>=len(waypoints):
    i=0
    j+=1



###########################################################
#move
 def move(self,waypoints,i):

  goal,new= MoveBaseGoal(),MoveBaseGoal()
  goal.target_pose.header.frame_id = 'map'
  goal.target_pose.header.stamp = rospy.Time.now()
  goal.target_pose.pose = waypoints[i]

  print 'waypoints lenth:\n',len(waypoints)
  print 'waypoints[i] %s:\n'%i,waypoints[i]

  self.move_base.send_goal(goal)

  finished_within_time = self.move_base.wait_for_result(rospy.Duration(10)) 
  state= self.move_base.get_state()

  if finished_within_time :

   rospy.loginfo("state error,setting new goal")

   while not state == GoalStatus.SUCCEEDED:

    state,new=self.goal_compensator(goal,waypoints,i)

   rospy.loginfo("Goal succeeded!")

   return waypoints,i


##################################################################################
#goal_compensator
 def goal_compensator(self,goal,waypoints,i):

  self.move_base.cancel_goal()
  new= MoveBaseGoal()
  origin.target_pose.header.frame_id , new.target_pose.header.frame_id = 'map','map'
  origin.target_pose.header.stamp , new.target_pose.header.stamp = rospy.Time.now(),rospy.Time.now()

  try:
   square_size = rospy.get_param("~square_size", 1.5)
  except:
   square_size = 1.4

  #x==x
  if goal.target_pose.pose.position.x==origin.target_pose.pose.position.x:
   #4号位, 1号位
   if goal.target_pose.pose.position.x==0:
    if origin.target_pose.pose.position.y != goal.target_pose.pose.position.y:
     new.target_pose.pose.position.x=origin.target_pose.pose.position.x-0.2
     new.target_pose.pose.position.y=origin.target_pose.pose.position.y+(goal.target_pose.pose.position.y-origin.target_pose.pose.position.y)/2
    else:
     rospy.loginfo('target and current pose is in same position')
     pass
   #2,3号位
   if goal.target_pose.pose.position.x==square_size:
    if origin.target_pose.pose.position.y != goal.target_pose.pose.position.y:
     new.target_pose.pose.position.x=origin.target_pose.pose.position.x+0.2
     new.target_pose.pose.position.y=origin.target_pose.pose.position.y+(goal.target_pose.pose.position.y-origin.target_pose.pose.position.y)/2
    else:
     rospy.loginfo('target and current pose is in same position')
     pass

  #y==y
  elif goal.target_pose.pose.position.y==origin.target_pose.pose.position.y:
   # 1,2
   if goal.target_pose.pose.position.y==0:
    if origin.target_pose.pose.position.x != goal.target_pose.pose.position.x:
     new.target_pose.pose.position.y=origin.target_pose.pose.position.y-0.2
     new.target_pose.pose.position.x=origin.target_pose.pose.position.x+(goal.target_pose.pose.position.x-origin.target_pose.pose.position.x)/2
    else:
     rospy.loginfo('target and current pose is in same position')
     pass

   # 3,4
   if goal.target_pose.pose.position.y==square_size:
    if origin.target_pose.pose.position.x != goal.target_pose.pose.position.x:
     new.target_pose.pose.position.y=origin.target_pose.pose.position.y+0.2
     new.target_pose.pose.position.x=origin.target_pose.pose.position.x+(goal.target_pose.pose.position.x-origin.target_pose.pose.position.x)/2
    else:
     rospy.loginfo('target and current pose is in same position')
     pass
  else:
   pass

  self.move_base.send_goal(new)

  finished_within_time = self.move_base.wait_for_result(rospy.Duration(30))

  state = self.move_base.get_state()

  if state==GoalStatus.SUCCEEDED:
   waypoints.insert(i+1,new)
   i+=1
   return waypoints,i
  else:
   return waypoints,i




 def shutdown(self):
  rospy.loginfo("Stopping the robot...")
  try:
   self.move_base.cancel_goal()
   rospy.sleep(2)
   self.cmd_vel_pub.publish(Twist())
   rospy.sleep(1)
  except:
   pass

if __name__ == '__main__':
 try:
  MoveBaseSquare()
 except rospy.ROSInterruptException:
  rospy.loginfo("Navigation test finished.")
