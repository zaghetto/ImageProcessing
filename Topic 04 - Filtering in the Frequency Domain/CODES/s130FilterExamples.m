%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autor: Alexandre Zaghetto                 %
% Data: 23/05/2017                          %
% Local: McGill University                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Examples of low/highpass filtering        %
%                                           %
% Gonzalez 3rd Ed. pg. 259                  %       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
close all;
clc;

% Lowpass
f =(imread('blown.tif'));
imshow(f)
[h,w] = size(f);
H = fspecial('gaussian',[h w],h/8);
H = H/max(max(H));
figure
mesh(H)
F = fftshift(fft2(f));
G = F.*H;
g = ifft2(G);
figure;
imshow(uint8(abs(g)))

% Highpass
H = fspecial('gaussian',[h w],h/16);
H = 1-(H/max(max(H)));
figure
mesh(H)
F = fftshift(fft2(f));
G = F.*H;
g = ifft2(G);
figure;
imshow(uint8(abs(g)))

% Highpass enhancement
H = fspecial('gaussian',[h w],h/16);
H = 1-(H/max(max(H)));
H = H +0.9;
figure
mesh(H)
F = fftshift(fft2(f));
G = F.*H;
g = ifft2(G);
figure;
imshow(uint8(abs(g)))











