import cv2
from matplotlib import pyplot as plt
import numpy as np
# 11.21 使用 Laplace 边缘信息改进全局阈值处理
img = cv2.imread("F:/picture_python/bug.png", flags=0)

# # 全局阈值处理，作为参照比较
histCV1 = cv2.calcHist([img], [0], None, [256], [0, 256])  # 灰度直方图
ret1, imgOtsu = cv2.threshold(img, 127, 255, cv2.THRESH_OTSU)  # 阈值分割, thresh=T

# (1) 计算 Laplacian 梯度算子
laplace = cv2.Laplacian(img, cv2.CV_32F, ksize=3)  # Laplace 卷积算子
grad = cv2.convertScaleAbs(laplace)
gradMax = np.int_(np.max(grad))

# (2) 以灰度值的 99.5% 分位为阈值, 对边缘图像进行二值处理, 作为遮罩模板
per995 = np.percentile(grad, q=99.5)  # 99.5 分位的灰度值, [0, per995] 占比99.5%
_, gradPer995 = cv2.threshold(np.uint8(grad), per995, 1, cv2.THRESH_BINARY)  # 对边缘图像二值处理

# (3) 计算基于遮罩模板的直方图分布，以排除无效背景像素的影响
fp = np.uint8(img * gradPer995)
histCV2 = cv2.calcHist([fp], [0], None, [256], [0, 256])
histCV2[0] = 0  # fp 非零像素直方图

# (4) OTSU 算法计算 fp 非零像素的最佳分割阈值
# nonzeroPixels = np.count_nonzero(gradPer995)  # 非零像素总数
nonzeroPixels = sum(histCV2[1:])  # 非零像素总数
totalGray = np.dot(histCV2[:, 0], range(256))  # 内积, 总和灰度值
mG = totalGray / nonzeroPixels  # 平均灰度
icv = np.zeros(256)
numFt, sumFt = 0, 0
for t in range(0, 256):  # 遍历灰度值
    numFt += histCV2[t, 0]  # F(t) 像素数量
    sumFt += histCV2[t, 0] * t  # F(t) 灰度值总和
    pF = numFt / nonzeroPixels  # F(t) 像素数占比
    mF = (sumFt / numFt) if numFt > 0 else 0  # F(t) 平均灰度
    numBt = nonzeroPixels - numFt  # B(t) 像素数量
    sumBt = totalGray - sumFt  # B(t) 灰度值总和
    pB = numBt / nonzeroPixels  # B(t) 像素数占比
    mB = (sumBt / numBt) if numBt > 0 else 0  # B(t) 平均灰度
    icv[t] = pF * (mF - mG) ** 2 + pB * (mB - mG) ** 2  # OTSU 算法: 灰度 t 的类间方差
maxIcv = max(icv)  # ICV 的最大值
maxIndex = np.argmax(icv)  # 最大值的索引
print(per995, nonzeroPixels, maxIcv, maxIndex)

# 使用 fp 非零像素的最佳分割阈值，对原始图像进行固定阈值处理
ret, imgBin = cv2.threshold(img, maxIndex, 255, cv2.THRESH_BINARY)  # 以 maxIndex 作为最优阈值

plt.figure(figsize=(10, 7))
plt.subplot(231), plt.axis('off'), plt.title("Origin"), plt.imshow(img, 'gray')
plt.subplot(232, yticks=[]), plt.axis([0, 255, 0, np.max(histCV1)])
plt.bar(range(256), histCV1[:, 0]), plt.title("Gray Hist")
plt.subplot(233), plt.title("OTSU binary(T={})".format(round(ret1))), plt.axis('off')
plt.imshow(imgOtsu, 'gray')
plt.subplot(234), plt.axis('off'), plt.title("Threshold of Laplacian")
plt.imshow(gradPer995, cmap='gray')  # 遮罩模板，Laplacian 995 分位
plt.subplot(235, yticks=[]), plt.title("Hist of boundries")  # 直方图
plt.bar(range(256), histCV2[:, 0])
plt.subplot(236), plt.title("OTSU by Laplacian(T={})".format(maxIndex)), plt.axis('off')
plt.imshow(imgBin, 'gray')
plt.show()
