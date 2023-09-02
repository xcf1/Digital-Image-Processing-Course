f = imread('F:/picture_python/star.png')
f = tofloat(f);
imhist(f)
hf = imhist(f);
[Tf SMf] = graythresh(f);
gf = im2bw(f,Tf);
figure,imshow(gf)
w = [-1 -1 -1;-1 8 -1;-1 -1 -1];
lap = abs(imfilter(f,w,'replicate'));
lap = lap/max(lap(:));
figure,imhist(lap)
h = imhist(lap);
Q = percentile2i(h,0.995);
markerImage = lap > Q;
fp = f.*markerImage;
figure,imshow(fp)
hp = imhist(fp);
hp(1) = 0;
figure, bar(hp,0)
T = otsuthresh(hp);
g = im2bw(f,T);
figure,imshow(g)