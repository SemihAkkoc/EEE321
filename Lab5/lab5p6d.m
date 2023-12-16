D = mod(22103132, 7);
Ts = 0.099;
t_continuous = -2:Ts/1000:2; 
t_sampling = -2:Ts:2;


x = 0.25*cos(2*pi*3*t_continuous+pi/8)+0.4*cos(2*pi*5*t_continuous-1.2)+0.9*cos(2*pi*t_continuous+pi/4);
Xn = 0.25*cos(2*pi*3*t_sampling+pi/8)+0.4*cos(2*pi*5*t_sampling-1.2)+0.9*cos(2*pi*t_sampling+pi/4);


plot(t_continuous,x);
hold on;
stem(t_sampling, Xn);
title("Sampling x when Ts = 0.099");
ylabel("Magnitude");
xlabel("Time");
hold off;

t_continuous = -2:Ts/500:2-Ts/500;

figure;
xR = DtoA(0, Ts, 4, Xn);
plot(t_continuous, xR);
title(" Zero order Recovery of x when Ts = 0.099");
ylabel("Magnitude");
xlabel("Time");

figure;
xR = DtoA(1, Ts, 4, Xn);
plot(t_continuous, xR);
title(" Linear Recovery of x when Ts = 0.099");
ylabel("Magnitude");
xlabel("Time");

figure;
xR = DtoA(2, Ts, 4, Xn);
plot(t_continuous, xR);
title(" Ideal Recovery of x when Ts = 0.099");
ylabel("Magnitude");
xlabel("Time");


function [xR] = DtoA(type,Ts,dur,Xn)
    p = generateInterp(type, Ts, dur);
    l = length(Xn)*500+length(p);
    xR = zeros(1,l );
    for x = 1: length(Xn)
        xR(1+500*(x-1): 500*(x-1) + length(p)) = Xn(x)*p+ xR(1+500*(x-1): 500*(x-1) +length(p));
    end
    xR = xR(250*length(Xn)+1:end-250*length(Xn));
end


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