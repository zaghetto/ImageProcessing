%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autor: Alexandre Zaghetto                 %
% Data: 06/06/2017                          %
% Local: McGill University                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Sampling                                  %
%                                           %       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
close all;
clc;

% Signal frequency 
fc = 4;

% Sampling frequency (sampling rate)
fa = 100;

% Sampling period
Ta = 1/fa;

% Simulation interval
ti = 0;  % Initial time
tf = 1;  % Final time
t = ti:Ta:tf;

% Simulating a continous signal
tcont = ti:1/(100*fa):tf;
ycont = 3*sin(2*pi*fc.*tcont);

% Sampling the signal
y = 3*sin(2*pi*fc.*t);

% Show continous and sampled signal
set(gca,'FontSize',14)
h = plot(tcont, ycont)
set(h,'LineWidth',1)
hold on
h = stem(t,y,'or','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','g')
xlabel('t (s)')
ylabel('y(t)')
title('Samplig')
h = legend('Continuous Signal', 'Discrete-time Signal')
set(h,'FontSize',12);
grid on


