#!/usr/bin/env python
#coding=utf-8
"2016/02/01"

import rospy,actionlib,getpass
from geometry_msgs.msg import *
from nav_msgs.msg import *
from math import *
from tf.transformations import *
from actionlib_msgs.msg import *
from move_base_msgs.msg import *
from map_listener_reference import *
from visualization_msgs.msg import *

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

#generate a path
def path_gen(goal):
 init_pose=rospy.wait_for_message("odom",Odometry)
 goal.target_pose.pose.position

#记录path的
def path_recorder():
 rospy.Subscriber("move_base", Path, path)
def path(data):
 recorder=data.pose
 return recorder

#任务执行
def tasks(pose_number,pose_list):
 likelihood,weight=0,0.0
 move_base = actionlib.SimpleActionClient('move_base', MoveBaseAction)
 move_base.wait_for_server()
 goal = MoveBaseGoal()
 for goal_pose in pose_list:
  init_pose=rospy.wait_for_message("odom",Odometry)
  pre_position=PointStamped()
  pre_position.point=init_pose.pose.pose.position
  angle=angle_generater(goal_pose,pre_position)
  #goal.target_pose.header.frame_id = goal_pose.header.frame_id
  try:
   goal.target_pose.header.frame_id = goal_pose.header.frame_id
  except:
   goal.target_pose.header.frame_id =  'map'
  goal.target_pose.pose.position=goal_pose.point
  goal.target_pose.pose.orientation=Quaternion(*quaternion_from_euler(0,0,angle))
  move_base.send_goal(goal)
  move_base.wait_for_result(rospy.Duration.from_sec(30.0))
  state=move_base.get_state()
  if state==GoalStatus.SUCCEEDED:
   print 'Achieved Goal'
   weight-=1
   if weight<=0:
    weight=0
   likelihood=weight/pose_number
  else:
   print 'Fail to Achieve Goal'
   weight+=1
   likelihood=weight/pose_number
  print 'path reset rate : %s percent'%likelihood
  if likelihood>=1:
   move_base.cancel_goal()
   likelihood,weight=0,0.0
   print 'goal unchievable, tring to find way out'
   twist(2,1,0.0)
  else:
   pass
 #return


#巡航模式(选定几个点一直跑)
def cruise(pose_number):
 marker_pub = rospy.Publisher('curse_markers', Marker, queue_size=1)
 marker=marker_define()

 intial=rospy.wait_for_message("odom",Odometry)
 intial_point=PointStamped()
 intial_point.point=intial.pose.pose.position
 intial_point.header.stamp=rospy.Time.now()
 intial_point.header.frame_id='map'
 marker.points=[intial_point.point]
 pose_list=[]
 for i in range(pose_number):
  rospy.loginfo('请在地图上用 publish point 输入第%s个您希望机器人到达的位置'%(i+1))
  pose=rospy.wait_for_message("clicked_point", PointStamped)
  pose_list.append(pose)
  marker.points.append(pose.point)
  print 'position',1+i,'recieved'
 pose_list.append(intial_point)
 marker_pub.publish(marker)
 quest=raw_input('您希望巡航（即机器人在选的位置之间循环往复）吗？y/n: ')
 if quest=='y':
  times=raw_input('请输入巡航的次数，或者机器人默认将会无限次循环：')
  try:
   times=int(times)
   for i in range(times):
    rospy.loginfo('第%s轮导航开始'%(i+1))
    tasks(pose_number,pose_list)
  except:
   while not rospy.is_shutdown():
    rospy.loginfo('无限次导航开始')
    tasks(pose_number,pose_list)
 else:
  rospy.loginfo('单次导航开始') 
  tasks(pose_number,pose_list)


