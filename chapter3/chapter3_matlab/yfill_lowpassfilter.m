f = imread('F:/picture_python/hist_match1.png')
f = rgb2gray(f);
f = tofloat(f);
PQ = paddedsize(size(f));% f is floating point
Fp = fft2(f,PQ(1),PQ(2));
Hp = lpfilter('gaussian',PQ(1),PQ(2),2*sig);
Gp = Hp.*Fp;
gp = ifft2(Gp);
gpc = gp(1:size(f,1), 1:size(f,2));
gpc = revertclass(gpc);
figure,imshow(f)
figure,imshow(gp)