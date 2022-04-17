clear all;
clc;
t=-4:0.001:4;
x = exp((j*4*pi-0.5)*t);

subplot(2,1,1); 
plot(t,real(x));
grid on; 

subplot(2,1,2); 
plot(t,imag(x)); 
grid on;