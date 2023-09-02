function R = imnoise2(type,varargin)
[M,N,a,b]=setDefaults(type,varargin{:});
switch lower(type)
    case 'uniform'
        R=a+(b-a)*rand(M,N);
    case 'gaussian'
        R=a+b*randn(M,N);
    case 'salt & pepper'
        R=saltpepper(M,N,a,b);
    case 'lognormal'
        R=exp(b*randn(M,N)+a);
    case 'rayleigh'
        R=a+(-b*log(1-rang(M,N))).^0.5;
    case 'exponential'
        R=exponential(M,N,a);
    case 'erlang'
        R=erlang(M,N,a,b);
    otherwise
        error('Unknown distribution type.')
end