function h = hsolpfcd(t,omegan)
% Impulse response of critcally damped second-order lowpass filter (zeta = 1)
h = (omegan^2)*t.*exp(-omegan*abs(t)).*double(t>=0);
end