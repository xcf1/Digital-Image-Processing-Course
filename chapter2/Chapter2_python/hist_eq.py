import numpy as np
import matplotlib.pyplot as plt
import cv2
img_src = cv2.imread('F:/picture_python/flower.jpg', 0)
img_dst = cv2.equalizeHist(img_src)

histSize = 512
histRange = (0, 256)
hist_src = cv2.calcHist([img_src], [0], None, [histSize], histRange)
hist_dst = cv2.calcHist([img_dst], [0], None, [histSize], histRange)

# 显示图像
fig, ax = plt.subplots(2, 2)
ax[0, 0].set_title('hist_src')
ax[0, 0].plot(hist_src)
ax[0, 1].set_title('hist_dst')
ax[0, 1].plot(hist_dst)
ax[1, 0].set_title('src')
ax[1, 0].imshow(cv2.cvtColor(img_src, cv2.COLOR_BGR2RGB), 'gray')
ax[1, 1].set_title('dst')
ax[1, 1].imshow(cv2.cvtColor(img_dst, cv2.COLOR_BGR2RGB), 'gray')
# ax[0,0].axis('off');ax[0,1].axis('off');
ax[1, 0].axis('off');
ax[1, 1].axis('off')  # 关闭坐标轴显示
plt.show()
