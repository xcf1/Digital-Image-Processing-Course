function R = saltpepper(M,N,a,b)
if(a+b)>1
    error('The sum Pa + Pb must not exceed 1.')
end
R(1:M,1:N)=0.5;
X=rand(M,N);
R(X<=a)=0;
u=a+b;
R(X>a & X<=u)=1;
end