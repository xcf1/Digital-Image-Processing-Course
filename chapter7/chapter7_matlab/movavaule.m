f = imread('F:/picture_python/dog.png')
f = rgb2gray(f);
T = graythresh(f);
g1 = im2bw(f,T);
g2 = movingthresh(f,20,0.5);
figure,imshow(g2)
