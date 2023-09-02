import cv2
import numpy as np
import matplotlib.pyplot as plt
import math

plt.rcParams['font.sans-serif'] = ['SimHei']  # 用来正常显示中文标签
plt.rcParams['axes.unicode_minus'] = False  # 用来正常显示负号


def low_pass_filtering(image, radius):
    """
    低通滤波函数
    :param image: 输入图像
    :param radius: 半径
    :return: 滤波结果
    """
    # 对图像进行傅里叶变换，fft是一个三维数组，fft[:, :, 0]为实数部分，fft[:, :, 1]为虚数部分
    fft = cv2.dft(np.float32(image), flags=cv2.DFT_COMPLEX_OUTPUT)
    # 对fft进行中心化，生成的dshift仍然是一个三维数组
    dshift = np.fft.fftshift(fft)

    # 得到中心像素
    rows, cols = image.shape[:2]
    mid_row, mid_col = int(rows / 2), int(cols / 2)

    # 构建掩模，256位，两个通道
    mask = np.zeros((rows, cols, 2), np.float32)
    mask[mid_row - radius:mid_row + radius, mid_col - radius:mid_col + radius] = 1

    # 给傅里叶变换结果乘掩模
    fft_filtering = dshift * mask
    # 傅里叶逆变换
    ishift = np.fft.ifftshift(fft_filtering)
    image_filtering = cv2.idft(ishift)
    image_filtering = cv2.magnitude(image_filtering[:, :, 0], image_filtering[:, :, 1])
    # 对逆变换结果进行归一化（一般对图像处理的最后一步都要进行归一化，特殊情况除外）
    cv2.normalize(image_filtering, image_filtering, 0, 1, cv2.NORM_MINMAX)
    return image_filtering

if __name__ == "__main__":
    image = cv2.imread("F:/picture_python/lowpass.jpeg", 0)
    image_low_pass_filtering5 = low_pass_filtering(image, 50)
    image_low_pass_filtering1 = low_pass_filtering(image, 10)
    plt.subplot(131), plt.imshow(image, 'gray'), plt.title("原图"), plt.xticks([]), plt.yticks([])
    plt.subplot(132), plt.imshow(image_low_pass_filtering5, 'gray'), plt.title("r=50像素的低通滤波"), plt.xticks(
        []), plt.yticks([])
    plt.subplot(133), plt.imshow(image_low_pass_filtering1, 'gray'), plt.title("r=10像素的低通滤波"), plt.xticks(
        []), plt.yticks([])
    plt.show()
