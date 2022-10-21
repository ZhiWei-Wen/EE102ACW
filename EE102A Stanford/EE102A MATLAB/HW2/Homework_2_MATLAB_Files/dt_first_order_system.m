% First-Order System 

clear all

% Create input signal (rectangular pulse)
nx1 = -5; nx2 = 20; nx = nx1:nx2;   
non = 0; noff = 11;
x = u(nx-non) - u(nx-noff);

% Define system;
a = 0.5;        % Exponent parameter

% Approach A: iterative solution of the difference equation, given
% an input and an initial condition. 
% This can be done using the MATLAB filter command. 
% We can explain that it just iteratively solves the equation the
% way I did in lecture to find the impulse response. 

n0 = 0;                 % Time at which we start solving the equation
k0 = find(nx==n0);      % Index of time at which we start solving the equation
nyA1 = nx1; nyA2 = nx2; nyA = nyA1:nyA2;
yA = zeros(size(nyA));
% Using filter command
afo = [1 -a]; bfo = 1;
yA(k0:end) = filter(bfo,afo,x(k0:end));
% Using FOR loop
% for k = k0:length(nx);
%     yA(k) = a*yA(k-1) + x(k);
% end

figure(1)
subplot(211)
stem(nx,x);
lw = 1.5; l=get(gca,'children'); set(l,'linewidth',lw)
xlabel('n'); ylabel('x[n]');
title('Input Signal')

subplot(212)
stem(nyA,yA);
lw = 1.5; l=get(gca,'children'); set(l,'linewidth',lw)
xlabel('n'); ylabel('y[n]');
title('Output Signal, Solution of Difference Equation')

% Approach B: Numerical convolution of entire input with impulse response.
% Need to make sure nh is long enough to capture impulse
% response until it's decayed to become very small, say c = 10^-5.

c = 1e-5;
nh2 = ceil(log(c)/log(abs(a)));
nh1 = nx1; nh = nh1:nh2;
nyB1 = nx1+nh1; nyB2 = nx2+nh2; nyB = nyB1:nyB2;
hfo_trunc = hfo(nh,a);
yB = conv(x,hfo_trunc);

figure(2)
subplot(211)
stem(nx,x);
lw = 1.5; l=get(gca,'children'); set(l,'linewidth',lw)
xlabel('n'); ylabel('x[n]');
title('Input Signal')

subplot(212)
stem(nyB,yB);
lw = 1.5; l=get(gca,'children'); set(l,'linewidth',lw)
xlabel('n'); ylabel('y[n]');
title('Output Signal, Convolution of Input with Impulse Response')

% Approach C: Superposition of shifted impulse, step, ramp responses.

nyC1 = nx1; nyC2 = nx2; nyC = nyC1:nyC2;
yC = sfo(nyC-non,a) - sfo(nyC-noff,a);

figure(3)
subplot(211)
stem(nx,x);
lw = 1.5; l=get(gca,'children'); set(l,'linewidth',lw)
xlabel('n'); ylabel('x[n]');
title('Input Signal')

subplot(212)
stem(nyC,yC);
lw = 1.5; l=get(gca,'children'); set(l,'linewidth',lw)
xlabel('n'); ylabel('y[n]');
title('Output Signal, Superpositon of Scaled, Shifted Step Responses')







