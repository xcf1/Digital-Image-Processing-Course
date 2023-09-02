f = imread('F:/picture_python//hough.jpg')
f = rgb2gray(f);
[H,theta,rho] = hough(f,'ThetaResolution',0.2);
imshow(H,[],'XData',theta,'YData',rho,'initialMagnification','fit');
axis on,axis normal
xlabel('\theta'),ylabel('\rho')
peaks = houghpeaks(H,5);
hold on
plot(theta(peaks(:,2)),rho(peaks(:,1)), ...
    'LineStyle','none','Marker','s ','Color','w')
lines =houghlines(f,theta,rho,peaks);
figure,imshow(f),hold on
for k = 1:length(lines)
    xy = [lines(k).point1 ; lines(k).point2];
    plot(xy(:,1),xy(:,2),'LineWidth',4,'Color',[.8 .8 .8]);
end    