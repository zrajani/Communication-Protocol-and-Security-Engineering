
% Author: Zain Rajani 

% Software: MATLAB (R2020a)

%% Starting Screen 

clear all;
clc;                                        % Clear Screen
clear all;                                  % Clear Workspace and Variables 
close all;                                  % Close all open windows 
c= newline;                                 % Create a new line variable like \n 
disp(c);                                    % Display the character
disp('      Lab Topic: Key Generation through RSA Algorithm'); % Display line 
disp(c);                                    % Go on a new line 

%% Step 1: Select n whose key needs to be found 

% Ask the user what has to be for what the key has to be generated 

n = input('   Enter the RSA modulus: ');
disp(c);                                    % Go to new line 

%% Step 2: Finding the factors of n as p and q 

factors = factor(n);                        % Find the factors for which key needs to be generated 
p = factors(1);                             % Write the factors in different variables 
q = factors(2);                             % Write the factors in different variables 

%% Step 3: Compute phi(n)

%phi_n = (p-1)*(q-1);                        % Formula to compute Φ(n) 
phi_n=lcm(p-1,q-1);
%% Step 4: Enciphering exponent 'e'

% Display the statements 

disp('   Choose the value of e it should satisfy the condition 1 < e < Φ(n)');
disp(c);                                    % New line command
fprintf('   Your Current Φ(%.1f) = %.1f\n',n,phi_n)      % Print values for user reference 
disp(c)                                     % New line command 
e = input('   Enter the ciphering exponent: ');% Wait for user to enter the public key it has 
disp(c);                                    % New Line command 

gcd_1=gcd(e,phi_n);                         % Verify variable if gcd (e,phi_n)=1 
%% Step 5: Calculate the modulus d of Φ(n) with Euclidean Theorm 

% The below loop check if the entered public key value is within the
% accepted conditions or no

if (1<e && e<phi_n && gcd_1==1)                        % Check if e is 1<e<Φ(n)
    disp('   Ciphering Exponent e Accepted......');% display statement on screen if key accepted
    disp(c);
    i=1;                                   % Variable Initialise for while loop
    remainder=1;                           % Variable Initialise for while loop
    
    % The following loop performs "EXTENDED EUCLIDEAN ALGORITHM" or
    % computes the GCD until remainder is non-zero
    
    while (0<remainder)                    
        k=(phi_n*i)+1;
        remainder=rem(k,e);
        i=i+1;
    end
    
    d = k/e;                               % Find the deciphering exponent using inverse of public key 
                                           % (n,e) -----> public key
                                           % (n,d) -----> private key
    disp('   Process Completed........');  % Display statement on screen 
    disp(c);                               % New Line 
    fprintf('   Public key Generated is (%.1f,%.1f)\n',n,e);    % Display the public key 
    disp(c);                               % New Line 
    fprintf('   Private key Generated is (%.1f,%.1f)\n',n,d);   % Display the private key 
    disp(c);                               % New line 
    disp('********** RSA KEY GENERATION ENDED **********');     % Display to show the end of the code 
    
else                                                            % If is not in acceptable range
    if (gcd_1>1)
        disp('   Aborting as GCD condition not satisfied');
        disp(c)
        fprintf('   GCD of the data is %.1f\n',gcd_1);
        disp(c);
    else
        disp('   Aborting please restart the process......');   % Display it is not acceptable 
        disp(c);                                                % New Line
    end
    
end                                        % End for the if-else loop 
