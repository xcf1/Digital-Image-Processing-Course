function f = spfilt(g,type,varargin)
[m,n,Q,d]=processInputs(varargin{:});
switch type
    case 'amean'
        w=fspecial('average',[m,n]);
        f=imfilter(g,w,'replicate');
    case 'gmean'
     f=gmean(g,m,n);
    case 'hmean'
        f=harmean(g,m,n);
    case 'chmean'
        f=charmean(g,m,n,Q);
    case 'median'
        f=medfilt2(g,[m,n],'symmetric');
    case 'max'
       f=imdilate(g,ones(m,n));
    case 'min'
        f=imerode(g,ones(m,n));
    case 'midpoint'
        f1=ordfilt2(g,1,ones(m,n),'symmetric');
        f2=ordfilt2(g,m*n,ones(m,n),'symmetric');
        f=imlincomb(0.5,f1,0.5,f2);
    case 'atrimmed'
        f=alphatrim(g,m,n,d);
    otherwise
        error('Unknow filter type')
end