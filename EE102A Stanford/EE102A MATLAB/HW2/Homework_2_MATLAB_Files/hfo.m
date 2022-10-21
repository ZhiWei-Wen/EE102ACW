function h = hfo(n,a)
% first-order system impulse response
h = (a.^n).*u(n);
end