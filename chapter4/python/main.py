import cv2
import numpy as np
#读取图片:高斯噪声
img = cv2.imread('baby.jpg')
#设置高斯分布的均值和方差
mean = 0
#设置高斯分布的标准差
sigma = 0.05
image = np.array(img/255,dtype=float)
#根据均值和标准差生成符合高斯分布的噪声
gauss = np.random.normal(mean,sigma,image.shape)
#给图片添加高斯噪声
noisy_img = image + gauss
#设置图片添加高斯噪声之后的像素值的范围
if noisy_img.min()<0:
    low_clip=-1.
else:
    low_clip = 0.
noisy_img=np.clip(noisy_img,low_clip,1.0)
noisy_img=np.uint8(noisy_img*255)
imgs = np.hstack([img,noisy_img])
cv2.namedWindow('imgs', cv2.WINDOW_NORMAL)
cv2.imshow("imgs",imgs)
cv2.waitKey(0)
cv2.destroyAllWindows()
# src = cv.imread("cc.jpg")              #读取图片
# cv.namedWindow("input image", cv.WINDOW_AUTOSIZE)  #创建GUI，显示图片
# cv.imshow("input image", src)                      #显示图片
# cv.waitKey(0)                                      #等待操作
# cv.destroyAllWindows()
