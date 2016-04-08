#!/usr/bin/env python  
#coding=utf-8
import rospy
import math
import tf
import geometry_msgs.msg
import tf_nodes.srv

if __name__ == '__main__':
 rospy.init_node('tf_turtle')
 listener = tf.TransformListener()

 rospy.wait_for_service('spawn')#键盘控制
 spawner = rospy.ServiceProxy('spawn', tf_nodes.srv.Spawn)
 spawner(4, 2, 0, 'turtle2')
 print 'start a Publisher turtle2/cmd_vel '
 turtle_vel = rospy.Publisher('turtle2/cmd_vel', geometry_msgs.msg.Twist,queue_size=1)

 rate = rospy.Rate(10.0)
 
 try:
  turtlename = rospy.get_param('~child')
 except:
  rospy.set_param('~child','/turtle1_child')
  turtlename = rospy.get_param('~child')
  
 while not rospy.is_shutdown():
  try:
   (trans,rot) = listener.lookupTransform('/turtle2', '%s'%turtlename, rospy.Time(0))
  except (tf.LookupException, tf.ConnectivityException, tf.ExtrapolationException) as error:
   print error
   continue
  #print 'trans',trans
  #print 'rot',rot
  threld=0.01
  if trans>(threld,threld,threld):
   linear = 0.5 * math.sqrt(trans[0] ** 2 + trans[1] ** 2)
   angular = 4*math.atan2(trans[1], trans[0])
  else:
   linear=0
   euler=tf.transformations.euler_from_quaternion(rot)
   angular=euler[2]
   print 'angular',angular  
  #print angular,trans 
  cmd = geometry_msgs.msg.Twist()
  cmd.linear.x = linear
  cmd.angular.z = angular
  turtle_vel.publish(cmd)

  rate.sleep()
