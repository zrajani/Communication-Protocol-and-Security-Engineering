% Author: Zain Rajani
% Version: R2019b

%% Screen Intialize

close all;
clear all;

%% Calculating sum of arbitary numbers of sinusoidal terms 

% The sum of arbitary sinusoidal terms is calculated by creating a function
% and then calling it from the script or from command window

tr=linspace(0,2*pi,1000);  % No of points for the arbitary sums
omega=4;
% Arbitary terms
y1=sin(omega*tr);  
y2=cos(2*omega*tr);
y3=sin(2*omega*tr);
y4=cos(omega*tr);
ytotal=[y1;y2;y3;y4];  % Compute Sum Matrix

z=sumfuncs(ytotal);  % Function Call to find the total value

plot(z); % Plot the signal 
