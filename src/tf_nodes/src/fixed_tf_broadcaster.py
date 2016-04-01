#!/usr/bin/env python  
import rospy
import tf

if __name__ == '__main__':
 rospy.init_node('turlte1_child_tf_broadcaster')
 br = tf.TransformBroadcaster()
 rate = rospy.Rate(10.0)
 while not rospy.is_shutdown():
  time=rospy.Time.now()
  br.sendTransform((0.0, 2.0, 0.0),(0.0, 0.0, 0.0, 1.0),time,"turtle1_child","turtle1")
  rate.sleep()
