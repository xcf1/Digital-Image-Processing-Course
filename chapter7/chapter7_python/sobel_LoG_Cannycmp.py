import cv2
import numpy as np

img = cv2.imread('F:/picture_python/dog.png')  #导入图片，图片放在程序所在目录
cv2.namedWindow("imagshow", 2)   #创建一个窗口
cv2.imshow('imagshow', img)    #显示原始图片

#高斯模糊
blurred = cv2.GaussianBlur(img, (3, 3), 0)
#转换为灰度图
out_img_GRAY=cv2.cvtColor(blurred,cv2.COLOR_BGR2GRAY)#将图片转换为灰度图
cv2.namedWindow("img_GRAY", 2)   #创建一个窗口
cv2.imshow('img_GRAY', out_img_GRAY)    #显示原始图片


#使用Canny算子进行边缘检测
edge_output = cv2.Canny(out_img_GRAY, 10, 300)
cv2.namedWindow("Canny", 2)   #创建一个窗口
cv2.imshow('Canny', edge_output)    #显示原始图片


#使用sobel算子进行边缘检测
sobel = cv2.Sobel(out_img_GRAY,-1,1,0,ksize=3)
cv2.namedWindow("sobel", 2)   #创建一个窗口
cv2.imshow('sobel', sobel)    #显示原始图片


#使用laplacian算子进行边缘检测(Laplacian-of-Gaussian:log)
laplacian = cv2.Laplacian(out_img_GRAY,-1)
cv2.namedWindow("laplacian", 2)   #创建一个窗口
cv2.imshow('laplacian', laplacian)    #显示原始图片

cv2.waitKey()
