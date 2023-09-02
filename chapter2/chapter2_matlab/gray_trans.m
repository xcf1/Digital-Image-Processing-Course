f = imread('F:/picture_python/dog.png'); 
% 使用imadjust函数进行灰度变化前需要确保图像是灰度图
f1 = rgb2gray(f);
% 当high_out小于low_out时，会得到明安反转的图像（负片图像）
g1 = imadjust(f1,[0 1],[1 0],1);
% gamma值小于1，图更亮
g2 = imadjust(f1,[0 1],[0 1],0.5);
%gama值大于1，图像更暗
g3 = imadjust(f1,[0 1],[0 1],3);
% 将0.5到0.75之间的灰度扩展到整个区间[0,1]
g4 = imadjust(f1,[0.5 0.75],[0 1]);
% 使用stretchlim函数自适应选择灰度区间
g5 = imadjust(f1,stretchlim(f1),[0 1]);
% subplot是将多个图画到一个平面上的函数
subplot(2,3,1)
imshow(f1)
subplot(2,3,2)
imshow(g1)
subplot(2,3,3)
imshow(g2)
subplot(2,3,4)
imshow(g3)
subplot(2,3,5)
imshow(g4)
subplot(2,3,6)
imshow(g5)

