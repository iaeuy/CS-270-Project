import time
import numpy as np
import matplotlib.pyplot as plt
import skimage.io as skio
import skimage as sk
import scipy as sp
import cv2

from sklearn.feature_extraction import image as imm
from sklearn.cluster import spectral_clustering
from skimage import filters
from skimage.morphology import watershed
from skimage.feature import peak_local_max
from scipy import ndimage
from scipy.ndimage import label

N = 2
TARGET = "source/test.jpg"

image = sk.color.rgb2gray(sk.img_as_float(skio.imread(TARGET)))
im = sp.misc.imresize(image, 0.5) / 255.

mask = im.astype(bool)
graph = imm.img_to_graph(im, mask=mask)

# Spectral
t0 = time.time()
labels = spectral_clustering(graph, n_clusters=N)
t1 = time.time()
labels = labels.reshape(im.shape)
plt.figure(figsize=(8, 3.5))
plt.subplot(121)
plt.imshow(labels, cmap='gray')
plt.axis('off')
plt.subplot(122)
plt.imshow(im, cmap=plt.cm.gray)
for l in range(N):
    plt.contour(labels == l, contours=1,
                colors=[plt.cm.spectral(l / float(N))])
plt.xticks(())
plt.yticks(())
title = 'Spectral clustering: %.2fs' % ((t1 - t0))
print title
plt.title(title)
plt.tight_layout()
plt.show()

# # Histogram-based method
# t0 = time.time()
# mask = image < filters.threshold_otsu(image)
# edges = sk.segmentation.mark_boundaries(image, mask)
# t1 = time.time()
# plt.figure(figsize=(8, 3.5))
# plt.subplot(121)
# plt.imshow(mask, cmap='gray')
# plt.axis('off')
# plt.subplot(122)
# plt.imshow(edges)
# plt.axis('off')
# title = 'Histogram-based: %.2fs' % ((t1 - t0))
# plt.title(title)
# plt.tight_layout()
# plt.show()
#
# # Watershed segmentation
# def segment_on_dt(a, img):
#     border = cv2.dilate(img, None, iterations=5)
#     border = border - cv2.erode(border, None)
#
#     dt = cv2.distanceTransform(img, 2, 3)
#     dt = ((dt - dt.min()) / (dt.max() - dt.min()) * 255).astype(np.uint8)
#     _, dt = cv2.threshold(dt, 180, 255, cv2.THRESH_BINARY)
#     lbl, ncc = label(dt)
#     lbl = lbl * (255/ncc)
#     # Completing the markers now.
#     lbl[border == 255] = 255
#
#     lbl = lbl.astype(np.int32)
#     cv2.watershed(a, lbl)
#
#     lbl[lbl == -1] = 0
#     lbl = lbl.astype(np.uint8)
#     return 255 - lbl
#
#
# img = cv2.imread(TARGET)
#
# # Pre-processing.
# img_gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
# _, img_bin = cv2.threshold(img_gray, 0, 255,
#         cv2.THRESH_OTSU)
# img_bin = cv2.morphologyEx(img_bin, cv2.MORPH_OPEN,
#         np.ones((3, 3), dtype=int))
#
# t0 = time.time()
# result = segment_on_dt(img, img_bin)
# result[result != 255] = 0
# result = cv2.dilate(result, None)
# img[result == 255] = (0, 0, 255)
# t1 = time.time()
# plt.figure(figsize=(8, 3.5))
# plt.subplot(121)
# plt.imshow(result, cmap='gray')
# plt.axis('off')
# plt.subplot(122)
# plt.imshow(img)
# plt.axis('off')
# title = 'Watershed: %.2fs' % ((t1 - t0))
# plt.title(title)
# plt.tight_layout()
# plt.show()
