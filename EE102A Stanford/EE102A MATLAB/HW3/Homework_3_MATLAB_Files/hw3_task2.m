% Your Name
% EE102A HW3
% Task 2
clear all; close all;

%% Task 2a (noiseless)

% All times are in microseconds
deltat = 0.01;              % time increment                   
T = 1;                      % rectangular pulse width
td = 10;                    % round-trip time delay
c = 2.9979e2;               % speed of light (m/microsecond)

% Transmitted signal x(t)
tx1 = 0; tx2 = T; 
tx = tx1:deltat:tx2;        % time for x
x = Pi((tx-T/2)/T);         % x(t)                    

% Received signal y(t) = x(t-td)
ty1 = tx1; ty2 = tx2 + td;
ty = ty1:deltat:ty2;        % time for y
y = Pi((ty-T/2-td)/T);      % y(t)

% Causal matched filter h(t)= x(T-t)
th1 = tx1; th2 = tx2;
th = th1:deltat:th2;        % time for h           
h = fliplr(x);              % h(t)

% Filtered signal z(t) = y(t)*h(t)
tz1 = ty1+th1; tz2 = ty2+th2;
tz = tz1:deltat:tz2;        % time for z
z = deltat*conv(y,h);       % z(t)
[zmax,index] = max(z);      % finding the peak in z(t)
td_est = tz(index) - T;     % estimated round-trip delay time
d_est = c*td_est/2;         % estimated one-way propagation distance

figure (1)
subplot(2,1,1);
plot(ty, y, 'LineWidth', 1.5);
set(gca,'FontName','arial','FontSize',14);
xlabel('Time \itt\rm (\mus)'); ylabel('\ity\rm(\itt\rm)');
title('Received Signal');

subplot(2,1,2);
plot(tz, z, 'LineWidth', 1.5);
xlabel('Time \itt\rm (\mus)'); ylabel('\itz\rm(\itt\rm)');
title('Filtered Signal');
text(1,0.9*max(z),['Estimated round-trip time: ' num2str(td_est,4) ' \mus'], ...
    'FontName','arial','FontSize',14);
text(1,0.6*max(z),['Estimated one-way distance: ' num2str(d_est,4) ' m'], ...
    'FontName','arial','FontSize',14);
set(gca,'FontName','arial','FontSize',14);


%% Task 2b (noise added)

Sn = 0.03;                  % power spectral density of noise           %%%

% Transmitted signal x(t)
tx1 = 0; tx2 = T; 
tx = tx1:deltat:tx2;        % time for x
x = Pi((tx-T/2)/T);         % x(t)  

% Noise n(t)                                                            %%%
sigma = sqrt(Sn/deltat);    % standard deviation of noise
n = sigma*randn(size(ty));  % n(t) 

% Received signal y(t) = x(t-td)+ n(t)                                  %%%
ty1 = tx1; ty2 = tx2 + td;
ty = ty1:deltat:ty2;        % time for y
y = Pi((ty-T/2-td)/T) + n;  % y(t)

% Causal matched filter h(t)= x(T-t)
th1 = tx1; th2 = tx2;
th = th1:deltat:th2;        % time for h           
h = fliplr(x);              % h(t)

% Filtered signal z(t) = y(t)*h(t)
tz1 = ty1+th1; tz2 = ty2+th2;
tz = tz1:deltat:tz2;        % time for z
z = deltat*conv(y,h);       % z(t)
[zmax,index] = max(z);      % finding the peak in z(t)
td_est = tz(index) - T;     % estimated round-trip delay time
d_est = c*td_est/2;         % estimated one-way propagation distance

figure (2)

subplot(2,1,1);
plot(ty, y, 'LineWidth', 1.5);
set(gca,'FontName','arial','FontSize',14);
xlabel('Time \itt\rm (\mus)'); ylabel('\ity\rm(\itt\rm)');
title('Received Signal');

subplot(2,1,2);
plot(tz, z, 'LineWidth', 1.5);
set(gca,'FontName','arial','FontSize',14);
xlabel('Time \itt\rm (\mus)'); ylabel('\itz\rm(\itt\rm)');
title('Filtered Signal');
text(1,0.9*max(z),['Estimated round-trip time: ' num2str(td_est,4) ' \mus'],...
    'FontName','arial','FontSize',14);
text(1,0.65*max(z),['Estimated one-way distance: ' num2str(d_est,4) ' m'], ...
    'FontName','arial','FontSize',14);
set(gca,'FontName','arial','FontSize',14);
