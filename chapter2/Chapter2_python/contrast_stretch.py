import cv2
import math
import numpy as np
def logTransform(c, img):
    # 3通道RGB
    '''h,w,d = img.shape[0],img.shape[1],img.shape[2]
    new_img = np.zeros((h,w,d))
    for i in range(h):
        for j in range(w):
            for k in range(d):
                new_img[i,j,k] = c*(math.log(1.0+img[i,j,k]))'''

    # 灰度图专属
    h, w = img.shape[0], img.shape[1]
    new_img = np.zeros((h, w))
    for i in range(h):
        for j in range(w):
            new_img[i, j] = c * (math.log(1.0 + img[i, j]))

    new_img = cv2.normalize(new_img, new_img, 0, 255, cv2.NORM_MINMAX)

    return new_img


# 替换为你的图片路径
img = cv2.imread(r'F:/picture_python/contrast_stretch.png', 0)
cv2.imshow('original_p',img)
log_img = logTransform(1.0, img)
cv2.imshow('log_img', log_img)
cv2.waitKey(0)
