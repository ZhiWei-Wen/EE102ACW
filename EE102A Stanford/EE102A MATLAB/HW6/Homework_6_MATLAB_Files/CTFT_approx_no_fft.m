function [X,omega] = CTFT_approx_no_fft(x,t)
% Approximates CT FT not using DFT. 
L = length(t);
deltat = t(2)-t(1);         % time increment
N = 16*L;                   % compute FT at N points
omega = (-N/2:(N/2)-1)*(2*pi)/(N*deltat);
X = zeros(size(omega));
for l = 1:L;
    X = X + deltat*x(l)*exp(-j*omega*t(l));
end
end

