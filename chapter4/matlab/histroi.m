function [p,npix] = histroi(f,c,r)
B=roipoly(f,c,r);
p=imhist(f(B));
if nargout>1
    npix=sum(B(:));
end