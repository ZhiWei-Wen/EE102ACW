function H = Hshift(omega,t0);
% Time shift
H = exp(-sqrt(-1)*omega*t0);
end