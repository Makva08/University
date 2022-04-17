% EE458L

%% First Exercise

t = 0:1/20000:8/2000;
y = sin(2.*pi.*2000.*t);
figure(1);
plot(t,y);

time_length = length(t)
y_length = length(y)

xlabel('Time') 
ylabel('Amplitude') 
title('Sine Signal')

%% Second Exercise

t=0:1/20000:80*1/20000;
y=sin(2.*pi.*18000.*t);
figure(2);
plot(t,y)

xlabel('time')
ylabel('Amplitude ')
title('Sine Signal')

%% Third Exercise

t=0:1/20000:8/1000;
y=sin(2.*pi.*1000.*t);
h=exp(-1000.*(0:9)/20000);
x=conv(y,h);
figure(3);
plot(x)

xlabel('Time')
ylabel('Amplitude')
title('Convolution Result')