figure;

D=mod(22103132,4);
M=5+D;
a=zeros(2,1);
b=zeros(M,1);

for ii=0:M-1
    b(ii+1)=exp(-ii);
end


% for 0<t<1
fs=1400;
t=0:1/fs:1;
x=cos(pi*(700*t.^2));

y1=DTLTI(a,b,x,length(x));

subplot(3,2,1)
plot(t*pi,abs(y1))
xlim([0,pi]);
title("Magnitude of Output for 0 \leq t \leq1 ")
xlabel("\omega")
ylabel("Magnitude")

subplot(3,2,2)
plot(t*pi,angle(y1))
xlim([0,pi]);
title("Phase of Output for 0 \leq t \leq 1")
xlabel("\omega")
ylabel("Phase")


% for 0<t<10
t=0:1/fs:10;
x=cos(pi*(70*t.^2));
y2=DTLTI(a,b,x,length(t));

subplot(3,2,3)
plot(t*pi,abs(y2))
xlim([0,pi]);
title("Magnitude of Output for 0 \leq t \leq10 ")
xlabel("\omega")
ylabel("Magnitude")

subplot(3,2,4)
plot(t*pi,angle(y2))
xlim([0,pi]);
title("Phase of Output for 0 \leq t \leq 10")
xlabel("\omega")
ylabel("Phase")



% for 0<t<1000
t=0:1/fs:1000;
x=cos(2*pi*(0.7*t.^2/2));

y3=DTLTI(a,b,x,length(x));

subplot(3,2,5)
plot(t*pi,abs(y3))
xlim([0,pi]);
title("Magnitude of Output for 0 \leq t \leq1000 ")
xlabel("\omega")
ylabel("Magnitude")

subplot(3,2,6)
plot(t*pi,angle(y3))
xlim([0,pi]);
title("Phase of Output for 0 \leq t \leq 1000")
xlabel("\omega")
ylabel("Phase")
