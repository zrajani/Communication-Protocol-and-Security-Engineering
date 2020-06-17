% Author: Zain Rajani
% Version: R2019b

%% Screen Initialize

close all;
clc;

%% Illustrate the use of switch statements

% To illustrate the switch statement we will do the following:
% We will take some data from the user and then ask the user which kind of
% plot he would wish to see with the data he/she has provided.

x=[1 2 3 4 5 6 7 8 9 10];               % Data to plot randomly
disp(' ');
disp('Welcome to Plot-Viewer');         % Screen Display
disp('simple: simple_plot');            % Screen Display
disp('Bar : Bar_graph');                % Screen Display
disp('Pie: Pie_chart');                 % Screen Display
                                        % Wait for the user to choose
plottype=input('Enter the plot you wish to see: ','s');
                                        % The switch case starts
switch plottype
    case 'Bar'                          % Plot bar graphs
        bar(x)
        title('Bar Graph')
    case {'pie','pie3','Pie_chart'}     % Plot Pie charts
                                        % Note how alternatives can be used
        pie3(x)
        title('Pie Chart')
    case 'simple_plot'                  % Plot using simple plot
        plot(x);
        title('Simple Plot');
                                        % If nothing matches 
    otherwise
        warning('Unexpected plot type. No plot created.')
end
                                        % Termination of the code
