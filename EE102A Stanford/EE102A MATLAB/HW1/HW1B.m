% Zhiwei Wen
% EE102A HW1
% Problem 2
clear all; close all;
load guitar_note.mat;
t = (1:length(note))*dt;
figure; hold on;
plot(t(1:8:end),note(1:8:end),'DisplayName','Guitar Sound');
xlabel('time (s)');
ylabel('Amplitude');
title('Guitar note waveform');
alpha = 1.2;
sigma = -1;
t0 = 0.5;
envelope = alpha*exp(sigma*t).*double(t>=t0);
plot(t,envelope,'r','LineWidth',1.5,'DisplayName','envelop');
plot(t,-envelope,'r','LineWidth',1.5,'DisplayName','-envelop');
legend('show');grid on;
index_sample = 1*fs:round((1+1/16)*fs);
t_sample = t(index_sample);
note_sample = note(index_sample);
figure;
plot(t_sample,note_sample);
xlabel('sampled time(s)');
ylabel('Amplitude');
title('Sampled note waveform');
grid on;
% the cycle should be approximately 16.2 rounds. So the frequency
% should be 16.2 x 16 = 259.2 hz, which is very close to the real
% frequency of middle C : 261.62 hz.
f_note = 259.2;
simulated_note = envelope.*sin(2*pi*f_note*t);
figure;hold on;
plot(t(1:16:end),simulated_note(1:16:end),'DisplayName','Simulated Sound');
xlabel('time (s)');
ylabel('Amplitude');
title('Simulated note waveform');
envelope = alpha*exp(sigma*t).*double(t>=t0);
plot(t,envelope,'r','LineWidth',1.5,'DisplayName','envelop');
plot(t,-envelope,'r','LineWidth',1.5,'DisplayName','-envelop');
legend('show');grid on;
% By playing this sound with(simulated_note,fs) command in the command
% line, it is found that they are the same note with same fading rate.

