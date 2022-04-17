clear all;
clc;
t=-4:0.01:4;
n=length(t);

g_1 =3*sin(4*pi*t)+7*cos(3*pi*t);
figure;plot(t,g_1,'r')
title('g_1')

g_2 =3*sin(4*pi*t)+7*cos(10*t);
figure;plot(t,g_2,'g')
title('g_2')

t1=-2:0.01:2;
g_1_1 =3*sin(4*pi*t1)+7*cos(3*pi*t1);
g_2_1 =3*sin(4*pi*t1)+7*cos(10*t1);
figure;plot(t1,g_1_1,t1,g_2_1)
title('Combination')
