function varargout = setDefaults(type,varargin)
varargout=varargin;
P=numel(varargin);
if P<4
    varargout{4}=1;
end
if P<3
    varargout{3}=0;
end
if P<2
    varargout{2}=1;
end
if P<1
    varargout{1}=1;
end
if(P<=2)
    switch type
        case 'salt & pepper'
            varargout{3}=0.05;
            varargout{4}=0.05;
        case 'lognormal'
            varargout{3}=1;
            varargout{4}=0.25;
        case 'exponential'
            varargout{3}=1;
        case 'erlang'
            varargout{3}=2;
            varargout{4}=5;
    end
end