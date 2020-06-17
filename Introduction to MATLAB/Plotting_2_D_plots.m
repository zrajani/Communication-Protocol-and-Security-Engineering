% Author : Zain Rajani

% MATLAB Version: R2019b (Student Use)

%% Initialize

clear all;
close all;

%% Creating a 2-D Plot

% Question: Create 2-D Plot for sine wave between 0 to 2*pi

% Declare the global variable values [Setting the max and min values of the
% x and y axis]
xmin=0;
xmax=6.3;
ymin=-1.5;
ymax=1.5;

n=0:0.001:2*pi;                 % Range to calculate the values 
x=sin(n);                       % Find the values of sin(n) for the range 
                                % declared above
plot(n,x,'--r','Linewidth',2);  % Plot the function of sin(n) on the graph 
                                % of MATLAB. We have used the graph 
                                % enhancement tools here along with the 
                                % plot command
title('Sine Function from 0 to 2{\pi}');          % Title of the graph
ylabel('Amplitude'); xlabel('Time (in radians)'); % Label the x and y axis
xticks([0 pi/2 pi 3*pi/2 2*pi])                   % Setting the values on 
                                                  % x-axis
xticklabels({'0','\pi/2','\pi','3\pi/2','2\pi'}); % Printing the values of x-axis
grid on;                        % Enabling the grids on the graph
axis ([xmin xmax ymin ymax]);   % Setting/Limiting the values shown on the graph
legend ('Sine Wave');