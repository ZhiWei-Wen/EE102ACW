% Zhiwei Wen
% EE102A HW1
% Problem 1
clear all; close all;
%% 1a
n = 0:10;
Omega0 = -pi/4;
xn = sin(Omega0*n);
figure;
stem (n,xn);
xlabel('Time n');
ylabel('x[n] = sin(\Omega_{0}n)');
title('Task 1, Part (a), \Omega_{0} = -\pi/4');
t = 0:.01:10;
xn_ct = sin(Omega0 * t);
figure; 
hold on;
set(gca,'FontName','times','FontSize',16);
plot(t, xn_ct,'k--', 'LineWidth', 3);
stem(n, xn, 'b', 'LineWidth', 2);
xlabel('Time \itn');
ylabel('\itx\rm[\itn\rm] = sin(\Omega_{0}\itn\rm)');
title('Task 1, Part (a) with discrete and continuous n, \Omega_{0} = -\pi/4')
grid on;
%% 1b
Omega1 = 7*pi/4;
yn = sin(Omega1*n);
yn_ct = sin(Omega1 * t);
figure; hold on;
set(gca,'FontName','times','FontSize',16);
plot(t, xn_ct,'r--', 'LineWidth', 2.5, 'DisplayName', '\Omega = -\pi/4');
plot(t, yn_ct,'k--', 'LineWidth', 2.5, 'DisplayName', '\Omega =7\pi/4');
stem(n, xn, 'r', 'LineWidth', 4, 'DisplayName', '\Omega = -\pi/4');
stem(n, yn, 'b', 'LineWidth', 4, 'DisplayName', '\Omega = 7\pi/4');
xlabel('Time \itn');
ylabel('\itx\rm(\itt\rm) = sin(\Omega\itn\rm)');
title('Task 1, Part (b) with discrete and continuous n')
legend('show');
grid on;
%% 1c
wn = xn.*xn;
figure;
set(gca, 'FontName', 'times','FontSize',16);
stem(n, wn, 'LineWidth', 3);
xlabel('Time n');
ylabel('w[n]= x^{2}[n]');
title('1c: w[n]= x^{2}[n]')
grid on;
%periodic signal: T = 4.
%% 1d
t = 0:.005:5;
zt = exp(-t+1j*2*pi*t);
re_zt = real(zt);
im_zt = imag(zt);
envel1 = exp(-1*t);
envel2 = -exp(-1*t);
figure;
hold on;
set(gca,'FontName','times','FontSize',16);
plot(t,re_zt,'r','LineWidth',2.5,'DisplayName','Real Part');
plot(t,im_zt,'k','LineWidth',2.5,'DisplayName','Imaginary Part');
plot(t,envel1,'b--','LineWidth',1.5,'DisplayName','Envelop e^{-t}');
plot(t,envel2,'g--','LineWidth',1.5,'DisplayName','Envelop -e^{-t}');
xlabel('Time t');
title('Real and Imaginary parts of e^{-t+j2\pit}');
legend('show');
grid on;
% as can be seen in the figure, the real part and imaginary part oscillate
% within the envelop defined by +-e^(-t). They are decaying sinusoids.
figure; hold on;
set(gca,'FontName','times','FontSize',16);
plot(re_zt, im_zt,'b', 'LineWidth', 4);
xlabel('Re(\itz\rm(\itt\rm))');
ylabel('Im(\itz\rm(\itt\rm))');
title('Task 1, Part (d), \itz\rm(\itt\rm) = exp(-\itt + j2\pit\rm)');
grid on;
% e^{-t+1j*2*pi*t}=e^{-t}*e^{1j*2*pi*t};
% the real part and imaginary part oscillate 
% within the envelop defined by +-e^(-t). 
% They are decaying sinusoids.

