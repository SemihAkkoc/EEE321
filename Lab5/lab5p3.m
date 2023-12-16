dur = mod(22103132, 7);
Ts = dur/5;
t = -dur/2:Ts/500:dur/2-Ts/500;

p1 = generateInterp(0,Ts,dur);
p2 = generateInterp(1,Ts,dur);
p3 = generateInterp(2,Ts,dur);

figure;

plot(t, p1);
xlabel('Time');
ylabel('Magnitude');
title('p_1(t) vs t Graph (Zero-Order Interpolation)');


figure;

plot(t, p2);
xlabel('Time');
ylabel('Magnitude');
title('p_2(t) vs t Graph (Linear Interpolation)');


figure;

plot(t, p3);
xlabel('Time');
ylabel('Magnitude');
title('p_3(t) vs t Graph (Ideal Interpolation)');

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