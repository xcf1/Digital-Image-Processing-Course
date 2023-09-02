import cv2
image = cv2.imread('F:/picture_python/Thumb.png', cv2.IMREAD_GRAYSCALE)
maxval = 255
otsuThe = 0
otsuThe, dst_Otsu = cv2.threshold(image, otsuThe, maxval, cv2.THRESH_OTSU)
cv2.imshow('original',image)
cv2.imshow('Otsu', dst_Otsu)
cv2.waitKey(0)
cv2.destroyAllWindows()