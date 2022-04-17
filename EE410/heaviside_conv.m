clc; clear all; close all;

x=0:0.01:2;
H=heaviside(x)-2*heaviside(x-1)+heaviside(x-2);
w=conv(H,H,'full');
figure(1);plot(w);

y=-2:0.01:2;
ramp = @(y) y.*(y>=0);
Z=(-heaviside(y+1))+ramp(y+1)-ramp(y-1)-heaviside(y-1);
j=conv(H,Z,'full');
figure(2);plot(j)

fs=1000000;
t1=-1:1/fs:0-1/fs;
f1=exp(2.*t1);
t2=0:1/fs:1;
f2=exp(2.*(-t2));
f=[f1 f2];
t=[t1 t2];
%figure;plot(t,f);
v=conv(H,f,'full');
figure(3);plot(v);

