import cv2
from matplotlib import pyplot as plt
import numpy as np
# 11.20 基于边缘信息改进全局阈值处理
img = cv2.imread("F:/picture_python/star.png", flags=0)

# # 全局阈值处理，作为参照比较
histCV1 = cv2.calcHist([img], [0], None, [256], [0, 256])  # 灰度直方图
totalPixels = img.shape[0] * img.shape[1]  # 像素总数
totalGray = np.dot(histCV1[:, 0], range(256))  # 内积, 总和灰度值
meanGray = round(totalGray / totalPixels)  # 平均灰度
ret, imgBin = cv2.threshold(img, meanGray, 255, cv2.THRESH_BINARY)  # thresh=meanGray

# (1) 计算 Sobel 梯度算子
SobelX = cv2.Sobel(img, cv2.CV_32F, 1, 0)  # 计算 x 轴方向
SobelY = cv2.Sobel(img, cv2.CV_32F, 0, 1)  # 计算 y 轴方向
grad = np.sqrt(SobelX ** 2 + SobelY ** 2)
gradMax = np.int_(np.max(grad))
# (2) 设置阈值 T=0.3*gradMax，对梯度图像进行阈值处理，作为遮罩模板
_, maskBW = cv2.threshold(np.uint8(grad), 0.3 * gradMax, 255, cv2.THRESH_BINARY)
# (3) 计算基于遮罩模板的直方图分布，以排除无效背景像素的影响

histCV2 = cv2.calcHist([img], [0], maskBW, [256], [0, 256])
histCV2[0] = 0
# (4) 排除无效背景像素影响后，进行阈值处理
Tmask = 120  # 观察直方图 histCV2，找到分割阈值
_, imgBin2 = cv2.threshold(img, Tmask, 255, cv2.THRESH_BINARY)

print(gradMax, meanGray)
plt.figure(figsize=(9, 6))
plt.subplot(231), plt.axis('off'), plt.title("Origin"), plt.imshow(img, 'gray')
plt.subplot(232, yticks=[]), plt.axis([0, 255, 0, np.max(histCV1)])
plt.bar(range(256), histCV1[:, 0]), plt.title("Gray Hist")
plt.subplot(233), plt.axis('off'), plt.title("Binary"), plt.imshow(imgBin, 'gray')
plt.subplot(234), plt.axis('off'), plt.title("Threshold of Sobel")
plt.imshow(maskBW, cmap='gray')
plt.subplot(235, yticks=[]), plt.title("Hist of boundries")  # 直方图
plt.bar(range(256), histCV2[:, 0])
plt.subplot(236), plt.axis('off'), plt.title("Binary by edge improved")
plt.imshow(imgBin2, 'gray')
plt.tight_layout()
plt.show()

