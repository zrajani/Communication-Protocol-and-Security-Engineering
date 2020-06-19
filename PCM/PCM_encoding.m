
% Author: Zain Rajani
% Software: MATLAB R2019b (Student Version)

%% Screen and Data Clearance 

clear all;
close all;
clc;

%% Signal Generation 

% Analog signal Generation (Could be a sine or cosine wave)
% Illustrated below is cosine wave 

% Select the range of frequency for the signal

freq_signal= input('Enter the frequency of the signal: ');

t=0:0.01:1;                           % Time range for the signal

A= 2;                                 % Amplitude of the signal 

signal = A*cos(2*pi*freq_signal*t);   % Signal Calculations

figure(1);                            % Plotting the signal
plot(t,signal,'LineWidth',4);         % Plot the signal on the graph
grid on;
title('Orignal Signal','FontSize',16);% Plot name 
xlabel('Time t\rightarrow');          % X-axis Name
ylabel('Amplitude \rightarrow');      % Y-axis Name 

%% Sampling Signal 
freq_samp = (2* freq_signal)/2;       % Sampling Frequency using Nyquist Criteria

ts = 0:0.01:1;                        % Sampling time 

signal_sam = A*cos(2*pi*freq_samp*ts); % Sampled Signal 

figure (2)
stem(ts,signal_sam,'LineWidth',2);    % Plot the sampled signal 
hold on;                              % Wait to plot on the same graph
plot(t,signal,'LineWidth',4);         % Plot the orignal signal 
                                      % Plot Descriptors
title('Orignal and Sampled Signal','FontSize',16); % Plot Name 
xlabel('Time t\rightarrow');          % X-axis Name
ylabel('Amplitude \rightarrow');      % Y-axis Name 
legend ('Sampled Signal','Orignal Signal');  % Identifier for two graphs plotted

%% Quantization of the signal

% Type of Quantization Used 

n= input ('Enter the number of bits for quantization: ');

ymax = max(signal_sam);                      % Find the maximum amplitude of signal
delta = (2*ymax)/((2^n)-1);                  % Mid-tread Quantization

c=((-ymax)-(delta/2)):delta:(ymax+(delta/2));  % Codebooks 
    
p=[(-ymax):delta:ymax];                      % Partition Created

[~,quants]=quantiz(signal_sam,p,c);          % Signal Quantized 

l1=length(quants);                           % Length of Quantized Signal

% Shapping the quantized Signal
for i=1:l1
        if(quants(i)==((-ymax)-(delta/2)))
        quants(i)=((-ymax)+(delta/2));
    end
end

%Plot the Quantized Signal
figure(3)
stem(ts,quants,'LineWidth',2);
hold on
plot(ts,signal_sam,'LineWidth',4);
                                      % Plot Descriptors
title('Quantized and Sampled Signal','FontSize',16); % Plot Name 
xlabel('Time t\rightarrow');          % X-axis Name
ylabel('Amplitude \rightarrow');      % Y-axis Name 
legend ('Quantized Signal','Sampled Signal');  % Identifier for two graphs plotted

%% PCM Encoding 

% Convert the signal to digital form first 

quants_0= max(0,quants);    % Converts all negative and 0 to equivalent 0

% Data change to logical form for encoding

quants_l= logical(quants_0);         % Logical array

% Menu Created for the user to select the type he/she wishes to use

encode_type=menu('Encoding Method','Return to Zero (RZ)',...
    'Manchester Coding','Non-return to zero (NRZ)',...
    'On-Off Signalling (Unipolar)');
if (encode_type==1)                     % Return to Zero (RZ)
    l=length(quants_l);
    for i=0:l-1
        if (quants_l(i+1)==0)
            y(2*i+1)=0;
            y((2*i)+2)=0;
        else
            y(2*i+1)=2;
            y((2*i)+2)=0;
        end
    end
    % Plot the signal
    figure(4);
    t=[1:size(y,2)];
    stem(y,'LineWidth',4);
    xlim([0 size(y,2)]);
    title('Encoded Signal: Return to Zero (RZ)','FontSize',16);
    xlabel('Time t\rightarrow');          % X-axis Name
    ylabel('Amplitude \rightarrow');      % Y-axis Name 
    
elseif (encode_type==3)                 % Non-return to zero (NRZ)
    for i=1:length(quants_l)
        if quants_l(i)==1
            z(i)=1;
        else 
            z(i)=-1;
        end 
    end
    figure(4);
    stem(ts,z,'LineWidth',4);
    title('Encoded Signal: Non-return to Zero (NRZ)','FontSize',16);
    xlabel('Time t\rightarrow');          % X-axis Name
    ylabel('Amplitude \rightarrow');      % Y-axis Name 
    
elseif (encode_type==2)                   % Manchester Coding
    l=length(quants_l);
    for i=0:l-1
        if (quants_l(i+1)==1)
            y(2*i+1)=2;
            y((2*i)+2)=-2;
        else
            y(2*i+1)=-2;
            y((2*i)+2)=2;
        end 
    end
    figure(4)
    t=[1:size(y,2)];
    stem(t,y,'LineWidth',4);
    xlim([0 202]);
    title('Encoded Signal: Manchester Coding','FontSize',16);
    xlabel('Time t\rightarrow');          % X-axis Name
    ylabel('Amplitude \rightarrow');      % Y-axis Name 
    
elseif (encode_type==4)                  %Processing Unipolar Coding
    for (i=1:length(quants_l)) 
        if quants_l(i)==1
            y(i)=1;
        else 
            y(i)=0;
        end 
    end 
    figure(4);
    stem(ts,y,'LineWidth',4);
    title('Encoded Signal: Unipolar (On-Off) Signalling','FontSize',16);
    xlabel('Time t\rightarrow');          % X-axis Name
    ylabel('Amplitude \rightarrow');      % Y-axis Name 
   
end
%%