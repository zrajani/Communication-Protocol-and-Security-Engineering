% Author: Zain Rajani

% MATLAB Version: R2019b (Student Use)

%% Screen Initialization

clear all;
close all;

%% Creating a 3-D Plot

% Question:Create a 3D plot of a surface by creating a grid along the X and
% Y axes and plotting the Z-coordinate according to the exponential function.

t = linspace(0, 2.5, 250);
function_exp = exp(2*pi*1i*t);
figure(1)
plot3(t, real(function_exp), imag(function_exp), 'LineWidth',2)
grid on
% axis([-1  3 -2  2 -1.5  1.5])
view([-125  30])
xlabel('Time', 'Rotation',-30)
ylabel('Real Axis', 'Rotation',10)
zlabel('Imag Axis')