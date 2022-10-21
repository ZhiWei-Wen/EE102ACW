deltat=1/300;
tmax=1.5;
t=-tmax:deltat:tmax;
x=lambda(2*t);
[X,omega]=CTFT_approx(x,t);
phi = pi/2;


figure(1);
subplot(211);
plot(t,x);
l=get(gca,'children');set(l,'linewidth',1.5)
set(gca,'FontName','arial');set(gca,'FontSize',14);
xlabel('Time \itt\rm (s)');
ylabel('\itx\rm(\itt\rm)');
grid on;
title('Message Signal and Spectrum');

subplot(212);
plot(omega/(2*pi),abs(X));
l=get(gca,'children');set(l,'linewidth',1.5)
set(gca,'FontName','arial');set(gca,'FontSize',14);
xlabel('Frequency \omega/2\pi (Hz)');
ylabel('|\itX\rm(\itj\rm\omega)|');
grid on;

fc = 50;
omegac = 2*pi*fc;
y=x.*cos(omegac*t);
[Y,omega2]=CTFT_approx(y,t);
figure(2);
subplot(211);
plot(t,y);
l=get(gca,'children');set(l,'linewidth',1.5)
set(gca,'FontName','arial');set(gca,'FontSize',14);
xlabel('Time \itt\rm (s)');
ylabel('\ity\rm(\itt\rm)');
grid on;
title('Modulated Signal and Spectrum');

subplot(212);
plot(omega/(2*pi),abs(Y));
l=get(gca,'children');set(l,'linewidth',1.5)
set(gca,'FontName','arial');set(gca,'FontSize',14);
xlabel('Frequency \omega/2\pi (Hz)');
ylabel('|\itY\rm(\itj\rm\omega)|');
grid on;

v=1/2*x*cos(phi)+1/2*x.*cos(2*omegac*t+phi);
[V,omega3]=CTFT_approx(v,t);
figure(3);
subplot(211);
plot(t,v);
l=get(gca,'children');set(l,'linewidth',1.5)
set(gca,'FontName','arial');set(gca,'FontSize',14);
xlabel('Time \itt\rm (s)');
ylabel('\itv\rm(\itt\rm)');
grid on;
title('Demodulated Signal and Spectrum');

subplot(212);
plot(omega3/(2*pi),abs(V));
l=get(gca,'children');set(l,'linewidth',1.5)
set(gca,'FontName','arial');set(gca,'FontSize',14);
xlabel('Frequency \omega/2\pi (Hz)');
ylabel('|\itV\rm(\itj\rm\omega)|');
grid on;

fn=5;omegan=2*pi*fn;
hlpf=hsolpfcd(t,omegan);
[H,omega4]=CTFT_approx(hlpf,t);
magnitude=abs(H);
phase=angle(H);
figure(4);
subplot(311)
plot(t,hlpf);
l=get(gca,'children');set(l,'linewidth',1.5)
set(gca,'FontName','arial');set(gca,'FontSize',14);
xlabel('Time \itt\rm (s)');
ylabel('\ith\rm(\itt\rm)');
grid on;
title('Impulse Response of LPF');
subplot(312);
plot(omega4/(2*pi),magnitude);
l=get(gca,'children');set(l,'linewidth',1.5)
set(gca,'FontName','arial');set(gca,'FontSize',14);
xlabel('Frequency \omega/2\pi (Hz)');
ylabel('|\itH\rm(\itj\rm\omega)|');
grid on;

subplot(313);
plot(omega4/(2*pi),phase);
l=get(gca,'children');set(l,'linewidth',1.5)
set(gca,'FontName','arial');set(gca,'FontSize',14);
xlabel('Frequency \omega/2\pi (Hz)');
ylabel('<\itH\rm(\itj\rm\omega)');
grid on;

tw=-2*tmax:deltat:2*tmax;
w=deltat*conv(v,hlpf);
[W,omega9]=CTFT_approx(w,tw);

figure(5);
subplot(211);
plot(tw,w);
l=get(gca,'children');set(l,'linewidth',1.5)
set(gca,'FontName','arial');set(gca,'FontSize',14);
xlabel('Time \ittw\rm (s)');
ylabel('\itw\rm(\itt\rm)');
ylim([0,0.5])
xlim([-1.5,1.5])
grid on;
title('Filted Signal and Spectrum');

subplot(212);
plot(omega9/(2*pi),abs(W));
l=get(gca,'children');set(l,'linewidth',1.5)
set(gca,'FontName','arial');set(gca,'FontSize',14);
xlabel('Frequency \omega/2\pi (Hz)');
ylabel('|\itW\rm(\itj\rm\omega)|');
ylim([0,0.5])
grid on;
