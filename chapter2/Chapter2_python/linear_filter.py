import cv2
from matplotlib import pyplot as plt
import numpy as np
image = cv2.imread(r"F:/picture_python/flower.jpg", cv2.IMREAD_GRAYSCALE)
# 均值滤波(线性)
blur_image = cv2.blur(image, (5, 5))
# 高斯滤波(线性)
gaussian_image = cv2.GaussianBlur(image, (5, 5), 0.8)

plt.subplot(131), plt.imshow(image, 'gray'), plt.title('original')
plt.subplot(132), plt.imshow(blur_image, 'gray'), plt.title('blur_image')
plt.subplot(133), plt.imshow(gaussian_image, 'gray'), plt.title('gaussian_image')
plt.show()
