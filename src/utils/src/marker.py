#!/usr/bin/env python
#coding=utf-8

import rospy
from geometry_msgs.msg import *
from visualization_msgs.msg import *
from nav_msgs.msg import *

if __name__=='__main__':
 try:
  rospy.loginfo ("initialization system")
  number=raw_input('请输入希望标记的点数：')
  rospy.init_node('marker_utils')
  marker=Marker()
  marker.color.r=1.0
  marker.color.g=0.0
  marker.color.b=0.0
  marker.color.a=1.0
  marker.id = 0
  marker.ns='task_points'
  marker.scale.x=0.1
  marker.scale.y=0.1
  marker.header.stamp =rospy.Time.now()
  marker.header.frame_id='map'
  marker.type=Marker.SPHERE_LIST
  marker.action=Marker.ADD
  marker.lifetime = rospy.Duration(0)
  try:
   intial=rospy.wait_for_message("odom",Odometry)
   intial_point=PointStamped()
   intial_point.point=intial.pose.pose.position
   marker.points=[intial_point.point]
  except:
   marker.points=[]
  marker_pub = rospy.Publisher('visualization_marker', Marker,
queue_size=1)
  for i in range(int(number)):
   rospy.loginfo('请使用publish point选出想要标记的地方')
   pose=rospy.wait_for_message("clicked_point", PointStamped)
   marker.points.append(pose.point)
   rospy.loginfo('添加第%s个点'%(i+1))
  while not rospy.is_shutdown():
   marker_pub.publish(marker)
  rospy.loginfo ("process done and quit")
 except rospy.ROSInterruptException:
  rospy.loginfo("robot twist node terminated.")
