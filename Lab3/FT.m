function output=FT(input)
M=size(input,2);
t=exp(j*pi*(M-1)/M*[0:1:M-1]);

output=exp(-j*pi*(M-1)^2/(2*M))*t.*1/(M)^0.5.*fft2(input.*t);