%%%%%%%%%%%%%%%%%%%%%%%%
% Fourier              %
%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
close all;
clc;

S = 0;

% Simulation interval
ti = -3;  % Beginning
tf = 3;  % End

% Time
tcont = ti:1/200:tf;

% Terms
N =100


for i = 1:N
        
    % Frequency
    fc = i;
    ycont = -2*(((-1)^i)/(pi*i))*sin(pi*i.*tcont);
    
    figure(1)
    plot(tcont, ycont)    
    axis([ti tf -1 1])
    grid on
    
    pause
        
    S = S + ycont;
          
    figure(2)
    plot(tcont, S)                  
    grid on
         
end
