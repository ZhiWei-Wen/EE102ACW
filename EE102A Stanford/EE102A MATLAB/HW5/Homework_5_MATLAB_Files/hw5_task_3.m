%% Task 3: automobile rolling over periodic speed bumps

clear all                 
lw = 1.5;               % line width for plots

T0 = 1;                 % period
omega0 = 2*pi/T0;       % fundamental frequency
T1 = T0/32;             % pulse half-width, require T1 < T0/2 to avoid overlap
K = 256;                % FS reconstruction sums from -K to +K
deltat = T0/K/8;        % discretization interval chosen to give 8 samples per 
                        % cycle of highest frequency components
t1 = -3*T0/2; t2 = 3*T0/2;
t = t1:deltat:t2;       % time vector for all signals

% Automobile suspension system
omegan = 0.1*omega0;      % natural frequency
zeta = 1;               % damping constant

% y(t), Fourier series synthesis of output using terms from -K to K
x = zeros(size(t));
yautosusp = zeros(size(t));
for k = -K:K;
    ak = a_rectpulsetrain(k,omega0,T1);
    x = x + ak*exp(j*k*omega0*t);
    yautosusp = yautosusp + ak*Hautosusp(k*omega0,omegan,zeta)*exp(j*k*omega0*t);
end

% display results
figure(3)
subplot(211)
plot(t,real(x)); grid
lw = 1.5; l=get(gca,'children'); set(l,'linewidth',lw)
xlabel('Time \itt'); ylabel('Road Elevation \itx\rm(\itt\rm)');

subplot(212)
plot(t,real(yautosusp)); grid
lw = 1.5; l=get(gca,'children'); set(l,'linewidth',lw)
xlabel('Time \itt'); ylabel('Automobile Elevation \ity\rm(\itt\rm)');
title(['Auto Suspension, \omega_{\itn}/\omega_{0} = ' num2str(omegan/omega0,3),...
   ', \zeta = ' num2str(zeta,3)]);


