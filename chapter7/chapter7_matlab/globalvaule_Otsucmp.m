f = imread('F:/picture_python/cell.jpg')
f1 = f;
[T,SM] = graythresh(f);
T
SM
T*255
g =im2bw(f,T/255);
imshow(g)
[T,SM] = graythresh(f1);
SM
T*255
g1 =im2bw(f1,T);
figure,imshow(g1)