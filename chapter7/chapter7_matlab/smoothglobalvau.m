f = imread('F:/picture_python//dog.png')
fn = imnoise(f,'gaussian',0,0.038)
imshow(fn)
figure,imhist(fn)
Tn = graythresh(fn);
gn = im2bw(fn,Tn);
figure,imshow(gn)
% smooth the image and repeat
w = fspecial('average',5);
fa = imfilter(fn,w,'replicate');
figure,imshow(fa)
figure,imhist(fa)
Ta = graythresh(fa);
ga = im2bw(fa,Ta);
figure,imshow(ga)