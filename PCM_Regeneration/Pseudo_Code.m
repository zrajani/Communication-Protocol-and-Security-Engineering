% Skleton PCM REGENERATION


%% Initialise

clc;
clear all;
close all;

%% Input Signals 

frequency= 2; % Plug your frequency value here 

t=0:1/frequency:100;

original_signal=sin(2*pi*100*t);

noise_signal= awgn(original_signal,100,'measured');

subplot(3,1,1)
plot(t,original_signal)
title('Original Signal')
xlabel('Time')
ylabel('Amplitude')

subplot(3,1,2)
plot(t,noise_signal)
title('Noisy Signal')
xlabel('Time')
ylabel('Amplitude')

%% Pulse Train Signal 

t=0:1/frequency:100 ;   %Time vector 

w = 1; %pulse width adjust as required 

d= w/2:w*2:100; %delay vector

y2=pulstran(t,d,'rectpuls',w);
figure
plot(t,y2); 

set(gca,'Ylim',[-0.1 1.1]);

%% Amplifier and Equiliser


final_signal= 9000000*noise_signal .* y2;

threshold=.0000003;

%% Decision Signal 
i=1;
while(i<=201)
    if (final_signal(1,i)>=threshold)
        decision(1,i)=1;         % plug in the values in the brackets 
    else 
        decision(1,i)=0;         % Plug in the values in the brackets 
    end
    i=i+1;
end

figure
stem(t,decision)
title('Descision Signal')
xlabel('Time')
ylabel('Amplitude')

%% Calculate the bit error rate

% Use loops to compare the input and output data;
% Input signal is final_signal
% Output signal is decision
% i=1;
% counter=0;
% while (i<=1001)
%     if (final_signal>0)
%         counter=counter+1;
%
%     end
%     increment i;
% end

% Make a same loop for the decision signal

% Write the formula for the bit error rate and print the result 

% Incase you wish to plot then combine both the loops and when you come out
% of the while loop then apply the bit error rate formula so you get a
% vector and then use plot command 
