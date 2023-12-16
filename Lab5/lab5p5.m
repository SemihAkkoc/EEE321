% create g(t)
Ts = 1/(20*randi([2,6]));
t = -3:Ts:3;

g = zeros(1,length(t));
g(2/Ts+1:3/Ts) = -2;
g(3/Ts+1) = 0;
g(3/Ts+2:4/Ts+1) = 3;

% plot g(n*Ts) in stem plot
stem(linspace(-3/Ts, 3/Ts, length(t)), g);

% generation of gr's
dur = 6;

gr1 = DtoA(0, Ts, dur, g);
gr2 = DtoA(1, Ts, dur, g);
gr3 = DtoA(2, Ts, dur, g);

figure;

plot(linspace(-3,3, length(gr1)), gr1);
xlabel('t');
ylabel('g_r1(t)');
title('Reconstruction g_r1(t) vs t Graph (Zero-Order Interpolation)');

figure;

plot(linspace(-3,3, length(gr2)), gr2);
xlabel('t');
ylabel('g_r2(t)');
title('Reconstruction g_r2(t) vs t Graph (Linear Interpolation)');

figure;

plot(linspace(-3,3, length(gr3)), gr3);
xlabel('t');
ylabel('g_r3(t)');
title('Reconstruction g_r3(t) vs t Graph (Ideal Interpolation)');

function [xR] = DtoA(type,Ts,dur,Xn)
    p = generateInterp(type, Ts, dur);
    l = length(Xn)*500+length(p);
    xR = zeros(1,l );
    for x = 1: length(Xn)
        xR(1+500*(x-1): 500*(x-1) + length(p)) = Xn(x)*p+ xR(1+500*(x-1): 500*(x-1) +length(p));
    end
    xR = xR(250*length(Xn)+1:end-250*length(Xn));
end

% generate interpolation function
function [p]=generateInterp(type,Ts,dur)
    t = -dur/2 : Ts/500 : dur/2 -Ts/500;
    % zero-order
    if type == 0
        p =zeros(1,length(t));
        p(t>=-1/2*Ts & t < 1/2*Ts) = 1;

    % linear
    elseif type == 1
        p = zeros(1, length(t));
        p(t>-Ts & t <Ts) = 1-abs(t(t>-Ts & t < Ts))/Ts;

    % ideal
    elseif type == 2
        p = sin(pi*t/Ts)./ (pi* t/Ts);
        p(t==0) = 1;
    end
end