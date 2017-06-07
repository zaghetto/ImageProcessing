%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autor: Alexandre Zaghetto                 %
% Data: 06/06/2017                          %
% Local: McGill University                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2-D Functions and Images                  %
%                                           %       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
clear all
close all
 
x = -2:0.1:2;
y = -2:0.1:2;
 
for i = 1:length(x)
    for j = 1:length(y)
        z(i,j) =  round(255*(0.5+ x(i).*exp(-x(i)^2 - y(j)^2)));
    end
end
 
imshow(uint8(z));
figure
mesh(z);
