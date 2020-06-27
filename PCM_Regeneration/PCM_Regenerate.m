
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

discrete_time=0:100;                   % Discrete Time for timing 
pulse_signal=[ones(1,101)];            % Generate Pulse Signal 

figure                                 % Create a new figure
%Plot the pulse signal 
stem(discrete_time,pulse_signal,'LineWidth',2)
%Label the plot
title('Pulse Train Signal');
xlabel('Discrete Time n \rightarrow');
ylabel('Amplitude \rightarrow');

%% Amplifier and Equaliser Stage

amplification_factor=2;                % Signal Equalised by

threshold_level=3;                     % Set the threshold level

equaliser_signal=amplification_factor*final_input; % Final Signal Input

figure;                                % Create a new plot
subplot(3,1,1)                         % Plot first division
plot(time, equaliser_signal,'g','LineWidth',2)  %Plotting signal
% Label the plots
title('Equaliser Amplifer Stage');
xlabel('Time \rightarrow');
ylabel('Amplitude \rightarrow');

% Draw threshold line
line_draw=line([0 100],[threshold_level,threshold_level]); 

% Line Drawn specification (Design for the drawn line)

line_draw.Color='red';
line_draw.LineStyle='--';
line_draw.LineWidth=2;

%% Decision Making Block

i=1;

% Loop to decide the signal based on the threshold set 
while (i<=100)
    if (equaliser_signal(1,i)>=threshold_level)
        decision_stage(1,i)=1;
    else 
        decision_stage(1,i)=0;
    end
    i=i+1;
end 

disp(decision_stage);            % Display the decision signal

subplot(3,1,3)                   % 3rd Division Plot
