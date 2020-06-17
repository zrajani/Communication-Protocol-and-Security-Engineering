% Author: Zain Rajani
% Version: R2019b (Student Use)

%% Screen Initialize

clear all;
close all;

%% Illustrate the while loop

% Question: Create a script to perform loop with while condition

% The following program opens a file and counts the number of lines in the
% file escaping the blank lines and the comments line.

fid = fopen('if_else_implement.m','r'); % File opened for reading purpose
count = 0;                              % Initial Count
while ~feof(fid)                        % Start to read the file with while condition
    line = fgetl(fid);                  % get the lines in the file
    % The following is the condition of what has to be counted and what is
    % not to be counted
    if isempty(line) || strncmp(line,'%',1) || ~ischar(line) 
        continue   % Helps in skipping and continue to read the file
    end
    count = count + 1;                  % Update the value of count 
end
disp('The total number of lines are:');
disp(count)                             % Display the final count value
fclose(fid);                            % Close the opened file