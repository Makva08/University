nterms = 4000 ;
w0 = 1 ;
t = -10:0.01:10 ;
n = -(nterms/2):(nterms/2);
dn = sinc(n/4)./(8+i*4*n);
y = ictfs(w0,t, dn) ;
plot(t,y)
xlabel('t');  
ylabel('y(t)');
axis([-10  10  -0.2  0.6]), grid on
title ('Signal Reconstruction from F.S.')
print -dtiff plot.tiff
