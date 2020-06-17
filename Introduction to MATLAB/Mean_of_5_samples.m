% Author: Zain Rajani
% Version: R2019b (Student Use)

%% Screen Initialise
clear all;
close all;

%% Comparing data with mean

%Question: 
% Write a script that calculates the mean of five samples of data from a
% vector of random data. Calculate the overall mean. Use a for loop to
% perform the calculations. For each iteration of the loop print out the
% intermediate results. Use an if..else control block to display the results
% depending on whether the mean of the samples is less than, greater than
% or equal to the overall mean

%Parameters;
rng(832);
xmin=-100; xmax=100;            % Set values of x-axis
ymin=-1.25; ymax=1.25;          % Set values of y-axis
Npts=5*2^8;                     % No. of samples
Nss=5;                          % Sample Size
sum=0;                          % Initialize sum
MAdata=ones(5,5);               % Matrix data
Final_Result=strings(5,5);      % Matrix to store final result

%Variables
testvector=rand(25,1);          % Generate the vector
Adata=reshape(testvector,[Nss,Nss])';

overallmean=mean(testvector)*ones(size(Adata)) % Calculate the mean

% The below loop compares the data and stores the result in the desired
% matrix which can be viewed at later stage

for r=1:5
    for c=1:5
        sum=sum + Adata(r,c);
        MAdata(r,c)=sum/c
        if (MAdata(r,c)< overallmean)
            Final_Result(r,c)= 'Less';
        elseif (MAdata(r,c) > overallmean)
            Final_Result(r,c)= 'Greater';
        else
            Final_Result(r,c)= 'Equal';
        end
    end
    sum=0;
end
disp(Final_Result);                 % Display the final result matrix


