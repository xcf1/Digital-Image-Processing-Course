function g = gammaTransform(f,gamma) 
% G = INTRANS(F, ‘gamma’, GAM) performs a gamma transformation on 
% the input image using parameter GAM (a required input). 
%% 
% Based on Rafael C.Gonzalez, Richard E. Woods, Steven L. Eddins 
% Digital Image Processing Using MATLAB,Second Edition 
% Mender:Hua.Lin 
% Email:h_lin95@163.com 
% Version: 1.0 
% Date: 2015/08/27 
%%

g = imadjust(f, [], [], gamma);

end
