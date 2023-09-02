f = imread('F:/picture_python/weixing.png')
w4 = fspecial('laplacian',0);
w8 = [1 1 1;1 -8 1;1 1 1];
f = tofloat(f);
g4 = f - imfilter(f,w4,'replicate');
g8 = f - imfilter(f,w8,"replicate");
subplot(1,3,1)
imshow(f)
subplot(1,3,2)
imshow(g4)
subplot(1,3,3)
imshow(g8)