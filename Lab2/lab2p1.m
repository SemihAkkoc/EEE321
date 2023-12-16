% ------------------------------------ %
% VECTORS
% ------------------------------------ %

t = [0:0.001:1];
n = mod(22103132, 41);
A = 3*rand(n, 1, 'like', 1i);
omega = pi*rand(n, 1);
xs = SUMCS(t, A, omega);

% ------------------------------------ %
% PLOTS
% ------------------------------------ %

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
figure(3);
plot(t, angle(xs));
title('Xs Phase Part Plot');
ylabel('Xs Phase');
xlabel('Time');
figure(4);
plot(t, abs(xs));
title('Xs Magnitude Plot');
ylabel('Magnitude of Xs');
xlabel('Time');

% ------------------------------------ %
% FUNCTION
% ------------------------------------ %

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

