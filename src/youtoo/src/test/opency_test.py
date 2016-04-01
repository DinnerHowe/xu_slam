#!/usr/bin/env python
# -*- coding: utf-8 -*-
#这是摄像头的驱动
import cv2,rospy,sys

pwd=sys.path[0]
print pwd
rospy.init_node('camera', anonymous=True)
cap = cv2.VideoCapture(1)
ret, frame = cap.read()
n=0
while ret:
 ret, frame = cap.read()
 if ret == True:
  image = cv2.cvtColor(frame, cv2.COLOR_BGR2BGRA)
  cv2.imshow('youtoo',image)
 else:
  pass
 keyboard=cv2.waitKey(2)#delay 10ms
 if keyboard & 0xFF == ord('q'):
  break
 elif keyboard == ord('s'):
  n=n+1
  cv2.imwrite('%s/screenshot%s.jpg'%(pwd,n), image)
 else:
  pass
cap.release()
cv2.destroyAllWindows()

