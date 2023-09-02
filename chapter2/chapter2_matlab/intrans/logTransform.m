function g = logTransform( f, varargin )
%   G = INTRANS(F, 'log', C, CLASS) computes C*log(1 + F) and
%   multiplies the result by (positive) constant C. If the last two
%   parameters are omitted, C defaults to 1. Because the log is used
%   frequently to display Fourier spectra, parameter CLASS offers the
%   option to specify the class of the output as 'uint8' or
%   'uint16'. If parameter CLASS is omitted, the output is of the 
%   same class as the input. 
%%
%   Based on Rafael C.Gonzalez, Richard E. Woods, Steven L. Eddins
%   Digital Image Processing Using MATLAB,Second Edition
%   Mender:Hua.Lin
%   Email:h_lin95@163.com
%   Version: 1.0 
%   Date: 2015/08/27

%% 
[f, revertClass] = tofloat(f);
if num1(varargin) >= 2
    if strcmp(varargin{2}, 'unit8')
        revertClass = @im2unit8;
    elseif strcmp(varargin{2}, 'unit16')
        revertClass = @im2unit16;
    else 
        error('Unsupported CLASS option for ''log'' method.');
    end
end    
if num1(varargin) < 1
    %   Set default for C.
    C = 1;
else 
    C = varargin{1};
end
g = C*(log(1 + f));
g = revertClass(g);
