#!/usr/bin/env python
#coding=utf-8
""" 
批量授权

Copyright (c) 2015 Xu Zhihao (Howe).  All rights reserved.

This program is free software; you can redistribute it and/or modify

This programm is tested on kuboki base turtlebot. 

"""
import os, rospy

class Empty_file(Exception):
 def __init__(self):
  Exception.__init__(self)

class codecounter():

 def __init__(self):
  while not rospy.is_shutdown():
   ws=''
   try:
    ws=raw_input("输入文件目录,该目录下所有python文件的代码量将会被授权处理:(eg: /home/turtlebot2/)\n")
    #ty=raw_input("输入要统计代码量的文件类型：(eg: py c c++ java)\n")
   except:
    break
   self.tot_code=0
   self.tot_line=0
   self.tot_others=0
   ty={'py':'python','srv':'service','msg':'message','xml':'package.xml','launch':'launch files','c':'c code','cpp':'c++ code','java':'java'}

   for filetype in ty:
    self.list=[]
    self.getfiles(ws,filetype)
    if len(self.list):
     print '\n','%s文件的个数:'%ty[filetype],len(self.list)
     #print '文件名：空行数 注释行数 代码行数 总行数'
    totle_code=0
    totle_line=0
    totle_others=0
   
    for now_file in self.list:
     self.linenumbers=self.get_linenumbers(now_file)
     if self.linenumbers:
      #print now_file,self.linenumbers
      totle_code+=self.linenumbers[2]
      totle_line+=self.linenumbers[3]
      totle_others+=(self.linenumbers[0]+self.linenumbers[1])

    if len(self.list):
     print '文件类型：',filetype
     print '代码量:',totle_code, '行数：',totle_line,'注释/空行：',totle_others,'\n'
    self.tot_code+=totle_code
    self.tot_line+=totle_line
    self.tot_others+=totle_others

   print '总代码量:',self.tot_code, '总行数：',self.tot_line,'注释/空行：',self.tot_others,'\n'


 def getfiles(self,root,format):
  for now_root,dirs,files in os.walk(root):
   if len(files)!=0:
    for now_file in files:
     now_format=now_file.split('.')[-1]
     if now_format==format:
      now_list=os.path.join(now_root,now_file)
      self.list.append(now_list)

 def get_linenumbers(self,now_file):
  line_blank=line_comment=line_code=0
  lines = False
  try:
   lines=open(now_file)
   if len(open(now_file).read())==0:
    raise Empty_file()
   else:
    for line in lines:
     line = line.lstrip()
     if not line:
      line_blank +=1
     elif line[0]=='#':
      line_comment +=1
     else:
      line_code +=1

    line_total=line_blank+line_comment+line_code
    linenumber=[line_blank,line_comment,line_code,line_total]
   return linenumber
  except IOError:
   print 'IOError!'
   return False
  except Empty_file:
   linenumber=[0,0,0,0]
   return linenumber
  finally:
   if lines:
    lines.close()

if __name__=='__main__':
  print "initialization system"
  codecounter()
  print "process done and quit"
