D11=mod(22103132,11);
D5=mod(22103132,5);
T=2;
W=1;
K=20+D11;
t=[-5:0.001:5];
xs=FSWave(t, K, T, W);

figure(1);
plot(t, real(xs));
title('Xs Real Part Plot');
ylabel('Xs Real Part Values');
xlabel('Time');
figure(2);
plot(t, imag(xs));
title('Xs Imaginary Part Plot');
ylabel('Xs Imaginary Part Values');
xlabel('Time');

K=2+D5;
xs=FSWave(t, K, T, W);
figure(3);
plot(t, real(xs));
title('Xs Real Part Plot');
ylabel('Xs Real Part Values');
xlabel('Time');

K=7+D5;
xs=FSWave(t, K, T, W);
figure(4);
plot(t, real(xs));
title('Xs Real Part Plot');
ylabel('Xs Real Part Values');
xlabel('Time');

K=15+D5;
xs=FSWave(t, K, T, W);
figure(5);
plot(t, real(xs));
title('Xs Real Part Plot');
ylabel('Xs Real Part Values');
xlabel('Time');

K=50+D5;
xs=FSWave(t, K, T, W);
figure(6);
plot(t, real(xs));
title('Xs Real Part Plot');
ylabel('Xs Real Part Values');
xlabel('Time');

K=100+D5;
xs=FSWave(t, K, T, W);
figure(7);
plot(t, real(xs));
title('Xs Real Part Plot');
ylabel('Xs Real Part Values');
xlabel('Time');


function[xt]=FSWave(t,K,T,W)
    % t is time grid
    % xt is the values of x~t over t
    % K, T, W are parameters
    syms x;
    integral1=0;
    A=zeros(2*K,1);
    omega=zeros(2*K,1);
    for ii=0:1:2*K
        f=(1-2*x*x)*exp(-1i*2*pi*(ii-K)*x/T);
        integral1=int(f,x,-W/2, W/2)/T;
        A(ii+1)=integral1;
        omega(ii+1)=2*pi*(ii-K)/T;
    end
    xt=SUMCS(t,A,omega);
end

function[xs]=SUMCS(t,A,omega)
    % t: 1xN vector
    % A: 1XM complex-valued vector
    % omega: 1xM vector
    xs = 0;
    if length(A)==length(omega)
        for ii = 1:1:length(omega)
            xs=xs+A(ii)*exp(1i*omega(ii)*t);
        end
    end
end