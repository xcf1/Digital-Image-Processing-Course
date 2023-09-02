w = fspecial('laplacian',0);
f = imread('F:/picture_python/weixing.png')
f = uint8(f);
subplot(2,2,1)
imshow(f)
g1 =  imfilter(f,w,'replicate');
subplot(2,2,2)
imshow(g1,[ ])
f2 = tofloat(f);
g2 = imfilter(f2,w,"replicate");
subplot(2,2,3)
imshow(g2,[ ])
g = f2-g2;
subplot(2,2,4)
imshow(g)