H = fftshift(lpfilter('gaussian',500,500,500));
surf(double(H(1:10:500,1:10:500)))
axis tight
colormap(gray)
axis off
shading interp
