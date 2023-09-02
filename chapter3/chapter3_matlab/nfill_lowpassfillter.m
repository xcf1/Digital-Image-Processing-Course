f = imread('F://picture_python/hist_match1.png')
f = rgb2gray(f);
[M N] = size(f);
[f,revertclass] = tofloat(f);
F = fft2(f);
sig = 10;
H = lpfilter('gaussian',M,N,sig);
G = H.*F;
g = ifft2(G);
g = revertclass(g);
figure,imshow(f)
figure,imshow(g)