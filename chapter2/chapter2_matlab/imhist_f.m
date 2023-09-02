 %条形图
f = imread('F:/picture_python/dog.png')
h = imhist(f,25);
horz = linspace(0,255,25);
subplot(1,3,1)
bar(horz, h, 1)
axis([0 255 0 60000])
set(gca,'xtick',0:50:255)
set(gca,'ytick',0:20000:60000)
%杆状图
h1 = imhist(f,25);
horz1 = linspace(0,255,25);
subplot(1,3,2)
stem(horz1, h1,'b-o')
axis([0 255 0 60000])
set(gca,'xtick',[0:50:255])
set(gca,'ytick',[0:20000:60000])
%用直线将点连起来
h2 = imhist(f);
plot(h2)%使用默认值
subplot(1,3,3)
axis([0 255 0 15000])
set(gca,'xtick',[0:50:255])
set(gca,'ytick',[0:2000:15000])