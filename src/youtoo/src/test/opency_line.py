#!/usr/bin/env python
# -*- coding: utf-8 -*-
#这是人脸画方框的
import cv2,rospy,sys,TencentYoutuyun

appid='1006764'
secret_id='AKIDpdRGbfu0xUBIVopeTcyZDl6XJDhJkvSX'
secret_key='qBoz9EAcjM2ajISB0uQdV11EYD86xOY3'
userid='Howe'
end_point = TencentYoutuyun.conf.API_YOUTU_END_POINT 

youtu = TencentYoutuyun.YouTu(appid, secret_id, secret_key, userid, end_point)

pwd = sys.path[0]

person_id = 'Howe'
image_path = pwd
group_ids = 'local'
person_name = 'Howe'
tag ='Howe'

#新人的脸,可以之后现场截图
new_images='%s/screenshot1.jpg'%pwd

faceshape_result = youtu.FaceShape(new_images)
print '\n\nfaceshape_result'
for i in faceshape_result:
 if 'face_shape' in i:
  faceshape=dict(faceshape_result[i][0])
  for j in faceshape:
   print '   ',j,':',faceshape[j]
  continue
 print i,':',faceshape_result[i] 

#检测人脸
detect_result = youtu.DetectFace('%s/screenshot1.jpg'%pwd)
 
print '\n\ndetect_result'
for i in detect_result:
 if 'face' in i:
  face=dict(detect_result[i][0])
  for j in face:
   print '   ',j,':',face[j]
  continue
 print i,':',detect_result[i] 

#检测是否人脸在人脸库中
varify_result = youtu.FaceVerify(userid,'%s/screenshot1.jpg'%pwd)

print '\n\nvarify_result'
for i in varify_result:
 print i,':',varify_result[i]

if varify_result['errormsg']=='ERROR_PERSON_NOT_EXISTED':
 print '\n\nregisting...'
 #注册人到人脸库中
 register_result = youtu.NewPerson(person_id, image_path, group_ids, person_name, tag)

 print '\n\nregister_result'
 for i in register_result:
  print i,':',register_result[i]

 #注册人脸到人脸库中
 addface_result = youtu.AddFace(person_id, new_images)

 print '\n\naddface_result'
 for i in addface_result:
  print i,':',addface_result[i]

 else:
  pass

#对比两张人脸
compare_result = youtu.FaceCompare('%s/screenshot1.jpg'%pwd,'%s/screenshot2.jpg'%pwd)

print "\n\ncompare"
for i in compare_result:
 print i,':',compare_result[i]
 


