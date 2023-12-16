M=5+mod(22103132,4);

w=-pi:0.01:pi;
h=zeros(length(w),1);
n=1;
for ii=-pi:0.01:pi
    h(n)=(1-exp(-(M+1)*(1+1i*ii)))/(1-exp(-(1+1i*ii)));
    n=n+1;
end

w=-pi:0.01:pi;
plot(w,abs(h));
title('Frequency Response');
xlabel('\omega');
ylabel('H(e^{i \omega})');