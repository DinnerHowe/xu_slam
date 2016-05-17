#!/usr/bin/env python
#coding:utf-8
#-*-coding:utf-8 -*-

import sys
import json
import math
import rospy, tf
import roslib, actionlib, std_msgs.msg
import geometry_msgs.msg
from std_msgs.msg import String
from geometry_msgs.msg import Twist, Point, Quaternion
from actionlib_msgs.msg import *
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
from nav_msgs.msg import Odometry
from geometry_msgs.msg import PointStamped
from visualization_msgs.msg import Marker

# global position variables 
poseX, poseY, poseZ = 0, 0, 0

def OdomCallback(msg):
    global poseX, poseY
    poseX, poseY = msg.pose.pose.position.x, msg.pose.pose.position.y
    
    # rospy.loginfo("callx " + str(poseX))
    # rospy.loginfo("cally " + str(poseY))
    

def addFlag():

    # get the cooprations of turtlebot in map using tf
    # listener = tf.TransformListener()    
    # listener.waitForTransform("/odom", "/base_link", rospy.Time(0), rospy.Duration(1))
    # (position, rotation) = listener.lookupTransform("/odom", "/base_link", rospy.Time(0))
    
    global poseX, poseY, poseZ
    

    marker_pub = rospy.Publisher("warning_marker",Marker,queue_size=1)
    shape = Marker.TEXT_VIEW_FACING    
    for i in range(5):
        marker = Marker()
        marker.header.frame_id = 'map'
        marker.color.r, marker.color.b, marker.color.g = 1, 0, 0
        marker.color.a = 1
        marker.ns = "WarningFlag"
        marker.id = 1024
        marker.pose.position.x, marker.pose.position.y, marker.pose.position.z =  poseX, poseY , poseZ+0.5#position[0], position[1]-0.7, 0
        marker.scale.x, marker.scale.y, marker.scale.z = 0.01, 0.01, 0.2
        marker.type = shape
        marker.text = "WARNING"
        marker.lifetime = rospy.Duration(5)
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
    rospy.loginfo(info)
    if (info == "stop"):
        stopmove()
    else :
        rospy.loginfo("I dont know")

if(__name__ == '__main__'):
    rospy.init_node("stopmove", anonymous=True)
    rospy.Subscriber('odom', Odometry, OdomCallback)
    rospy.loginfo('subscriber to /stop_flag')
    stop_flag_topic = ''
    if rospy.has_param('stop_flag_topic'):
        stop_flag_topic = rospy.get_param('stop_flag_topic')
    else:
        rospy.set_param('stop_flag_topic',stop_flag_topic)


    rospy.Subscriber("stop_flag", String, callback)
    rospy.spin()
    
    # stopmove()
