import cv2 as cv
import numpy as np
import matplotlib.pyplot as plt
def saltpepper(M, N, a, b):
    if (a + b) > 1:
        raise ValueError("The sum Pa + Pb must not exceed 1.")
    R = np.full((M, N), 0.5)
    X = np.random.rand(M, N)
    R[X <= a] = 0
    u = a + b
    R[(X > a) & (X <= u)] = 1
    return R
def exponential(M, N, a):
    if a <= 0:
        raise ValueError("Parameter a must be positive for exponential type.")

    k = -1 / a
    R = k * np.log(1 - np.random.rand(M, N))
    return R

def erlang(M, N, a, b):
    if (b != round(b)) or (b <= 0):
        raise ValueError('Param b must be a positive integer for Erlang.')

    k = -1 / a
    R = np.zeros((M, N))

    for j in range(b):
        random_matrix = np.random.rand(M, N)
        R += k * np.log(1 - random_matrix)

    return R

def setDefaults(type, *varargin):
    varargout = list(varargin)
    P = len(varargin)

    if P < 4:
        varargout.append(1)

    if P < 3:
        varargout.append(0)

    if P < 2:
        varargout.append(1)

    if P < 1:
        varargout.append(1)

    if P <= 2:
        if type == 'salt & pepper':
            varargout[2] = 0.05
            varargout[3] = 0.05
        elif type == 'lognormal':
            varargout[2] = 1
            varargout[3] = 0.25
        elif type == 'exponential':
            varargout[2] = 1
        elif type == 'erlang':
            varargout[2] = 2
            varargout[3] = 5

    return varargout

def imnoise2(type, *varargin):
    M, N, a, b = setDefaults(type, *varargin)

    if type.lower() == 'uniform':
        R = a + (b - a) * np.random.rand(M, N)
    elif type.lower() == 'gaussian':
        R = a + b * np.random.randn(M, N)
    elif type.lower() == 'salt & pepper':
        R = saltpepper(M, N, a, b)  # 需要实现saltpepper函数
    elif type.lower() == 'lognormal':
        R = np.exp(b * np.random.randn(M, N) + a)
    elif type.lower() == 'rayleigh':
        R = a + (-b * np.log(1 - np.random.rand(M, N))) ** 0.5
    elif type.lower() == 'exponential':
        R = exponential(M, N, a)  # 需要实现exponential函数
    elif type.lower() == 'erlang':
        R = erlang(M, N, a, b)  # 需要实现erlang函数
    else:
        raise ValueError('Unknown distribution type.')

    return R

r = imnoise2('gaussian', 100000, 1, 0, 1)
plt.hist(r.flatten(), bins=50)
plt.show()
