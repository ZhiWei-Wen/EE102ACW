%% Task 1: reconstruction error

clear all                 
lw = 1.5;               % line width for plots

% Signal and FS parameters 
T0 = 1;                 % period
omega0 = 2*pi/T0;       % fundamental frequency
T1 = T0/4;              % pulse half-width, require T1 < T0/2 to avoid overlap
K = 256;                  % FS reconstruction sums from -K to +K
% Try K = 4, 16, 64, 256
deltat = T0/K/128;      % discretization interval chosen to give 128 samples per 
                        % cycle of highest frequency components
t1 = -T0/2; t2 = T0/2;
t = t1:deltat:t2;       % time vector for all signals

% x(t), ideal rectangular pulse train to be synthesized
x = x_ideal_rectpulsetrain(t,T0,T1);

% xhatK(t), Fourier series synthesis using terms from -K to K
xhatK = zeros(size(t));
for k = -K:K;
    ak = a_rectpulsetrain(k,omega0,T1);
    xhatK = xhatK + ak*exp(j*k*omega0*t);
end

% epsK, integrated squared error between x(t) and xhatK(t)
epsK = sum(abs(x - xhatK).^2)*deltat;

% display results
figure(1)
plot(t,real(xhatK),'b-',t,x,'r--')
lw = 1.5; l=get(gca,'children'); set(l,'linewidth',lw)
xlabel('Time \itt'); ylabel('Ideal Signal and FS Synthesis');
leg = legend({'$x(t)$';'$\hat{x}_{K}(t)$'});
set(leg,'Interpreter','latex');
title(['2\itK\rm + 1 Terms, \itK\rm = ' num2str(K,4) ...
    ', Integrated Absolute Square Error \epsilon_{\itK} = ' num2str(epsK,2)]);
% 