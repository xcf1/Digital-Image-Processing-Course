function [out,revertclass] = tofloat(in)
%   tofloat将输入转换为浮点型，使用fft2将会导致标定的问题。
%   revertclass将输出类型转化为和输入相同的类型
%   如果输入的图像不是single类型，tofloat将会将其转换为single类型
%
%   implement：将所有图像类型以及操作存储起来(cell)，通过函数句柄，将
%   非double和single的函数进行转化，将其转化为single类型的函数(im2single)
%
%   revertclass 通过im2xx将其转化为输入的类型
identity = @(x) x;
tosingle = @im2single;

table = {'uint8', tosingle, @im2uint8
    'uint16',tosingle,@im2uint16
    'int16',tosingle,@im2int16
    'logical',tosingle,@logical
    'double',identity,identity
    'single',identity,identity};

classIndex = find(strcmp(class(in),table(:,1)));
%   class(in) return the type of the input image, then compare with
%   the first column in the table(cell).

if isempty(classIndex)
    error('Unsupported input image class');
end
%   determine whether to find

out = table{classIndex,2}(in);

revertclass = table{classIndex,3};
