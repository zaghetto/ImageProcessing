% Convolution & padding
clear all
close all
clc

f = [3*ones(1,300) zeros(1,100)]
h = [2*ones(1,200) zeros(1,200)]

% Convolution
convfh = conv(f,h)
plot(convfh)
axis([0 800 0 1300])
grid on

% Convolution using DFT and convolution theorem
F = fft(f);
H = fft(h);

multFH = F.*H

figure
convfhCirc = ifft(multFH)
plot(convfhCirc,'--r')
axis([0 400 0 1300])
grid on

% Convolution using padding, DFT and convolution theorem
P = zeros(1, length(f)+length(h)-1);

f = [f P];
h = [h P];
F = fft(f);
H = fft(h);

multFH = F.*H;

figure
convfhCirc = ifft(multFH)
plot(convfhCirc,'k')
axis([0 800 0 1300])
grid on


