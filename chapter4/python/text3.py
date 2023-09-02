import cv2
import numpy as np
import  cv2 as cv
from matplotlib import pyplot as plt
from text1 import imnoise2
def statmoments(p = None, n = None, nargout=None):
    Lp = len(p)
    if np.logical_and((Lp != 256),(Lp != 65536)):
        raise Exception('P必须是255或65536长度的向量')
    G = Lp - 1
    # �保直方图有单位面�，并将其��为列向量
    p = p / sum(p)
    p = p
    # 形成��包含�有可能的随机值向�
    z = np.arange(0,G+1)
    # 将z标准化到范围[0,1]
    z = z / G
    # 得到平均�
    m = z * p
    # 以均值为�心的随机变量
    z = z - m
    # 计算�心矩
    v = np.zeros((1,n))
    v[1] = m
    for j in np.arange(2,n+1).reshape(-1):
        v[j] = (z ** j) * p
    
    if nargout > 1:
        # 计算非中心矩
        unv = np.zeros((1,n))
        unv[1] = np.multiply(m,G)
        for j in np.arange(2,n+1).reshape(-1):
            unv[j] = ((z * G) ** j) * p
    
    return v,unv
    return v,unv
def roipoly(f, c, r):
    pass


def imhist(param):
    pass


def histroi(f=None, c=None, r=None, nargout=None):
    B = roipoly(f, c, r)
    p = imhist(f(B))
    if nargout > 1:
        npix = sum(B)

    return p, npix

# src = cv.imread("cc.jpg")              #读取图片
# cv.namedWindow("input image", cv.WINDOW_AUTOSIZE)  #创建GUI，显示图片
# cv.imshow("input image", src)                      #显示图片
# cv.waitKey(0)                                      #等待操作
# cv.destroyAllWindows()

# 读取图像 f
f = cv2.imread("cc.jpg", cv2.IMREAD_GRAYSCALE)
# 调用 roipoly 函数进行区域选择
B, c, r = roipoly(f)
# 调用 histroi 函数计算区域直方图
h, npix = histroi(f, c, r)
# 显示直方图
plt.figure()
plt.bar(range(len(h)), h)
plt.show()

# 调用 statmoments 函数计算统计矩
v, unv = statmoments(h, 2)
# 调用 imnoise2 函数生成噪声图像
x = imnoise2('gaussian', npix, 147, 20)
# 显示噪声图像的直方图
plt.figure()
plt.hist(x, bins=130)
plt.axis([0, 300, 0, 140])
plt.show()



