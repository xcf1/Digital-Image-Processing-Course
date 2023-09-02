f=imread('F:/picture_python/dog.png');
f=rgb2gray(f);
g1 = adapthisteq(f);
g2 = adapthisteq(f, 'NumTiles', [25 25]);
g3 = adapthisteq(f, 'NumTiles', [25 25], 'ClipLimit', 0.05);
subplot(221),imshow(f),title('原图像');
subplot(222),imshow(g1),title('默认值图像');
subplot(223),imshow(g2),title('设置参数NumTiles为[25 25]的图像');
subplot(224),imshow(g3),title('使用小片数量，且ClipLimit=0.05的图像');
