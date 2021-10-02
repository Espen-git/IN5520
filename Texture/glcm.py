import numpy as np
import cv2
import matplotlib.pyplot as plt

def glcm(window, ngraylevels, dx=1, dy=1):
    cooc_matrix = np.zeros((ngraylevels, ngraylevels))
    m, n = np.size(window)

    for i in range(m - dy):
        for j in range(n - dx):
            a = window[i][j]
    
    return true

img1 = cv2.imread("zebra_1.tif", 0)
img2 = cv2.imread("zebra_2.tif", 0)
img3 = cv2.imread("zebra_3.tif", 0)
img4 = cv2.imread("zebra_4.tif", 0)
img5 = cv2.imread("zebra_5.tif", 0)
img6 = cv2.imread("zebra_6.tif", 0)

plt.imshow(img2, cmap="gray")
plt.show()