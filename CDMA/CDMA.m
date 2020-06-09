% Author: Zain Rajani
% Software: MATLAB R2019b (Student Version)

%% Screen Initialize

clear all;
close all;

%% CDMA Concept Illustration

% The objective of this code to:
% a. Simulate Code Division multiplexing to achieve multiple access in a 
%    shared medium.
% b. Using the Walsh Matrix. Create three data sequences for three users, 
%    encode and decode with the code you chose for all of them from matrix.

% Walsh Matrix Creation (8x8 size matrix)

Walsh_matrix=readtable('Walsh_Matrix.xlsx','Range','A1:H9');
Walsh_matrix=table2array(Walsh_matrix);

% Select the line for communication and input data for transmission

User_1_select = input('\nUser 1 select your line for communication: ');
User_1_data = input ('\nEnter the data for transmission: ');
User_2_select = input('\nUser 2 select your line for communication: ');
User_2_data = input ('\nEnter the data for transmission: ');
User_3_select = input('\nUser 3 select your line for communication : ');
User_3_data = input ('\nEnter the data for transmission: ');

% Check if two users are using the same line

if (User_1_select == User_2_select)
    disp('User 1 and 2 will have crosstalks');
    disp('User 3 Communicating');
    User3_Walsh = Walsh_matrix(User_3_select, :); % Assigning Line 
    User3_encode = User3_Walsh .* User_3_data;    % Encode the data
    User2_encode = 0; User1_encode = 0;           % As communication not possible
    User1_Walsh = 0; User2_Walsh =0;
   
elseif (User_1_select == User_3_select)
    disp('User 1 and 3 will have crosstalks');
    disp('User 2 Communicating');
    User2_Walsh = Walsh_matrix(User_1_select, :); % Assign Line
    User2_encode = User2_Walsh .* User_2_data;    % Encode the data
    User1_encode = 0; User3_encode = 0;           % As communication not possible
    User1_Walsh = 0; User3_Walsh=0;
    
elseif (User_2_select == User_3_select)
    disp('User 2 and 3 will have crosstalks');
    disp('User 1 Communicating');
    User1_Walsh = Walsh_matrix(User_1_select, :); % Assign Line
    User1_encode = User1_Walsh .* User_1_data;    % Encode the data
    User2_encode = 0; User3_encode = 0;           % As communication not possible
    User2_Walsh =0; User3_Walsh=0;
    
elseif (User_1_select == User_3_select == User_2_select)
    disp('All Users will have cross talks');
    % No user data processed
    User2_encode = 0; User3_encode = 0; User1_encode=0;
    User1_Walsh = 0; User2_Walsh =0; User3_Walsh=0;
    
else 
    disp('Initialising Communication for 3 Users');
    % Assigning lines to the users
    User1_Walsh = Walsh_matrix(User_1_select, :);
    User2_Walsh = Walsh_matrix(User_2_select, :);
    User3_Walsh = Walsh_matrix(User_3_select, :);
    % Encoding the data for all the users 
    User1_encode = User1_Walsh .* User_1_data;
    User2_encode = User2_Walsh .* User_2_data;
    User3_encode = User3_Walsh .* User_3_data;
end

% Final Encoded Message
Final_Msg = User1_encode + User2_encode + User3_encode;
% Finding the size of given Walsh Matrix
M = size(Walsh_matrix); % Finding the size of matrix

% Decode the Message recieved 

User1_decode = Final_Msg .* User1_Walsh;
User2_decode = Final_Msg .* User2_Walsh;
User3_decode = Final_Msg .* User3_Walsh;

% Final Decoding 

User_1_Msg = ((sum(User1_decode,2)/M(1)))';
User_2_Msg = ((sum(User2_decode,2)/M(1)))';
User_3_Msg = ((sum(User3_decode,2)/M(1)))';


