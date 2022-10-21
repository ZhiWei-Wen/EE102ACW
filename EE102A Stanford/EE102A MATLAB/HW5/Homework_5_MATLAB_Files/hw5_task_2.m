%% Task 2: filtering of pulse train by time shift, differentiator or first-order lowpass filter 

clear all                 
lw = 1.5;               % line width for plots

% Signal and FS parameters
T0 = 1;                 % period
omega0 = 2*pi/T0;       % fundamental frequency
T1 = T0/8;              % pulse half-width, require T1 < T0/2 to avoid overlap
K = 256;                % FS reconstruction sums from -K to +K
deltat = T0/K/8;        % discretization interval chosen to give 8 samples per 
                        % cycle of highest frequency components
t1 = -T0/2; t2 = T0/2;
t = t1:deltat:t2;       % time vector for all signals

% Time shift parameters
t0 = 0.2*T0;

% First-order lowpass filter parameters
tau = 0.1*T0;            % time constant

% y(t), Fourier series synthesis of output using terms from -K to K
x = zeros(size(t));
yshift = zeros(size(t));
ydiff = zeros(size(t));
yfo = zeros(size(t));
for k = -K:K;
    ak = a_rectpulsetrain(k,omega0,T1);
    x = x + ak*exp(j*k*omega0*t);
    yshift = yshift + ak*Hshift(k*omega0,t0)*exp(j*k*omega0*t);
    ydiff = ydiff + ak*Hdiff(k*omega0)*exp(j*k*omega0*t);
    yfo = yfo + ak*Hfolpf(k*omega0,tau)*exp(j*k*omega0*t);
end

% display results
figure(2)
subplot(221)
plot(t,real(x)); grid
lw = 1.5; l=get(gca,'children'); set(l,'linewidth',lw)
xlabel('Time \itt'); ylabel('Input Signal \itx\rm(\itt\rm)');

subplot(222)
plot(t,real(yshift)); grid
lw = 1.5; l=get(gca,'children'); set(l,'linewidth',lw)
xlabel('Time \itt'); ylabel('Output Signal \ity\rm(\itt\rm)');
title(['Time Shift, \itt\rm_{0}/\itT\rm_{0} = ' num2str(t0/T0,3)]);

subplot(223)
plot(t,real(ydiff)); grid
lw = 1.5; l=get(gca,'children'); set(l,'linewidth',lw)
xlabel('Time \itt'); ylabel('Output Signal \ity\rm(\itt\rm)');
title('Differentiator');

subplot(224)
plot(t,real(yfo)); grid
h=get(gca,'children'); set(h,'linewidth',lw)
xlabel('Time \itt'); ylabel('Output Signal \ity\rm(\itt\rm)');
title(['First-Order Lowpass Filter, \tau/\itT\rm_{0} = ' num2str(tau/T0,3)]);