#curse默认模式的注册程序
def pre_regist(odom,modle):
 marker_pub = rospy.Publisher('curse_markers', Marker, queue_size=1)
 marker=marker_define()
 if odom:
  intial=rospy.wait_for_message("odom",Odometry)
  intial_point=PointStamped()
  intial_point.point=intial.pose.pose.position
  intial_point.header.stamp=rospy.Time.now()
  intial_point.header.frame_id='map'
  marker.points=[intial_point.point]
 else:
  marker.points=[]
 pose_list,pose_dic,poses=[],{},{}
 if modle=='cruise':
  for i in range(3):#default 3
   rospy.loginfo('请在地图上用 publish point 输入第%s个您希望机器人到达的位置'%(i+1))
   pose=rospy.wait_for_message("clicked_point", PointStamped)
   pose_list.append(pose)
   marker.points.append(pose.point)
   pose_dic={'pose_%s'%i:{'x':pose.point.x,'y':pose.point.y,'z':pose.point.z}}
   poses.update(pose_dic)
   print 'position',1+i,'recieved'

 elif modle=='voice_interface':
  for i in range(10):
   rospy.loginfo('请在地图上用 publish point 输入第%s个您希望机器人到达的位置'%(i+1))
   pose=rospy.wait_for_message("clicked_point", PointStamped)
   pose_list.append(pose)
   marker.points.append(pose.point)
   pose_dic={'pose_%s'%i:{'x':pose.point.x,'y':pose.point.y,'z':pose.point.z}}
   poses.update(pose_dic)
   print 'position',1+i,'recieved'

 else:
  rospy.loginfo('error unkown module')

# if back to initial
 try:
  pose_list.append(intial_point)
 except:
  pass

# mark targets
 marker_pub.publish(marker)

# store
 count=getpass.getuser()
 try:
  write=open('/home/%s/xu_slam/src/nav_staff/map/pre_regist_pose.txt'%count,'w')
 except:
  os.makedirs('/home/%s/xu_slam/src/nav_staff/map'%count)
  write=open('/home/%s/xu_slam/src/nav_staff/map/pre_regist_pose.txt'%count,'w')
 write.writelines('%s'%poses)
 write.close()
 tasks(len(pose_list),pose_list)

#默认模式的读取预注册程序
def pre_load():
 rospy.loginfo('检测到预注册的位置')
 rospy.loginfo('读取预设位置')
 marker=marker_define()
 count=getpass.getuser()
 read=open('/home/%s/xu_slam/src/nav_staff/map/pre_regist_pose.txt'%count,'r')
 pose=read.readlines()
 read.close()
 poses=eval(pose[0])
 try:
  intial=rospy.wait_for_message("odom",Odometry)
  intial_point=PointStamped()
  intial_point.point=intial.pose.pose.position
  intial_point.header.stamp=rospy.Time.now()
  intial_point.header.frame_id='map'
  marker.points=[intial_point.point]
 except:
  marker.points=[]
 pose_list=[]
 for i in range(len(poses)):
  default_point=PointStamped()
  default_point.header.frame_id='map'
  default_point.header.stamp=rospy.Time.now()
  default_point.point.x=poses['pose_%s'%i]['x']
  default_point.point.y=poses['pose_%s'%i]['y']
  default_point.point.z=poses['pose_%s'%i]['z']
  default_point.header.seq=i+1
  pose_list.append(default_point)
  marker.points.append(default_point.point)
 pose_list.append(intial_point)
 marker_pub = rospy.Publisher('curse_markers', Marker, queue_size=5)
 rospy.sleep(3)
 marker_pub.publish(marker)
 tasks(len(pose_list),pose_list)

def marker_define():
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
 return marker


#vioce task模式
def vioce_tasks(pose_number,pose_list,orientation):
 marker_pub = rospy.Publisher('curse_markers', Marker, queue_size=1)
 marker=marker_define()
 #多个
 if type(pose_list) is list:
  tasks(pose_number,pose_list)
  marker.points=pose_list
  rospy.sleep(3)
  marker_pub.publish(marker)
 #单个
 else:
  move_base = actionlib.SimpleActionClient('move_base', MoveBaseAction)
  move_base.wait_for_server()
  goal = MoveBaseGoal()
  marker.points.append(pose_list.point)
  rospy.sleep(3)
  marker_pub.publish(marker)
  goal.target_pose.header.frame_id = pose_list.header.frame_id
  goal.target_pose.pose.position=pose_list.point
  goal.target_pose.pose.orientation=orientation
  move_base.send_goal(goal)

  move_base.wait_for_result(rospy.Duration.from_sec(30.0))
  state=move_base.get_state()
  if state==GoalStatus.SUCCEEDED:
   print 'Achieved Goal'
  else:
   print 'Fail to Achieve Goal'
   move_base.cancel_goal()
   twist(2,1,0.0)
   #vioce_tasks(pose_number,pose_list,orientation)#??????????
 return state

