f = imread('F:/picture_python/weixing.png')
f = rgb2gray(f);
w = [-1 -1 -1;-1 8 -1;-1 -1 -1];
g = abs(imfilter(tofloat(f),w));
T = max(g(:));
g = g >= T;
figure,imshow(f)
figure,imshow(g)