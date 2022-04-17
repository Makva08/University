%%  Part(a)
k  = [-10:20];
f1 = -0.92 * sin(0.1*pi*k - 3*pi/4) ;
% plot function 1
subplot(2,2,1), stem(k, f1, 'filled'), grid
xlabel('k')	
ylabel('-9.2sin(0.1\pi k-0.75\pi')
title('Part (a)')

%%  Part(b)
k  = [-5:25];
f2 = 2 * 1.1.^(-1.8*k) - 2.1 * 0.9.^(0.7*k);
subplot(2,2,2), stem(k, f2, 'filled'), grid
xlabel('k')
ylabel('2(1.1)^{-1.8k} – 2.1(0.9)^0.7k')
title('Part (b)')

%%  Part(c)
k  = [0:50];
f3 = (-0.93).^k .* exp(j*pi*k/sqrt(350));
subplot(2,2,3), stem(k, real(f3), 'filled'), grid
xlabel('k')
ylabel('(-0.93)^k exp(j\pi k/(350)^{0.5}')
title('Part (c) - real part')
  
%
subplot(2,2,4), stem(k, imag(f3), 'filled'), grid
xlabel('k')
ylabel('(-0.93)^k exp(j\pi k/(350)^{0.5}')
title('Part (c) - imaginary part')
print -dtiff plot.tiff
