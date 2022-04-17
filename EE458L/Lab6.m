clear;
close all;
clc;

f = 50; % message frequency
T = 1/f;
fs = 20000; % sampling frequency
Ts = 1/fs;
t = 0:Ts:3*T-Ts;
m1 = cos(2*pi*f*t); % message
figure;subplot(2,2,1);plot(t,m1);
xlabel("samples");
ylabel("Amplitude");
title('50 Hz message');

fc = 1000; % carrier frequency
y1 = cos(2*pi*fc*t); % first carrier
subplot(2,2,2);plot(t,y1);
xlabel("samples");
ylabel("Amplitude");
title('1 kHz carrier');

x1 = y1.*m1; % first DSB - SC signal
subplot(2,2,3);plot(t,x1);
xlabel("samples");
ylabel("Amplitude");
title('x1(t)');

m2 = sin(2*pi*f*t); % 90 degree shifted message
figure;subplot(2,2,1);plot(t,m2);
xlabel("samples");
ylabel("Amplitude");
title('50 Hz shifted message');

y2 = sin(2*pi*fc*t); % second carrier
subplot(2,2,2);plot(t,y2);
xlabel("samples");
ylabel("Amplitude");
title('1 kHz shifted carrier');

x2 = y2.*m2; % second DSB - SC signal
subplot(2,2,3);plot(t,x2);
xlabel("samples");
ylabel("Amplitude");
title('x2(t)');

x = x1 + x2; % SSB signal
figure;subplot(2,2,1);plot(t,x);
xlabel("samples");
ylabel("Amplitude");
title('SSB signal');

Y = fft(x);
Y = fftshift(Y);
step = fs/length(Y);
n = -fs/2:step:fs/2-step;
subplot(2,2,2);plot(n,abs(Y));
xlabel("frequency");
ylabel("Amplitude");
title('FFT of the SSB signal');
