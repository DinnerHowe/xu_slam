#!/usr/bin/env python  
import rospy
import math
import tf
import geometry_msgs.msg
import tf_nodes.srv

if __name__ == '__main__':
 rospy.init_node('tf_turtle_delay')
 listener = tf.TransformListener()

 try:
  rospy.wait_for_service('spawn')
  spawner = rospy.ServiceProxy('spawn', tf_nodes.srv.Spawn)
  spawner(4, 2, 0, 'turtle2')
 except rospy.ServiceException :
  print "ServiceException"
  pass
  
 turtle_vel = rospy.Publisher('turtle2/cmd_vel', geometry_msgs.msg.Twist,queue_size=1)
 try:
  source_frame = rospy.get_param('~child')
 except:
  rospy.set_param('~child','/turtle1_child')
  source_frame = rospy.get_param('~child')
 
 rate = rospy.Rate(10.0)
 
 time1=rospy.Time.now()
 time2=rospy.Duration(4.0)
 now=time1+time2
 #print "wait before 1"
 listener.waitForTransform("/turtle2","%s"%source_frame,now,rospy.Duration(6.0))
 print "wait 1"

 while not rospy.is_shutdown():
  try:
   time1=rospy.Time.now()
   time2=rospy.Duration(4.0)
   now=time1+time2
   
   listener.waitForTransform("/turtle2","%s"%source_frame,now,rospy.Duration(6.0))
   (trans,rot) = listener.lookupTransform('/turtle2','%s'%source_frame,now)

  except (tf.LookupException, tf.ConnectivityException, tf.ExtrapolationException):
   continue
   
  threld=0.01
  if trans>(threld,threld,threld):
   linear = 0.5 * math.sqrt(trans[0] ** 2 + trans[1] ** 2)
   angular = 4*math.atan2(trans[1], trans[0])
  else:
   linear=0
   euler=tf.transformations.euler_from_quaternion(rot)
   angular=euler[2]   
  print angular,trans
  cmd = geometry_msgs.msg.Twist()
  cmd.linear.x = linear
  cmd.angular.z = angular
  turtle_vel.publish(cmd)

  rate.sleep()
