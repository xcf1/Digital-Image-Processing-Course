import cv2
import numpy as np
import matplotlib.pyplot as plt
original = cv2.imread(r'F:/picture_python/lowpass.jpeg', 0)

dft = cv2.dft(np.float32(original), flags=cv2.DFT_COMPLEX_OUTPUT)   # 傅里叶变换
fshift = np.fft.fftshift(dft)    # 低频移至中心

# 定义高通滤波器
# 设置掩膜
rows, cols = original.shape
crow, ccol = int(rows / 2), int(cols / 2)   # 中心位置

mask = np.ones((rows, cols, 2), np.uint8)
mask[crow-30:crow+30, ccol-30:ccol+30] = 0

f = fshift * mask     # 将掩模与傅里叶变化后的图像相乘，保留四周部分，即保留高频部分

ishift = np.fft.ifftshift(f)       # 低频移回
img_back = cv2.idft(ishift)     # 傅里叶逆变换

img_back = cv2.magnitude(img_back[:, :, 0], img_back[:, :, 1])   # 频域转回空域

plt.subplot(121)
plt.title('original_img')
plt.axis('off')
plt.imshow(original, cmap='gray')

plt.subplot(122)
plt.title('filtering_img')
plt.axis('off')
plt.imshow(img_back, cmap='gray')

plt.show()
