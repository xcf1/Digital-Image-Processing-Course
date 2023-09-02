f = imread('F:/picture_python/dog.png')
f = rgb2gray(f);
imshow(f)
h = fspecial('sobel');
fd = tofloat(f);
g = sqrt(imfilter(fd,h,'replicate').^2+ ...
    imfilter(fd,h,'replicate').^2);
figure,imshow(g)
L = watershed(g);
wr = L == 0;
figure,imshow(wr)
g2 = imclose(imopen(g,ones(3,3)),ones(3,3));
L2 = watershed(g2);
wr2 = L2 == 0;
f2 = f;
f2(wr2) == 255;
figure,imshow(f2)