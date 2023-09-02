f = imread('F:/picture_python/flower.jpg')
fp = padarray(f,[3 2],'replicate','post');
gmean = @(A) prod(A,1)/(size(A,1));
g = colfilt(f,[2 2],"sliding",@gmean );
imshow(g)