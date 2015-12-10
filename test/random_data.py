import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as animation
import rospy,Queue,threading
from rplidar_python.msg import rplidar_point


x_data=Queue.Queue()
y_data=Queue.Queue()

x_list,y_list=[],[]
x,y=[],[]

fig, ax = plt.subplots()
line, = ax.plot([],[],linestyle="none",marker=".",markersize=3,markerfacecolor="blue")
ax.grid()

def init():
 ax.set_title('rplidar map')
 ax.set_xlabel('x value in meter')
 ax.set_ylabel('y value in meter')
 ax.set_xlim([-5000, 5000])
 ax.set_ylim([-5000, 5000])
 line.set_data(x, y)
 return line,

def data_gen(x_list=[],ylist=[]):
 rospy.init_node('rplidar_driver_xy_sub', anonymous=False)
 rospy.Subscriber("rplidar_driver_xy", rplidar_point, callback)

def callback(data):
 point_arry=eval(data.point)
 print point_arry, len(point_arry)
 for i in range(len(point_arry)):
  x_list.append(point_arry[i][0])
  y_list.append(point_arry[i][1])
 x_data.put(x_list)
 y_data.put(y_list)

 x=x_data.get()
 y=y_data.get()
 ax.figure.canvas.draw()
 line.set_data(x,y)
 return line,

ani = animation.FuncAnimation(fig, callback, data_gen, blit=False, interval=100,
                              repeat=False, init_func=init)
plt.show()
