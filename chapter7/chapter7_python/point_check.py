import cv2
from matplotlib import pyplot as plt
import numpy as np
from scipy import signal

# 图像孤立点检测 (Laplace 算子)
imgGray = cv2.imread("F:/picture_python/weixing.png", flags=0)
hImg, wImg = imgGray.shape

kernelLaplace = np.array([[1, 1, 1], [1, -8, 1], [1, 1, 1]])  # Laplacian kernel
imgLaplace = signal.convolve2d(imgGray, kernelLaplace, boundary='symm', mode='same')  # same 卷积

# 在原图上用半径为 5 的圆圈标记角点
T = 0.9 * max(imgLaplace.max(), -imgLaplace.min())
imgPoint = np.zeros((hImg, wImg), np.uint8)  # 创建黑色图像
for h in range(hImg):
    for w in range(wImg):
        if (imgLaplace[h, w] > T) or (imgLaplace[h, w] < -T):
            imgPoint[h, w] = 255  # 二值处理
            cv2.circle(imgPoint, (w, h), 10, 255)

print(imgLaplace.shape, imgLaplace.max(), imgLaplace.min(), T)
plt.figure(figsize=(9, 6)) 
plt.subplot(131), plt.axis('off'), plt.title("Original")
plt.imshow(imgGray, cmap='gray', vmin=0, vmax=255)
plt.subplot(132), plt.axis('off'), plt.title("Laplacian K2")
plt.imshow(imgLaplace, cmap='gray', vmin=0, vmax=255)
plt.subplot(133), plt.axis('off'), plt.title("Isolated point")
plt.imshow(imgPoint, cmap='gray', vmin=0, vmax=255)
plt.tight_layout()
plt.show()
