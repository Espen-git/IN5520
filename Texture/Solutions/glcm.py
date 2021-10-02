from itertools import combinations_with_replacement

from PIL import Image
from numba import jit
from tqdm import tqdm

from img_utils import *


def contrast(matrix):
    return np.sum([matrix[i, j] * i * j for i, j in combinations_with_replacement(range(matrix.shape[0]), 2)])


def entropy(matrix):
    eps = 1e-6  # avoids invalid value problems
    return np.sum([-np.log(matrix[i, j] + eps) * ((matrix[i, j]) + eps) for i, j in
                   combinations_with_replacement(range(matrix.shape[0]), 2)])


@jit(nopython=True)
def glcm(quantized, dy, dx, gray_levels=256):
    glcm = np.zeros((gray_levels, gray_levels))
    for y in range(quantized.shape[0] - dy):
        for x in range(quantized.shape[1] - dx):
            px1 = quantized[y, x]
            px2 = quantized[y + dy, x + dx]
            glcm[px1, px2] += 1
    return glcm


def compute_glcm_features(image, window_size, dy, dx, gray_levels, feature_fn):
    feature_image = np.zeros(image.shape)
    quantized = requantize(image, gray_levels)
    for x, y, window in tqdm(SlidingWindowIter(quantized, window_size)):
        matrix = glcm(
            window, dy, dx, gray_levels
        )
        feature_image[y, x] = feature_fn(matrix)
    return feature_image


if __name__ == '__main__':
    image = np.asarray(Image.open("img_1.png").convert("L"))
    plt.imshow(image, cmap="gray")
    plt.show()
    # var_features = compute_glcm_features(image, 31, 0, 5, 8, np.var)
    # plt.imshow(var_features)
    # plt.title("Variance")
    # plt.show()
    #
    entr_features = compute_glcm_features(image, 31, 0, 5, 8, entropy)
    # plt.title("Entropy")
    # plt.imshow(entr_features)
    # plt.show()
    #
    # contrast_features = compute_glcm_features(image, 31, 0, 5, 8, contrast)
    # plt.title("Contrast")
    # plt.imshow(contrast_features)
    # plt.show()

    # plt.show()
