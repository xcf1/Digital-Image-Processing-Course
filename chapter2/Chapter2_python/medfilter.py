import cv2 as cv

img = cv.imread('F:/picture_python/noise.png')  # 我的桌面上有个1.jpg
res = cv.medianBlur(img, 5)
cv.imshow("original", img)
cv.imshow("result", res)
cv.waitKey(0)
