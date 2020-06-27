
% Author: Zain Rajani
% Software Used: MATLAB (R2020a)

%% Initialize Screen 

clear all;
close all;
clc;

%% Original Signal

time = 0:100;                       % Time period of the signal

% Original Signal without noise 
input_signal=abs(sin(time)+cos(2*time)+sin(4*time));

% Noise Regeneration 
noise= 2*rand(size(time));

% Signal with Noise
final_input= input_signal+noise;

% Plotting the signal
subplot(3,1,1)
plot(time,input_signal,'LineWidth',2);% Signal Plotting
title('Input Signal');                % Title Signal 
xlabel('Time \rightarrow');           % X-axis label
ylabel('Amplitude \rightarrow');      % Y-axis label

subplot(3,1,2)                        % Same plot division 2
plot(time,noise,'r','LineWidth',2);   % Signal Plotting 
title('Noise Signal');
xlabel('Time \rightarrow');
ylabel('Amplitude \rightarrow');


subplot(3,1,3)                        % Same plot division 3
plot(time,final_input,'LineWidth',2);
title('Noisy Signal');
xlabel('Time \rightarrow');
ylabel('Amplitude \rightarrow');

%% Pulse Train Signal (Timing Circuit)

discrete_time=0:100;                   %Discrete Time for timing 
pulse_signal=[ones(1,101)];            % Generate Pulse Signal 

