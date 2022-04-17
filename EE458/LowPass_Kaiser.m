% MATLAB code for Example 15.10 in chapter 15.
% see section 15.6
% lowpass filter design using Kaiser window
wn = 0.4375 ;  			    % Normalized Cutoff frequency
sz_kaiser = 47;  			% Kaiser Window size 
beta = 4.5513;			    % Kaiser Shape control parameter 
h_kaiser = fir1(sz_kaiser-1,wn,'low',kaiser(sz_kaiser,beta));
% Impulse response of the LPF using Kiaser window
w = 0:0.001*pi:pi;			% discrete frequencies for spectrum
H_kaiser = freqz(h_kaiser,1,w);% transfer function
plot(w,20*log10(abs(H_kaiser)));% magnitude spectrum
axis([0 pi -120 20]);		% set axis
title('FIR filter using Kaiser Window');
grid on
