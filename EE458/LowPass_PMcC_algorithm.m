% LowPass filter design using Park-McClellan algorithm 
len = 47; % Length of FIR filter 
range_norm_cut_off = [0, 0.375, 0.5, 1];
						    % normalized cut off frequencies
f_response = [1, 1, 0, 0];	% gains at the cut off frequencies
wmatrix = [0.0032/0.0562, 1]; % weight matrix
h_optimal = firpm(len-1,range_norm_cut_off,f_response,wmatrix);
% Impulse response of the optimal LPF FIR filter
w = 0:0.001*pi:pi;			% discrete frequencies for spectrum
H_optimal = freqz(h_optimal,1,w);% transfer function
plot(w,20*log10(abs(H_optimal)));% magnitude spectrum
axis([0 pi -120 20]);		% set axis
title('Optimal FIR filter');
grid on