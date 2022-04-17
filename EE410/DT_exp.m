clear all;
clc;
k=[-10:40];
H=heaviside(k);
ex = exp((j*0.2*pi-0.05)*k);
x=ex.*H;

subplot(2,1,1); 
stem(k,real(x), 'filled');
grid on; 

subplot(2,1,2); 
stem(k,imag(x),'filled'); 
grid on;