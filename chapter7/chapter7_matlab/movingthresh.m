function g = movingthresh(f,n,k)
f = tofloat(f);
[M,N] = size(f);
if (n < 1) || (rem(n,1) ~= 0)
    error('n must be an integer >= 1.')
end
if k < 0 || k > 1
    error('k must be a fraction in the range [0,1].')
end

f(2:2:end,:) = fliplr(f(2:2:end,:));
f = f';
f = f(:)';
maf = ones(1,n)/n;
ma = filter(maf,1,f);
g = f > k * ma;
g = reshape(g,N,M)';
g(2:2:end,:) = fliplr(g(2:2:end,:));
