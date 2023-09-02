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
rm = imregionalmin(f)
figure,imshow(rm)
rm = imregionalmin(g);
figure,imshow(rm)
im = imextendedmin(f,2);
fim = f;
fim(im) = 175;
Lim = watershed(bwdist(im));
em = Lim == 0;
figure,imshow(em)
g2 = imimposemin(g,im | em);
figure,imshow(g2)
L2 = watershed(g2);
f2 = f;
f2(L2 == 0) = 255;
figure,imshow(f2)