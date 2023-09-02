f = imread('F:/picture_python/dog.png')
f = rgb2gray(f);
F = fft2(f);
Fc = fftshift(F)
S = abs(F);
figure,imshow(S,[])
Fc = abs(Fc);
figure,imshow(Fc,[])
S2 = log(1+abs(Fc));
figure,imshow(S2,[])