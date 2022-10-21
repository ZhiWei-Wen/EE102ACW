%Create input signal (rectangular pulse)
n_x1 = -5;
n_x2 = 20;
n_x = n_x1:n_x2;
n_on = 0;
n_off = 11;
x = u(n_x-n_on)-u(n_x-n_off);
%Define system:
a = 0.5; %exponential parameter
n_0 = 0; %Time at which we start solving the equation.
k_0 = find(n_x==n_0); %Index of time at which we start solving eqn.
n_yA1 = n_x1;
n_yA2 = n_x2;
n_yA = n_yA1 : n_yA2;
y_A = zeros(size(n_yA));
a_fo = [1 -a];
b_fo = 1;% The a and b parameters from the general filter command.
y_A(k_0:end) = filter(b_fo,a_fo,x(k_0:end));
figure(1);
subplot(211);
stem(n_x,x);
lw = 1.5;
l = get(gca, 'children'); 
set(l,'linewidth',lw);
xlabel('n');ylabel('x[n]');
title('Input Signal');
subplot(212);
stem(n_yA,y_A);
lw = 1.5;
l = get(gca,'children');
set(l,'linewidth',lw);
xlabel('n');ylabel('y[n]');
title('Output Signal, Solution of Difference Equation');
c = 1e-5; % cut-off value
n_h2 = ceil(log(c)/log(abs(a))); % cut-off index
n_h1 = n_x1; nh = n_h1:n_h2; % impulse response indexing
n_yB1 = n_x1+n_h1; n_yB2 = n_x2+n_h2; n_yB = n_yB1:n_yB2; % output indexing
h_fo_trunc = hfo(nh,a);
y_B = conv(x,h_fo_trunc);
figure(2);
subplot(211);
stem(n_x,x);
lw = 1.5;
l = get(gca, 'children'); 
set(l,'linewidth',lw);
xlabel('n');ylabel('x[n]');
title('Input Signal');
subplot(212);
stem(n_yB,y_B);
lw = 1.5;
l = get(gca,'children');
set(l,'linewidth',lw);
xlabel('n');ylabel('y[n]');
title('Output Signal, Convolving Input with Impulse Response');
y_C = sfo(n_x-n_on,a)-sfo(n_x-n_off,a);
figure(3);
subplot(211);
stem(n_x,x);
lw = 1.5;
l = get(gca, 'children'); 
set(l,'linewidth',lw);
xlabel('n');ylabel('x[n]');
title('Input Signal');
subplot(212);
stem(n_x,y_C);
lw = 1.5;
l = get(gca,'children');
set(l,'linewidth',lw);
xlabel('n');ylabel('y[n]');
title('Output Signal, Combining Step Response');

