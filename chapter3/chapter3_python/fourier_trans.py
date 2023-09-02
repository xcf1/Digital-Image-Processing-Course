import cv2 as cv
import numpy as np
import matplotlib.pyplot as plt
plt.rcParams['font.sans-serif'] = ['SimHei']

src = cv.imread("F:/picture_python/dog.png", 0)

# OpneCV傅里叶变换函数 
# 需要将图像进行一次float转换
result = cv.dft(np.float32(src), flags=cv.DFT_COMPLEX_OUTPUT)
# 将频谱低频从左上角移动至中心位置
dft_shift = np.fft.fftshift(result)
# 频谱图像双通道复数转换为 0-255 区间
result1 = 20 * np.log(cv.magnitude(dft_shift[:, :, 0], dft_shift[:, :, 1]))
# 图像显示
plt.subplot(121), plt.imshow(src, 'gray'), plt.title('原图像')
plt.axis('off')
plt.subplot(122), plt.imshow(result1, 'gray'), plt.title('傅里叶变换')
plt.axis('off')
plt.show()
