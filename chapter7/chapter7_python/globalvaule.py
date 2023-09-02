import cv2
image = cv2.imread('F:/picture_python/Thumb.png', cv2.IMREAD_GRAYSCALE)
the = 100   # 设置阈值为100
maxval = 255
dst, img = cv2.threshold(image, the, maxval, cv2.THRESH_BINARY)
cv2.imshow('original',image)
cv2.imshow('hand_thresh', img)
cv2.waitKey(0)
cv2.destroyAllWindows()