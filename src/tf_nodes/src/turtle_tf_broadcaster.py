#!/usr/bin/env python  
import rospy
import tf
import tf_nodes.msg

def callback(msg, turtlename):
 br = tf.TransformBroadcaster()
 br.sendTransform((msg.x, msg.y, 0),tf.transformations.quaternion_from_euler(0, 0, msg.theta),rospy.Time.now(),turtlename,"world")

if __name__ == '__main__':
 rospy.init_node('turtle_tf_broadcaster')
 try:
  turtlename = rospy.get_param('~turtle')
 except:
  turtlename='turtle1'
 print turtlename
 rospy.Subscriber('/%s/pose' % turtlename,tf_nodes.msg.Pose,callback,turtlename)
 rospy.spin()
