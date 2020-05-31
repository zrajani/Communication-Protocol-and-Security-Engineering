%% LAB SOLUTION # 1 

% Author: Zain Rajani 
% Student ID: C0752681

% Initialise

clc;
close all;
clear all;

%% Task 1 

% Create a 5x1 vector of zeros. Create a 2x5 matrix of random numbers.

zero_vector=zeros(5,1)  % Vector of Zeros with 5 rows and 1 column

random_numbers= rand(2,5)  % Uniformly distribution of random numbers with
                            % 2 rows and five columns
                            
%% Task 2 

% Multiply a column of a matrix with an element of this same matrix.

B=magic(4)  % Creates 4x4 matrix with sum of column elements is equal to
             % sum of the row elements 
             
B(:,2)= B(1,1)*B(:,2)  % Takes the element present at location 
                                   % (1,1) and multiplies with the entire 
                                   %  column 2 of the matrix

%% Task 3 

% Create a plot of the sin function between 0 and 6π

% t=0:0.01:6*pi; %Time range <- Used to take steps mannually

Npts=512; %No of Points to plot
y=linspace(0,6*pi,Npts); %Creates Number of point 0 to 6*pi distributed 
omega_1=2;
x=sin(omega_1*y); %Computing of Sine Function
plot(y,x); % Plot Sine Wave
grid on;   % Display the grids on the graph
title('Sine Function from 0 to 6{\pi}');
ylabel('Amplitude'); xlabel('Time (in radians)');
xticks([0 pi/2 pi 3*pi/2 2*pi 5*pi/2 3*pi 7*pi/2 4*pi 9*pi/2 5*pi 11*pi/2 6*pi])
xticklabels({'0','\pi/2','\pi','3\pi/2','2\pi','5\pi/2','3\pi','7\pi/2','4\pi','9\pi/2','5\pi','11\pi/2','6\pi'});
xtickangle(45);

%% Task 4

% Simulate an amplitude modulation (AM) system with all input, carrier
% and output signals. Say the input signal is a cosine wave with amplitude
% as 2V and frequency as 1000Hz. The carrier signal is also a cosine wave
% with amplitude as 5V and frequency as 10KHz. The modulation degree
% is 0.5, and the initial phases of all cosine wave are 0. (Recall Nyquist
% sampling theorem to avoid distortion i.e. under sampling)

% Modulation Degree 

m=0.5;

% Input Signal Parameters
Am= 2;                      % Amplitude = 2V    (Modulating Signal)
fa=1000;                    % Frequency = 1000Hz (Input Signal)
ta=1/fa;                    % Time Period of modulating signal

T=0:ta/999:6*ta;            % Total time for simulation

input = Am*cos(2*pi*fa*T);  % Input Signal plot

%Plotting the signal (Input/Modulating signal)

figure;
subplot(3,1,1);             % Dividing the plot
plot(T,input); 
grid on;                    % Getting the grid lines 
hold on;                    % Plot more signals on the same graph
title('Modulating/Input Signal');  % Label the the graphs
xlabel('Time in seconds');         % Label x-axis 
ylabel('Amplitude in Volts');      % Label y-axis 

% Carrier Signal Parameters
Ac = 5;                           % Carrier Signal Amplitude
fc=10000;                         % Frequency of Carrier 10KHz
tc=1/fc;                          % Time period of the carrier
carrier = Ac*cos(2*pi*fc*T);      % Carrier Signal Waveform Equation

%Plot the signal
subplot(3,1,2)                    % Plot in the same figure
plot(T,carrier);                  % Signal Plotting 
grid on;                          % Grid lines on the graph
title('Carrier SIgnal');          % Graph Name 
xlabel('Time in seconds');        % Label/Name for x-axis
ylabel('Amplitude in Volts');     % Label/Name for y-axis 

% Output/Final Waveform

output=Ac*(1+m*cos(2*pi*fa*T)).*cos(2*pi*fc*T);   % Equation of Output Signal

%Plot the graph
subplot(3,1,3)                   % Plot in the same figure
plot(T,output);                  % Plot the graph
grid on;                         % Grid lines on
title('Amplitude Modulated Signal');    % Name of the graph
xlabel('Time in Seconds');              % Label x-axis
ylabel('Amplitude in Volts');           % Label y-axis
hold off;                               % No more plots on the same screen

%% Task 5 
% Use the signals above, consider a actual vivid simulation mode, and add
% random noise in output signal. In this simulation, we divide time domain
% into several duration, and call each duration as frame. The scanning
% cycle of an oscilloscope is equal to frame period, that means each time
% we simulate a frame of signal, and the display will be refreshed once.
% Therefore, we can get a constantly sliding input signal, a carrier signal
% with phase jitter, and output signal with noise.

% Note: Related to Question 4

for N=0:100                            % Start of for loop
    T=N*ta+(0:ta/999:6*ta);            % Time period of the signal
    new_input=Am*cos(2*pi*fa*T);       % Input Signal
    jitter=rand(size(T));
    new_carrier=Ac*cos(2*pi*fc*(T+jitter)); % Carrier Signal
    new_output=Ac*(1+m*cos(2*pi*fa*T)).*cos(2*pi*fc*T); % Output without noise
    noise=randn(size(T));              % Noise Variable/Introduction
    modulated_output=new_output+noise; % Final Output signal
    subplot(3,1,1)                     % Plot on the quarant of the figure
    plot(T,new_input);                 % Plot the input signal
    grid on;                           % Getting the grid lines 
    hold on;                           % Plot more signals on the same graph
    title('Modulating/Input Signal');  % Label the the graphs
    xlabel('Time in seconds');         % Label x-axis 
    ylabel('Amplitude in Volts');      % Label y-axis 
    subplot(3,1,2)                     % Plot on the same figure opened 
    plot(T,new_carrier);               % Plot the carrier 
    grid on;                           % Grid lines on the graph
    title('Carrier Signal');           % Label the graph
    xlabel('Time in seconds');         % Label the x-axis
    ylabel('Amplitude in Volts');      % Label the y-axis
    subplot(3,1,3)                     % Plot on the same graph on the 3rd part
    plot(T,modulated_output);          % Plot the output signal
    grid on;                           % Grid on the graph
    title('Amplitude Modulated Signal');% Name the graph
    xlabel('Time in seconds');         % Label the x-axis
    ylabel('Amplitude in Volts');      % Label the y-axis
    drawnow;                           % Start the GIF type image to show like oscilloscope signal
end                                    % End the for loop

