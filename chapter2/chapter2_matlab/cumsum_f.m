f = imread('F:/picture_python/flower.jpg')
hnorm = imhist(f)./numel(f);
cdf = cumsum(hnorm);
x = linspace(0,1,256);
plot(x,cdf)
axis([0 1 0 1]);
set(gca,'xtick',0:.2:1)
set(gca,'ytick',0:.2:1)
xlabel('Imput intensity values','FontSize',9)
ylabel('Output intensity values','FontSize',9)

