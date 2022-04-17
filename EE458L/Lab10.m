clc, clear, close all;

filename = 'Recording.wav';
[x,Fs] = audioread('Recording.wav'); %read audio file (HERE you can use any recording)
%sound(x,fs); %uncomment if you want to hear signal
A = max(x);
V = A*2*pi*800/Fs;
n = length(x);
delta=V(1);
w=0;
figure(1);subplot(2,1,1);
plot(x, 'g');
title('Original audio');
stairs(x);

for i = 1:n
    if x(i)>w(i)
        d(i)=1;
        w(i+1)=w(i)+delta;
    else
        d(i)=0;
        w(i+1)=w(i)-delta;
    end
end

stairs(w);
hold on;
for i =1:d
    if d(i)>w(i)
        d(i)=0;
        w(i+1)=w(i)-delta;
    else
        d(i)=1;
        w(i+1)=w(i)+delta;
    end
end

[h f] = LPF2(63,Fs/10,Fs);
z = conv(w,h);
subplot(2,1,2);
plot(z,'r');
title('Quantized audio signal');
%sound(xn,Fs); %uncomment if you want to hear reconstructed signal
figure(2);subplot(2,1,1);plot(abs(fftshift(fft(x))));
title("ORIGINAL Audio Signal in FD");
subplot(2,1,2);plot(abs(fftshift(fft(z))));
title("Reconstructed Audio Signal in FD");


%To use this, install DSP extension in MATLAB
function [h, Fnyq] = LPF2(N,Fp,Fs)
Fnyq = Fs/2;
h = firceqrip(N,Fp/Fnyq,[0.01 0.01],'passedge');
end
