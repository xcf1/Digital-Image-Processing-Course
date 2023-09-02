function g = stretchTransform( f, varargin ) 
if isempty(varargin)
    m=mean2(f);
    E=4.0;
elseif length(varargin) == 2
    m = varargin{1};
    E = varargin{2};
else
    error('Incorrect number of inputs for the strtch method.')
end
g = 1./(1+(m./f).^E);
