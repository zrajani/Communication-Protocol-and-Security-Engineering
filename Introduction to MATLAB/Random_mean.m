% Author: Zain Rajani
% Version: R2019b (Student Use)

%% Screen Initialise
close all;
clear all;

%%
%Parameters
rng(22)
xmin=-100; xmax=100;                        % Max and Min value of x-axis
ymin=-1.25; ymax=1.25;                      % Max and Min value of y-axis
Npts=2^8;                                   % No. of Samples

%Variables

xr=linspace(xmin,xmax,Npts);               % Getting numbers in the random space
ydata=2*(rand(1,Npts)-0.5 *ones (1,Npts)); % Getting the data ready
ymean=mean(ydata)*ones(size(ydata));       % Calculating the mean of the samples
%figure;
plot(xr,ydata,'b-.');                      % Plot the data
hold on                                    % Hold on the plot to plot the mean
plot(xr,ymean,'c*');                       % Plot the mean of the sample
legend('data','mean');                     % Mark the lines on the graph
grid on                                    % Get the grid lines on the graph

axis([xmin xmax ymin ymax]);               % Set the axis of the graph