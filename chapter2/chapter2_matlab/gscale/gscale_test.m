f=imread('F:/picture_python/dog.png');
g = gscale(f,'minmax',0,0.6);
subplot(1,2,1)
imshow(f)
subplot(1,2,2)
imshow(g)