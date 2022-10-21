function s = sfo(n,a)
% first-order system step response
s = 1/(1-a)*(1-a.^(n+1)).*u(n);
end
