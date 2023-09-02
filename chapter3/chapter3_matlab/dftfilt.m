function g = dftfilt(f, H, classout)
%用于频率域滤波的函数

% Convert the input to floating point.
[f, revertClass] = tofloat(f);

% Obtain the FFT of the padded input.
F = fft2(f, size(H,1), size(H,2));

% Perform filtering.
g = ifft2(H.*F);

% Crop to original size.
g = g(1:size(f,1),1:size(f,2)); % g is of class single here.

% Convert the output to the same class as the input if so specified.
if nargin == 2 || strcmp(classout, 'original')
    g = revertClass(g);
elseif strcmp(classout, 'fltpoint')
    return
else
    error('Undefined class for the output image.')
end
end