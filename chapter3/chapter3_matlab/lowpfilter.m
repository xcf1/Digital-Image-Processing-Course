f = imread('F:/picture_python/lowpass.jpeg')
[f,revertclass] = tofloat(f);
figure,imshow(f)
PQ = paddedsize(size(f));
[U,V] = dftuv(PQ(1),PQ(2));
D = hypot(U,V);
DO = 0.05*PQ(2);
F = fft2(f,PQ(1),PQ(2));
H = exp(-(D.^2)/(2*(DO^2)));
g = dftfilt(f,H);
g = revertclass(g);
figure,imshow(fftshift(H))
figure,imshow(log(1+abs(fftshift(F))),[])
figure,imshow(g)