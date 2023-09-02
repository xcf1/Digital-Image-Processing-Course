function f = gmean(g,m,n)
[g,revertClass]=tofloat(g);
f=exp(imfilter(log(g),ones(m,n),'replicate')).^(1/m/n);
f=revertClass(f);
end