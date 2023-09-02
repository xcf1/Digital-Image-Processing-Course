f = imread('F:/picture_python/dog.png')
f = rgb2gray(f);
fn = imnoise(f,'salt & pepper',0.2);
subplot(1,3,1),imshow(fn)
gm = medfilt2(fn);
subplot(1,3,2),imshow(gm )
gms = medfilt2(fn,'symmetric');
subplot(1,3,3),imshow(gms)