f = imread('F:/picture_python/contrast_stretch.png');
g = im2uint8(mat2gray(log(1+double(f))));
subplot(1,2,1)
imshow(f)
subplot(1,2,2)
imshow(g)
