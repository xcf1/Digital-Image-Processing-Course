f = imread('F:/picture_python/flower.jpg')
f = im2double(f);
w = ones(31);
% 使用默认相关
gd = imfilter(f,w);
subplot(2,2,1)
imshow(gd,[ ])
% boundary_options使用replicate
gr =imfilter(f,w,'replicate');
subplot(2,2,2)
imshow(gr,[ ])
% boundary_options使用symetric
gs = imfilter(f,w,"symmetric");
subplot(2,2,3),imshow(gs,[ ])
% boundary_options使用circular
gc = imfilter(f,w,'circular');
subplot(2,2,4),imshow(gc,[ ])


