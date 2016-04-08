#!/usr/bin/env python
#coding=utf-8

import rospy
from geometry_msgs.msg import PointStamped
from visualization_msgs.msg import Marker
from nav_msgs.msg import Odometry

class marker():
 def define(self):
  self.marker=Marker()
  self.marker.color.r=1.0
  self.marker.color.g=0.0
  self.marker.color.b=0.0
  self.marker.color.a=1.0
  self.marker.id = 0
  self.marker.ns='task_points'
  self.marker.scale.x=0.1
  self.marker.scale.y=0.1
  self.marker.header.stamp =rospy.Time.now()
  self.marker.header.frame_id='map'
  self.marker.type=Marker.SPHERE_LIST
  self.marker.action=Marker.ADD
  self.marker.lifetime = rospy.Duration(0)
  self.marker_pub=rospy.Publisher("visualization_marker",Marker,queue_size=1)
  self.count=0
  self.period=rospy.Duration(0.3)
  
 def sub_callback(self,pose):
  rospy.loginfo ('请使用publish point选出想要标记的地方')
  self.marker.points.append(pose.point)
  self.marker_pub.publish(self.marker)
  self.count=self.count+1
  rospy.loginfo('添加第%s个点'%self.count)
 
 def timer(self,event):
  if self.clear:
   rospy.loginfo ('清空上次任务')
   self.clear=False
   intial=rospy.wait_for_message("odom",Odometry)
   self.intial_point=intial.pose.pose.position
   self.marker.points=[self.intial_point] 
   self.marker_pub.publish(self.marker)
    
 def __init__(self):
  self.clear=True 
  rospy.init_node('marker_utils')
  self.define()
  rospy.Timer(self.period, self.timer)
  rospy.Subscriber("clicked_point", PointStamped, self.sub_callback) #pose=rospy.wait_for_message("clicked_point", PointStamped)
  rospy.spin()


if __name__=='__main__':
 try:
  rospy.loginfo ("initialization system")
  marker()
  rospy.loginfo ("process done and quit")
 except rospy.ROSInterruptException:
  rospy.loginfo("robot twist node terminated.")
