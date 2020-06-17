% Author: Zain Rajani 

% MATLAB Version: R2019b

%% Screen Clearance

close all;
clear all;

%% Illustrate use of if-else and if statement
nrows = 4;
ncols = 6;
z = ones(nrows,ncols); 
for r= 1:nrows
    for c=1:ncols
        if r == c
            z(r,c) = 22;
        elseif abs(r-c) == 1
            z(r,c) = 7;
        else
            z(r,c) = 95;
        end
        
    end
end
disp('  ');
disp('  ');
disp('Your Generated Matrix is:');
disp(z);