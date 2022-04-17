%% Task 1
%first try
clear;
close all;
clc;
f = 0:200:2000;
fs = 20000;
f = [f 2200 2400 10000];
f = f./10000;
a = [ones(1, 11) zeros(1, 3)];
b = firpm(15, f, a);  %for b we change 15 to 63
B = fft(b);
B = fftshift(B);
step = fs/length(B);
n = -fs/2+step:step:fs/2;
figure;
plot(n,abs(B));

%second case
clear;
clc;
close all;
fs = 20000;
h1=firpm(15,[0 2000/fs/2 2200/fs/2 1],[1 1 0 0]);
h2=firpm(63,[0 2000/fs/2 2200/fs/2 1],[1 1 0 0]);
fvtool(h1,1)
figure;
fvtool(h2,1)

%% Task 2
clear;
clc;
close all;
fs=20000;
n=0:199;
x=sin(2*pi*1000*n/fs)+sin(2*pi*3000*n/fs);
X=fft(x);
sh=fftshift(X);
ww = -pi:2*pi/length(X):pi-1/length(X);
g=ww*fs/2/pi;
m=20*log10(abs(sh));
plot(g,m);

%% Task 3
clear;
clc;
close all;
fs=20000;
h2=firpm(63,[0 2000/fs/2 2200/fs/2 1],[1 1 0 0]);
n=0:199;
x=sin(2*pi*1000*n/fs)+sin(2*pi*3000*n/fs);
y=conv(x,h2);
Y=fft(y);
m=abs(fftshift(Y));
ww=-pi:2*pi/length(Y):pi-1/length(Y);
g=ww*fs/2/pi;
plot(g,m);
