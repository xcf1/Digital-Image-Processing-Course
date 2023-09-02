f = imread('F:/picture_python/increase.jpg');
g = intrans(f, 'stretch', mean2(tofloat(f)), 0.9);
subplot(1,2,1)
imshow(f)
subplot(1,2,2)
imshow(g)
