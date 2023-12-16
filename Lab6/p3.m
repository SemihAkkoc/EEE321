id=[2,2,1,0,3,1,3,2];
n=zeros(8,1);
for ii=1:8
    if ii+2<=8
        n(ii)=id(ii+2);
    else
        n(ii)=id(ii+2-8);
    end
end

z1 = (n(2)+1i*n(3))/sqrt(n(2)^2+n(3)^2);
p1 = (n(1)+1i*n(5))/sqrt(1+n(1)^2+n(5)^2);
p2 = (n(8)+1i*n(6))/sqrt(1+n(6)^2+n(8)^2);

w=-pi:0.01:pi;
Hw=(exp(1i.*w)-z1)./((exp(1i.*w)-p1).*(exp(1i.*w)-p2));

% a=[(p1+p2)/(p1*p2), -1/(p1*p2)];
% b=[-z1/(p1*p2), 1/(p1*p2)];

a=[p1+p2,p1*p2];
b=[1,-z1];


plot(w,abs(Hw))
xlim([-pi,pi]);
title("Magnitude of H(\omega)")
xlabel("\omega")
ylabel("Magnitude")


% for 0<t<1
t=0:1/1400:1;
x=exp(1i*2*pi*(-700*t+(700)*t.^2));

y1=(DTLTI(a,b,x,length(x)));

figure;
subplot(3,2,1)
plot(t*pi,abs(y1))
xlim([-pi,pi]);
title("Magnitude of Output for 0 \leq t \leq1 ")
xlabel("\omega")
ylabel("Magnitude")

subplot(3,2,2)
plot(t*pi,angle(y1))
xlim([-pi,pi]);
title("Phase of Output for 0 \leq t \leq 1")
xlabel("\omega")
ylabel("Phase")


% for 0<t<10
t=0:1/1400:10;
x=exp(1i*2*pi*(-700*t+(70)*t.^2));

y2=(DTLTI(a,b,x,length(x)));

subplot(3,2,3)
plot(t*pi,abs(y2))
xlim([-pi,pi]);
title("Magnitude of Output for 0 \leq t \leq10 ")
xlabel("\omega")
ylabel("Magnitude")

subplot(3,2,4)
plot(t*pi,angle(y2))
xlim([-pi,pi]);
title("Phase of Output for 0 \leq t \leq 10")
xlabel("\omega")
ylabel("Phase")



% for 0<t<1000
t=0:1/1400:1000;
x=exp(1i*2*pi*(-700*t+(0.7)*t.^2));


y3=DTLTI(a,b,x,length(x));

subplot(3,2,5)
plot(t*pi,abs(y3))
xlim([-pi,pi]);
title("Magnitude of Output for 0 \leq t \leq1000 ")
xlabel("\omega")
ylabel("Magnitude")

subplot(3,2,6)
plot(t*pi,angle(y3))
xlim([-pi,pi]);
title("Phase of Output for 0 \leq t \leq 1000")
xlabel("\omega")
ylabel("Phase")
