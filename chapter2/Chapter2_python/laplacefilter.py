import cv2
import matplotlib.pyplot as plt


# 显示函数
def showImages(images):
    for i in range(len(images)):
        img = images[i]
        title = "(" + str(i + 1) + ")"
        # 行，列，索引
        plt.subplot(2, 3, i + 1)
        plt.imshow(img, cmap="gray")
        plt.title(title, fontsize=10)
        plt.xticks([])
        plt.yticks([])
    plt.show()


# 主函数
if __name__ == "__main__":
    image = cv2.imread("F:/picture_python/weixing.png", 0)
    imageLap3 = cv2.Laplacian(image, cv2.CV_64F, ksize=3)
    imageLap5 = cv2.Laplacian(image, cv2.CV_64F, ksize=5)
    imageLap7 = cv2.Laplacian(image, cv2.CV_64F, ksize=7)
    imageLap9 = cv2.Laplacian(image, cv2.CV_64F, ksize=9)
    imageLap11 = cv2.Laplacian(image, cv2.CV_64F, ksize=11)
    images = [image, imageLap3, imageLap5, imageLap7, imageLap9, imageLap11]
    showImages(images)