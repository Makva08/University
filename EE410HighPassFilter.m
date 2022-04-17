wp=100; 
ws=50; 
Rp=1; 
Rs=15 ;

%% Butterworth filter
[N, wc] = buttord(wp,ws,Rp,Rs,'s');		% determine order and cut off
[num1,den1] = butter(N,wc,'high','s') ;	% determine transfer function
H1 = tf(num1,den1);

%% Type I Chebyshev filter
[N, wn] = cheb1ord(wp,ws,Rp,Rs,'s') ;
[num2,den2] = cheby1(N,Rp,wn,'high','s') ;
H2 = tf(num2,den2);

%% Type II Chebyshev filter
[N,wn] = cheb2ord(wp,ws,Rp,Rs,'s') ;
[num3,den3] = cheby2(N,Rs,wn,'high','s') ;
H3 = tf(num3,den3);

%% Elliptic filter
[N,wn] = ellipord(wp,ws,Rp,Rs,'s') ;
[num4,den4] = ellip(N,Rp,Rs,wn,'high','s') ;
H4 = tf(num4,den4);

