f = imread('F:/picture_python/dog.png')
f = rgb2gray(f);
[TGlobal] = graythresh(f);
gGlobal = im2bw(f,TGlobal);
imshow(gGlobal)
g = localthresh(f,ones(3),30,1.5,'global');
SIG = stdfilt(f,ones(3));
figure,imshow(SIG,[])
figure,imshow(g)