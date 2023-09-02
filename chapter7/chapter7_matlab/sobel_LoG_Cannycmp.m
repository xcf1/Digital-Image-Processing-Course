f =imread('F:/picture_python/hough.jpg')
f = rgb2gray(f);
f = tofloat(f);
[gSobel_default,ts] = edge(f,'sobel');
figure,imshow(gSobel_default)
[gLoG_default,tlog] = edge(f,'log');
figure,imshow(gLoG_default)
[gCanny_default,tc] = edge(f,'canny');
figure,imshow(gCanny_default)
gSobel_best = edge(f,'sobel',0.05);
figure, imshow(gSobel_best)
gLoG_best = edge(f,'log',0.003,2.25);
figure,imshow(gLoG_best)
gCanny_best = edge(f,'canny',[0.04 0.10],1.5);
figure,imshow(gCanny_best)
