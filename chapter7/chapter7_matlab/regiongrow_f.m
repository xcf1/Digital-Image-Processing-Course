f = imread('F:/picture_python/dog.png')
f = rgb2gray(f);
[g,NR,SI,TI] = regiongrow(f,1,0.26);
imshow(g)
figure,imshow(SI)
figure,imshow(TI)