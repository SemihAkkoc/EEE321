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