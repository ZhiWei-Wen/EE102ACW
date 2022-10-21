function y = lambda(t)
% unit triangular pulse
y=1-abs(t);
y(t>=1)=0;
y(t<=-1)=0;
end