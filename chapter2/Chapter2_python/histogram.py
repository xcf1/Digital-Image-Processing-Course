import cv2
import numpy as np
from matplotlib import pyplot as plt
img = cv2.imread('F:\picture_python\high_contrast.png',0)
plt.hist(img.ravel(),256,[0,256],);
cv2.imshow('high_contrast.png',img)
plt.show()
