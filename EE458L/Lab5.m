clear;
close all;
clc;

f = 50;
T = 1/f;
fs = 20000;
Ts = 1/fs;
t = 0:Ts:1199*Ts;
x = sin(2*pi*f*t);
figure;plot(t,x);
xlabel("samples");
ylabel("Amplitude");
title('500hz sinusoidal function');

fc = 1000;
carrier = cos(2*pi*fc*t);
figure;plot(t,carrier);
xlabel("samples");
ylabel("Amplitude");
title('1000Hz carrier function');

M = 1;
mt = (x + M).*carrier;
figure;plot(t,mt);
xlabel("samples");
ylabel("Amplitude");
title('AM signal');

Rectified_signal = abs(mt);
figure;plot(t,Rectified_signal);
xlabel("samples");
ylabel("Amplitude");
title('Rectified signal');

B = 0:10:160;
B = B./10000;
B = [B 1];
a = [ones(1, 16) 0 0];
b = firpm(63, B, a);
F = fft(b);
F = fftshift(F);
step = fs/length(F);
n = -fs/2+step:step:fs/2;
figure;plot(n,abs(F));
ylabel("Amplitude");
xlabel("samples");
title("Filter");

C = conv(Rectified_signal, b);
t = 0:Ts:1262*Ts;
figure;plot(t,C);
xlabel("samples");
ylabel("Amplitude");
title('Original function at the end');
