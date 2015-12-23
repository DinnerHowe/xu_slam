#!/usr/bin/env python
#encoding=utf-8
import roslib; roslib.load_manifest('rviz')
from nav_msgs.msg import OccupancyGrid
import rospy
import math


publisher = rospy.Publisher('map_test', OccupancyGrid,queue_size=5)
rospy.init_node('map_test')

grid = OccupancyGrid()

t = 0

f=open('/home/turtlebot2/mapdata/SingleScan.txt','r')
data,one_line=[],[]
for line in f.readlines():
 line=line.split(' ')
 #line=line.stripe()#去掉每行头尾空白
 for i in line:
  if i!='\n':
   one_line.append(int(i)) 
 data.extend(one_line)#list合并
#print data,len(data)
f.close()

while not rospy.is_shutdown():
 grid.header.frame_id = "/map"
 grid.header.stamp = rospy.Time.now()
 grid.info.map_load_time = rospy.Time.now()
 grid.info.resolution = 0.05
 grid.info.width = 288
 grid.info.height = 729
 grid.info.origin.position.x = -1#math.cos( t )
 grid.info.origin.position.y = -1#math.sin( t )
 grid.info.origin.orientation.w = 1.0
 grid.data = data

    # Publish the MarkerArray
 publisher.publish(grid)

 rospy.sleep(.05)
 #t += .1
