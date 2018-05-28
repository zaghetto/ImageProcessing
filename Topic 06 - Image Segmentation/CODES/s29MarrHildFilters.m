%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autor: Alexandre Zaghetto                 %
% Data: 23/05/2017                          %
% Local: McGill University                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The Marr-Hildreth edge detector           %
% Gonzalez 3rd Ed. pg. 715                  %       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
close all
clc

% LoG Equation
x=-3:0.1:3
y = x;
sig = 0.5
for i = 1:length(x)
    for j = 1:length(y)
        LoG(i, j) = ((x(i)^2 + y(j)^2-2*sig^2)/sig^4)*exp( -(x(i)^2 + y(j)^2)/(2*sig^2));
    end
end
figure
mesh(-LoG)

% Convolving the Gaussian with a Laplacian mask
for i = 1:length(x)
    for j = 1:length(y)
        G(i, j) = exp( -(x(i)^2 + y(j)^2)/(2*sig^2));
    end
end

hL = [1 1 1;1  -8  1; 1 1 1];
hLoG = conv2(double(G), double(hL));
figure
mesh(-hLoG)

