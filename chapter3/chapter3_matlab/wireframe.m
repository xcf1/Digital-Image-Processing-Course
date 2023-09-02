H = fftshift(lpfilter('gaussian',500,500,500));
mesh(double(H(1:10:500,1:10:500)))
axis tight
colormap([0 0 0])
axis off
%view(-25,30),将观察者右移，保持仰角不变

view(-25,0)%保持方位角为-25°，仰角设置为0°