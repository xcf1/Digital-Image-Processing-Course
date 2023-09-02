function g = specifiedTransform(f,txfun) 
% G = INTRANS(F, ‘specified’, TXFUN) performs the intensity 
% transformation s = TXFUN(r) where r are input intensities, s are 
% output intensities, and TXFUN is an insensity transformation (mapping) 
% function, expressed as a vector with values in the range [0, 1]. 
% TXFUN must have at least two values. 
% f is floating point with values in the range [0, 1]. 
%% 
% Based on Rafael C.Gonzalez, Richard E. Woods, Steven L. Eddins 
% Digital Image Processing Using MATLAB,Second Edition 
% Mender:Hua.Lin 
% Email:h_lin95@163.com 
% Version: 1.0 
% Date: 2015/08/27 
%% 
txfun = txfun(:); 
if any(txfun) >= 1 || any(txfun) <= 0 
    error('All elements of txfun must be in the range [0, 1].'); 
end
T = txfun; 
X = linspace(0, 1, nume1(T))'; 
g = interp1(X, T, f);

end
