%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autor: Alexandre Zaghetto                 %
% Data: 07/06/2017                          %
% Local: McGill University                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Basic Intensity Transformation Functions  %                                      %
%                                           %       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


clear all;
close all;
clc;

% Bit-depth
N = 8;

% Number of gray levels
L = 2^N;

% Gray levels
r = 0:L-1;

% Identity
s = r;
plot(r,s);
hold on
xlabel('r');
ylabel('s = T(r)');
axis([0 255 0 255])
grid on

% Negative
s = L-1-r;
plot(r,s,'r');

% Log
s = log2(1+r);
s2 = 255*(s/max(s));
plot(r,s2,'b--');
hold on

% Inverse log
s2 = (2).^s -1
s2 = 255*(s2/max(s2));
plot(255*(s/max(s)),s2,'b--');

% Power
gama = 2
s = (r.^gama)
s = 255*s/max(s)
plot(r,s,'k-.');

% Square root
s = sqrt(r)
s = 255*s/max(s)
plot(r,s,'r-.');