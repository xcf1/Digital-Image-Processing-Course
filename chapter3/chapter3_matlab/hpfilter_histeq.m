f = imread('F:/picture_python/hist_match.png')
f = rgb2gray(f);
PQ = paddedsize(size(f));
DO = 0.05*PQ(1);
HBW = hpfilter('btw',PQ(1),PQ(2),DO,2);
H = 0.5+2*HBW;
gbw = dftfilt(f,HBW,'fltpoint');
gbw = gscale(gbw);
ghf = dftfilt(f,H,'fltpoint');
ghf = gscale(ghf);
ghe = histeq(ghf,256);
figure,imshow(f)
figure,imshow(gbw)
figure,imshow(ghf)
figure,imshow(ghe)