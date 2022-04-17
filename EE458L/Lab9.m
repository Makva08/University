clc
sig_f=1;
c=10;
samp=100;
r=100;
t=0:1/samp:sig_f*15-1/samp;
m=sin(2*pi*sig_f*t);
a=0;
b=0;
for a=14
    m=sin(2*pi*sig_f*t);
    b=b+m;
end
nexttile
plot(t,b)
mod_sig=cos(2*pi*t+r*b);
nexttile
plot(t,mod_sig)