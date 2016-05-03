#!/usr/bin/env python
#coding:utf-8
#-*-coding:utf-8 -*-

import sys
import json
import math
import rospy
import roslib, actionlib, std_msgs.msg
import geometry_msgs.msg
from std_msgs.msg import String
from geometry_msgs.msg import Twist, Point, Quaternion
from actionlib_msgs.msg import *
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
from nav_msgs.msg import Odometry
from geometry_msgs.msg import PointStamped
from visualization_msgs.msg import Marker



def addFlag():
    marker_pub = rospy.Publisher("warning_marker",Marker,queue_size=1)
    shape = Marker.TEXT_VIEW_FACING    
    for i in range(5):
        marker = Marker()
        marker.header.frame_id = 'map'
        marker.color.r, marker.color.b, marker.color.g = 1, 0, 0
        marker.color.a = 1
        marker.ns = "WarningFlag"
        marker.id = 1024
        marker.scale.x, marker.scale.y, marker.scale.z = 1, 1, 2
        marker.type = shape
        marker.text = "Obstacle!!!"
        marker.lifetime = rospy.Duration(10)
        marker_pub.publish(marker)
        rospy.sleep(1)        


def stopmove():   
    
    
    pubStopMess = rospy.Publisher('cmd_vel',Twist,queue_size=100)
    pub = rospy.Publisher('cmd_vel_mux/input/navi',Twist,queue_size=100)
    twist = Twist()
    twist.linear.x, twist.linear.y, twist.linear.z = 0, 0, 0
    twist.angular.x, twist.angular.y, twist.angular.z = 0, 0, 0
    move_base = actionlib.SimpleActionClient("move_base", MoveBaseAction)
    rospy.loginfo("waiting fro move_base action server")
    move_base.wait_for_server(rospy.Duration(60)) 
    
    state = GoalStatus.SUCCEEDED
    stopStates = [GoalStatus.ABORTED,GoalStatus.PREEMPTED,GoalStatus.REJECTED,GoalStatus.RECALLED]
    
    move_base.cancel_goal()
    
    while (state not in stopStates):
        new_goal = MoveBaseGoal()
        new_goal.target_pose.header.frame_id = 'map'
        new_goal.target_pose.header.stamp = rospy.Time.now()
        move_base.send_goal(new_goal)
        rospy.sleep(0.5)
        move_base.cancel_goal()
        state = move_base.get_state()
    # move_base.cancel_goal()
    for i in range(2):
        pubStopMess.publish(twist)
        pub.publish(twist)
    move_base.cancel_goal()
    rospy.sleep(0.5)
    addFlag()

def callback(data):
    info = data.data    
    #rospy.loginfo(info)
    if (info == "stop"):
        stopmove()
    else :
        pass
        #rospy.loginfo("I dont know")

if(__name__ == '__main__'):
    rospy.init_node("stopmove", anonymous=True)
    rospy.loginfo('subscriber to /stop_flag')
    rospy.Subscriber("stop_flag", String, callback)
    rospy.spin()
    # stopmove()

