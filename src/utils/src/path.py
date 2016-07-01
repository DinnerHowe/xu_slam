#!/usr/bin/env python
"""
this file obtain root path

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.
This program is free software; 
you can redistribute it and/or modify This programm is tested on kuboki base turtlebot. 
"""
import os,rospy
import getpass

class path_walker():

 def __init__(self):
  rospy.init_node('single_asus_robot_total')
  self.folders=''
  self.filenumber=0
  self.file_tree=[]
  self.workspace_path=''
  self.exist=True
  self.generate_file_tree=False #set it to true if you wanna get a file tree
  
  usr_name=getpass.getuser()
  self.root_path='/home/%s/'%usr_name
  #print 'root_path: %s'%self.root_path
  self.folders=self.root_path
  self.walker(self.root_path)
  print '\nobtain workspace_path :', self.workspace_path
  
  try:
   self.ReadPath(self.workspace_path,'path')
  except:
   self.exist=False
   
  if not self.exist:
   self.WritePath(self.workspace_path,'path')
  else:
   pass
   
  if self.generate_file_tree:
   self.WritePath(self.file_tree,'file_tree')  
  
 def walker(self, path):
  self.files=os.listdir(path)
  self.filenumber=0

  if 'finish_tool.cpp' in self.files:
   print 'Founding Probability workspace_path : %s'%path
   if 'Desktop' not in path:
    if 'DataOS' not in path:
     self.workspace_path=path
     #return workspace_path
    else:
     print '\nFilter OUT Backup: ',path
   else:
    pass
     
  for dir_name in self.files:
  
   self.filenumber+=1
   if self.filenumber>len(self.files):
    self.out_of_range=True
    
   try:
    sub_path=os.path.join(path, dir_name)
    #print os.path.isdir(sub_path),'  dir_name: %s'%sub_path
    
    if os.path.isfile(sub_path) and self.generate_file_tree:
     self.file_tree.append(self.folders+"|__"+ dir_name +"\n") 
     
    elif os.path.isdir(sub_path):
     if self.generate_file_tree:
      self.file_tree.append(self.folders+"|__"+ dir_name +"\n") 
      self.folders+='|'
     #print 'sub_path: %s'%sub_path
    #print self.file_tree
     self.walker(sub_path)  
    else:
     pass
     
   except:
    if not self.out_of_range:
     sub_path=os.path.join(path, self.files[self.filenumber])
     self.walker(sub_path)
    else:
     pass
 
 def ReadPath(self,path,filename):
  if type(path) is str:
   root_path=path.split('rviz_my_tools')[0]
  else:
   root_path=path
  f=open('%s%s.txt'%(self.root_path,filename),'r')
  rospy.loginfo('Fouding an existed %s.txt", Checking Root Path'%filename)
  existed_path=f.readlines()[0]
  if existed_path==root_path:
   rospy.loginfo('%s.txt is already existed'%filename)
   self.exist=True
  else:
   rospy.loginfo('Existed %s.txt Contain a Wrong Root Path, Perpare to Write New %s.txt'%(filename,filename))
   self.exist=False
  f.close()
   
   
 def WritePath(self,path,filename):
  if type(path) is str:
   root_path=path.split('rviz_my_tools')[0]
  else:
   root_path=path
  rospy.loginfo ( "Generating Root Path : %s"%root_path )
  f = open('%s%s.txt'%(self.root_path,filename),'w')
  f.writelines(root_path)
  rospy.loginfo ( "Root Path was Writen into file: %s.txt"%filename )
  f.close() 

if __name__=='__main__':
 try:
  rospy.loginfo ("initialization system")
  path_walker()
  rospy.loginfo ("process done and quit")
 except rospy.ROSInterruptException:
  rospy.loginfo("robot twist node terminated.")
