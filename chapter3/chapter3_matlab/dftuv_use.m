[U V] = dftuv(8,5);
DSQ = U.^2+V.^2
fftshift(DSQ)
D = hypot(U,V)