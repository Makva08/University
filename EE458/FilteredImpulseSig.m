clc;
clear all;
close all;

n = 0:100;
a = [1 -1.15 1.5 -0.7 0.25]; %y
b = [0.18 0.1 0.3 0.1 0.18]; %x
h = impz(b,a,n);
figure();
subplot(4,1,1);
stem(n,h);
title("Impulse response");

x=ones(1,101);
y = filter(b,a,x);
subplot(4,1,2);
stem(n,y);
title("Filtered output");

y2=conv(h,x);
n2= -1:0.01:1;
subplot(4,1,3);
stem(n2,y2);
title("Convoluted output");

y3 = filter(h,1,x);
subplot(4,1,4);
stem(n,y3);
title("Filtered impulse signal");
