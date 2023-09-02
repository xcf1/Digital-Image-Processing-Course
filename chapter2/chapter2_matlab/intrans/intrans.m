function g = intrans(f, method,varargin)
%INTRANS Performs intensity (gray-level) transformations.
%   G = INTRANS(F, 'neg') computes the negative of input image F.
% 
%   G = INTRANS(F, 'log', C, CLASS) computes C*log(1 + F) and
%   multiplies the result by (positive) constant C. If the last two
%   parameters are omitted, C defaults to 1. Because the log is used
%   frequently to display Fourier spectra, parameter CLASS offers the
%   option to specify the class of the output as 'uint8' or
%   'uint16'. If parameter CLASS is omitted, the output is of the 
%   same class as the input. 
% 
%   G = INTRANS(F, 'gamma', GAM) performs a gamma transformation on
%   the input image using parameter GAM (a required input).  
%
%   G = INTRANS(F, 'stretch', M, E) computes a contrast-stretching
%   transformation using the expression 1./(1 + (M./(F +
%   eps)).^E).  Parameter M must be in the range [0, 1].  The default
%   value for M is mean2(im2double(F)), and the default value for E
%   is 4.

%   G = INTRANS(F, 'specified', TXFUN) performs the intensity 
%   transformation s = TXFUN(r) where r are input intensities, s are 
%   output intensities, and TXFUN is an insensity transformation (mapping)
%   function, expressed as a vector with values in the range [0, 1].
%   TXFUN must have at least two values.
%
%
%   For the 'neg', 'gamma', 'stretch' and 'specified' transformations, 
%   floating-point input images whose values are outside the range [0, 1]
%   are scaled first using MAT2GRAT. Other images are converted to 
%   floating-point using TOFLOAT. for the 'log' transformation,
%   floating-point images are transformed without being scaled; Other 
%   images are converted to floating-point first using TOFLOAT.
% 
% 
%   The output is of the same class as the input, except if a
%   different class is specified for the 'log' option.
%%
%   Based on Rafael C.Gonzalez, Richard E. Woods, Steven L. Eddins
%   Digital Image Processing Using MATLAB,Second Edition
%   Mender:Hua.Lin
%   Email:h_lin95@163.com
%   Version: 1.0 
%   Date: 2015/08/27  
%%

% Verify the correct number of inputs.
error(nargchk(2, 4,nargin))
if strcmp(method,'log')
%   The log transform handles image classes differently than the other 
%   transform, so let the LOGTRANSFORM function handles that and then 
%   return.
    g=logtransform(f,varargin{:});
    return;
end

%   If f is floating point, check to see if it is in the range [0,1].
%   If it is not, force it to be using function mat2gray.
if isfloat(f) && (max(f(:))>1 || min(f(:))<0)
    f=mat2gray(f);
end


%   Store the class of the input for use later.
[ f, revertClass ] = tofloat( f );


%   Perform the intensity transformation specified.    
switch method
    case 'neg'
        g = imcomplement(f);  
    case 'gamma'
        g = gammaTransform(f,varargin{:});
    case 'stretch'
        g = stretchTransform( f, varargin{:});
    case 'specified'
        g = specifiedTransform(f,varargin{:});
    otherwise
        error('Unknown enhancement method.');
end

% Convert to the class of the input image.
g = revertClass(g); 
