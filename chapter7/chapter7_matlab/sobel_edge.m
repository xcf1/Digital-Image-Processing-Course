f = imread('F:/picture_python/dog.png')
f = rgb2gray(f);
[gv,t] = edge(f,'sobel','vertical');
imshow(gv)
t
gv = edge(f,'sobel',0.15,'vertical');
figure,imshow(gv)
gboth = edge(f,'sobel',0.15);
figure,imshow(gboth)
wneg45 = [-2 -1 0;-1 0 1;0 1 2];
wneg45
gneg45 = imfilter(tofloat(f),wneg45,'replicate');
T = 0.3*max(abs(gneg45(:)));
gneg45 = gneg45 >= T;
figure,imshow(gneg45)