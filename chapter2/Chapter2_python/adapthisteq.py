import cv2 as cv

src = cv.imread("F:/picture_python/dog.png")
# 1. 全局直方图均衡化
def globalEqualHist(image):
    # 如果想要对图片做均衡化，必须将图片转换为灰度图像
    gray = cv.cvtColor(image, cv.COLOR_BGR2GRAY)
    dst = cv.equalizeHist(gray )  # 在说明文档中有相关的注释与例子
    # equalizeHist(src, dst=None)函数只能处理单通道的数据,src为输入图像对象矩阵，必须为单通道的uint8类型的矩阵数据
    # dst: 输出图像矩阵(src的shape一样)
    cv.imshow("global equalizeHist", dst)
globalEqualHist(src)
cv.imshow("original image", src)
cv.waitKey(0)
cv.destroyAllWindows()
