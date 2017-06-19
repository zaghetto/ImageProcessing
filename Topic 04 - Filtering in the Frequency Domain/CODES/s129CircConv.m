%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autor: Alexandre Zaghetto                 %
% Data: 16/06/2017                          %
% Local: McGill University                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Circular Convolution and Padding          %
%                                           %       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
close all;
clc;

f =(imread('square.tif'));
imshow(f)
[h,w] = size(f);
H = fspecial('gaussian',[h w],h/32);
H = (H/max(max(H)));
figure
mesh(H)
F = fftshift(fft2(f));
G = F.*H;
g = ifft2(G);
figure;
imshow(uint8(abs(g)))

% Preenchimento padding de f
fpadding = zeros(2*h,2*w);
fpadding(h/2+1:h/2+w,w/2+1:w/2+w) =  f;
Fpadding = fftshift(fft2(fpadding));

% Preenchimento com padding de H
Hpadding = fspecial('gaussian',[2*h 2*w],2*h/32);
Hpadding = (Hpadding/max(max(Hpadding)));
figure
mesh(Hpadding)

G = Fpadding.*Hpadding;
g = ifft2(G);
g = g(h/2+1:h/2+h,w/2+1:w/2+w);
figure;
imshow(uint8(abs(g)))