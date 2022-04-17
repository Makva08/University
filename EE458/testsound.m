% audio can be up to 4-6khz for speech and up to 10khz for instrument sounds
% see this http://www.bnoack.com/index.html?http&&&www.bnoack.com/audio/speech-level.html
clc;
clear all;
close all;
%load an play wav file;
[y,fs]=audioread('Recording.m4a');
sound(y,fs);
    dt = 1/fs;%sampling time, time interval between samples
    %we assume mono sound.
    %if there is a stereo sound 
    % y(:,1) left chanell, y(:,2) right chanell-- will be the first and second channels
    % and can be analyzed separatelly
    %fs is a sampling frequency
    t = 0:dt:(length(y(:,1))*dt)-dt;%total time of sound duration
    plot(t,y(:,1)); %plot it
     xlabel('Seconds'); 
     ylabel ('Amplitude');
     N=fs;%used points;it can be less,or specified by user;
     % but we read this from file
     % you can do same without N variable;
     spectra = fft(y(:,1),N);
    
     f_axis=(-(N-1)/2:(N-1)/2)/N*fs;
     figure;
plot(f_axis,fftshift(abs(spectra)));
%above is a two sided spectra;
