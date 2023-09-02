f = imread('F:/picture_python/dianlu.jpg')
w = [2 -1 -1;-1 2 -1;-1 -1 2];
g = imfilter(tofloat(f),w);
imshow(g,[])
gtop = g(1:120,1:120);
gtop = pixeldup(gtop,4);
figure,imshow(gtop,[])
gbot = g(end - 119:end, end - 119:end);
gbot =pixeldup(gbot,4);
figure,imshow(gbot,[])
g = abs(g);
figure,imshow(g,[])
T= max(g(:));
figure,imshow(g)