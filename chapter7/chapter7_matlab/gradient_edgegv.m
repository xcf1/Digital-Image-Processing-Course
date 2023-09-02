f = imread('F:/picture_python/star.png')
f = rgb2gray(f);
f = tofloat(f);
sx = fspecial('sobel');
sy = sx';
gx = imfilter(f,sx,'replicate');
gy = imfilter(f,sy,'replicate');
grad = sqrt(gx.*gx + gy.*gy);
grad = grad/max(grad(:));
figure,imhist(grad)
h = imhist(grad);
Q = percentile2i(h,0.999);
markerImage = grad > Q;
figure,imshow(markerImage)
fp = f.*markerImage;
figure,imshow(fp)
hp = imhist(fp);
hp(1) = 0;
bar(hp,0)
T = otsuthresh(hp);
T*(numel(hp)-1)
g = im2bw(f,T);
figure,imshow(g)
