[x,fs] = audioread('reinput.wav');
x_10sec = x(1:98304); % only taking a certain length of input
t = 0:1/8192:12-1/8192;
% soundsc(x,8192)

% creating delayed versions of the signal with circular shift

A = [0.65 0.5 0.3 0.22 0.15 0.1];
t_shift = [0.25 0.75 1 1.25 2 3.25];
len_xt = size(x_10sec);
echos = zeros(len_xt(2),6);
for ii = 1:6
    echo = circshift(x_10sec, t(ii)*8192);
    echo(1:t(ii)*8192-1)=zeros;
    echos(:, ii) = A(ii)*echo;
end

y = x_10sec;
% adding echos to y
for jj = 1:6
    y = y + echos(:, jj)';
end

omega = linspace(-8192*pi, 8192*pi, 98305);
omega = omega(1:98304);

Y = FT(y);
X_10sec = FT(x_10sec);

H=ones(1, length(omega));
% defining the H(jw) by using hand calculations
for ii = 1:6
    H = H + A(ii)*exp(-1i*omega*t_shift(ii));
end
% H=Y./X_10sec;
h = IFT(H);

Xe = Y./H;
xe = IFT(Xe);


% plot of x_10sec
% figure(1);
% plot(t, x_10sec);
% title('Plot of x(t)');
% xlabel('t, Time (seconds)');
% ylabel('x(t)');
% 
% % plot of y
% figure(2);
% plot(t, y);
% title('Plot of y(t)');
% xlabel('t, Time (seconds)');
% ylabel('y(t)');
% 
% % plot of frequency components of H(w)
% figure(3);
% plot(omega, abs(H));
% title('Plot of H(w)');
% xlabel('w, Frequency');
% ylabel('H(w)');
% 
% % plot of frequency components of h(t)
% figure(4);
% plot(t, h);
% title('Plot of h(t)');
% xlabel('t, Time (seconds)');
% ylabel('h(t)');
% 
% % plot of frequency components of Xe(w)
% figure(5);
% plot(omega, abs(Xe));
% title('Plot of Xe(w)');
% xlabel('w, Frequency');
% ylabel('Xe(w)');
% 
% % plot of frequency components of xe(t)
% figure(6);
plot(t, x_10sec);
title('Plot of xe(t)');
xlabel('t, Time (seconds)');
ylabel('xe(t)');

% to listen the xe
% soundsc(y, 8192)