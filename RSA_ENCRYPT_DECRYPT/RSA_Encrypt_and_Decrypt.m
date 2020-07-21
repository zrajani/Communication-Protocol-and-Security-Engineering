
% Author: Zain Rajani

% Software Used: MATLAB 2020a (Student Version)

%% Screen Initialise Commands 

clc;                                    % Screen Clear
clear all;                              % Clear all the varibales 
close all;                              % Close all the windows opened by MATLAB

c=newline;                              % New Line Command 
disp(c);                                % Display new line or go to new line
disp('              Welcome to Encryption and decryption Center');  % Display the text
disp(c);                                % Go to new line 

%% Input Parameters from the User

msg_send = input('   Enter the message you wish to send: ');  % What msg has to be transmitted 
disp(c);
p= input('   Choose a prime number: ');                       % Choose a prime no. to generate keys
disp(c);
q= input('   Choose a second prime number: ');                % Choose a second prime no to generate keys 
disp(c);

%% Calculate n, phi_n and generate the keys

n=p*q;                                                 % Compute the modulus 
phi_n = (p-1)*(q-1);                                   % Compute the euclidean Totient 

%% Selecting the ciphering exponent e keeping the conditions in mind 

% The following loop find the suitable value of the ciphering exponent 
for i=2:phi_n-1
%     tmp = randi(phi_n);
    if(gcd(i,phi_n)==1)
        e=i;                             % The public key 
        break
    end 
end

%% Using the Extended Euclidean Method and Generating d 

i=1;
remainder=1;
while (remainder > 0)
    k=(phi_n*i)+1;
    remainder = rem(k,e);
    i=i+1;
end 
d = k/e;                                % The private key 

%% Print the keys

fprintf('Private Key Generated: (%d, %d)\n',n,d);
fprintf('Public Key Generated: (%d, %d) \n',n,e);

%% Message Encrypting 

% The message is encrypted using m^e mod n = c where c is the encrypted
% message 

final_msg=(msg_send^e);
c=rem(final_msg,p*q);
%c=mod(final_msg,n);

% Print the encrypted message 
fprintf('Sent Message: %d \t Encrypted Message: %d\n',msg_send,c);

%% Message Decrypting

% A message which is encryoted can be decrypted using c^d mod n = m where m
% is the message that was sent and the actual message can be found removing
% the initial padding

msg_decry=(c^d);
final_decrypt=mod(msg_decry,n);

fprintf('Message to Recieve: %d \t Message Recieved: %d \n',msg_send,final_decrypt);

%% Final Decryption
% 
% % This section of the code performs the actual decryption and by doing the
% % inverse modulation function and gets the message back 
% 
% [q r] = quorem(sym(n),sym(final_decrypt));
% decryption = q;
% decryption = int32(decryption);
% fprintf("Message after decryption recieved is %d \n",decryption);