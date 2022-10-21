function [X,omega] = CTFT_approx(x,t)
% Approximates CT FT using DFT. See EE 102B reader pp. 96-104.
L = 2*floor(length(t)/2);   % truncate t to an even length L
deltat = t(2)-t(1);         % time increment
N = 16*L;                    % zero-pad to length N in computing DFT
omega = (-N/2:(N/2)-1)*(2*pi)/(N*deltat);
X = deltat*fftshift(fft(x(1:L),N)).*exp(j*omega*(t(L/2+1)-t(1)));
end

