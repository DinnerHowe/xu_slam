#!/usr/bin/env python
#coding=utf-8
""" 
批量授权
os.chmod('/Volumes/Leopard/Users/Caroline/Desktop/1.mp4',os.X_OK)   #修改权限为X

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""
import os, rospy, stat

class Empty_file(Exception):
 def __init__(self):
  Exception.__init__(self)

class chmod():
 def define(self):
  self.root_path=''
  self.file_list=[]
  ty=['py','launch']
  
  
 def __init__(self):
  self.define()
  while not rospy.is_shutdown():
   self.start()
   
 def start(self):
  self.root_path=raw_input("输入文件目录,该目录下所有python文件的代码量将会被授权处理:(eg: /home/turtlebot2/)\n")
  self.file_list=self.walker(self.root_path)
  self.chmod_x(self.file_list)
  
 def chmod_x(self,file_list):
  for i in file_list:
   #os.chmod('%s'%i,stat.S_IXOTH | stat.S_IROTH |stat.S_IWOTH | stat.S_IXUSR | stat.S_IRUSR |stat.S_IWUSR |stat.S_IXGRP | stat.S_IRGRP |stat.S_IWGRP)
   #OR
   os.chmod('%s'%i, 0O755)
   print i
   #os.chmod('%s'%i,stat.S_IXOTH)

 def walker(self,root_path,file_list=[]):
  self.files=os.listdir(root_path)
  for sub_dir in self.files:
   sub_path=os.path.join(root_path, sub_dir)
   if os.path.isfile(sub_path):
    file_list.append(sub_path)      
   if os.path.isdir(sub_path):
    self.walker(sub_path)  
  return file_list
   

if __name__=='__main__':
  print "initialization system"
  chmod()
  print "process done and quit"
