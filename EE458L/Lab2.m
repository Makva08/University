%% Task 1

Fs = 10000;  % Sampling Frequency 
F = 1000;    % Frequency 
n = 0:1/Fs:30/F; % Time interval 
y = sin(2*pi*1000.*n);   % Sinusioid 
figure;
plot(n,y);
fourier = fftshift(fft(y));
frequencies = -5000+10000/length(fourier):10000/length(fourier):5000;
figure;
plot(frequencies,abs(fourier));

%% Task 2
close all;
clear;
n = 0:1/10000:1/1000;
y = 1000.*n;
t = [];
y = [];
for i=1:30
    for k=n
        y = [y rem(1000.*k,1.1)];
    end
  
end
for i=1:30
    t = [t n+i.*10^-3];
end
figure;
plot(t,y);

%% Task 3
close all;
clear;
clc;
n = 0:1/10000:1/1000;
y = 1000.*n;
t = [];
y = [];
for i=1:30
    for k=n
        y = [y rem(1000.*k,1.1)];
    end 
end
for i=1:30
    t = [t n+i.*10^-3];
end
t = t -10^-3;
figure;
plot(t,y);

fourier =fftshift(fft(y));
freq = -5000 +length(fourier):10000/length(fourier):5000;
figure;plot(freq-299,abs(fourier(1,1:320)));

