% Your Name
% EE102A HW3
% Task 1
clear all; close all;

%% Task 1b
deltat = 0.01;                              % time increment
tau = 0.2;                                  % FOLPF time constant
T = 1;                                      % rectangular pulse width
t1 = -0.5; t2 = 10*tau;
t = t1:deltat:t2;                           % time for x(t) and h(t)
t1y = t1+t1; t2y = t2+t2;
ty = t1y:deltat:t2y;                        % time for y(t)
x = Pi((t-T/2)/T);                          % x(t)
h = 1/tau * exp(-t/tau) .* double(t>=0);    % h(t)
y = deltat*conv(x,h);                       % y(t)

figure(1)
subplot(3,1,1);
plot(t, x, 'LineWidth', 1.5);
set(gca,'FontName','arial','FontSize',14);
xlabel('Time \itt\rm (s)'); ylabel('\itx\rm(\itt\rm)');
title('Input Rectangular Pulse');

subplot(3,1,2);
plot(t, h, 'LineWidth', 1.5);
set(gca,'FontName','arial','FontSize',14);
xlabel('Time \itt\rm (s)'); ylabel('\ith\rm(\itt\rm)');
title(['FOLPF Impulse Response, \tau = ' num2str(tau,2) ' s']);

subplot(3,1,3);
plot(ty, y, 'LineWidth', 1.5);
set(gca,'FontName','arial','FontSize',14);
xlabel('Time \itt\rm (s)'); ylabel('\ity\rm(\itt\rm)');
title('Filtered Rectangular Pulse');

% The different timescale is a result of the convolution operation. We have
% that t1y = tx1+th1 = -1; t2y = tx2+th2 = 4;