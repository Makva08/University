clear;
close all;
clc;
% First 500Hz Sinusoidal FunctionS
f = 500;
T = 1/f;
fs = 1000000;
Ts = 1/fs;
t = 0:Ts:T;
x = sin(2*pi*f*t);
figure(1);plot(t,x); %x is samples, y is amplitude

%Fourier Trasnform of the previous signal
Y = fft(x);
Y = fftshift(Y);
step = fs/length(Y);
n = -fs/2+step:step:fs/2;
figure(2);plot(n,abs(Y));

%100kHz Sinusoidal Carrier Signal
f = 100000;
y = sin(2*pi*f*t);
figure(3);plot(t,y);

%Multiplication of two sinusoidal functions
z = x.*y;
figure(4);plot(t,z);

%Second multiplication
Z = z.*y;
figure(5);plot(t,Z);

%Filtering
f = 0:200:2000;
%fs = 20000;
f = [f 2200 2400 10000];
f = f./10000;
a = [ones(1, 11) zeros(1, 3)];
b = firpm(63, f, a);
B = fft(b);
B = fftshift(B);
step = fs/length(B);
n = -fs/2+step:step:fs/2;
figure(6);plot(n,abs(B));
title("Filter");
figure(7);plot(n,angle(B));
xlim([0 1000]);

%Fourier Transform before Filtering of the signal
Y = fft(Z);
Y = fftshift(Y);
step = fs/length(Y);
n = -fs/2+step:step:fs/2;
figure;plot(n,abs(Y));
title('FFT of the signal before filter');

%Convolution
C = conv(Z, b);
figure;plot(C);

%Filtered singal
step = fs/length(C);
n = -fs/2+step:step:fs/2;
C = fft(C);
C = fftshift(C);
figure;plot(n,abs(C));
title('Filtered signal');
