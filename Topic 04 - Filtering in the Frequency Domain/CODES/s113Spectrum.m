%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autor: Alexandre Zaghetto                 %
% Data: 18/06/2017                          %
% Local: McGill University                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2D-DFT Spectrum                           %
% Translation and Rotation                  %       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
close all;
clc;

f = double(imread('rect.tif'));
imshow(f)
F = abs(fft2(f));
figure
imshow(F,[])
Fd = fftshift(F);
figure
imshow(Fd,[])
Fr = Fd.^0.2;
figure
imshow(Fr,[])


f = double(imread('rect_shift.tif'));
figure
imshow(f)
F = abs(fft2(f));
figure
imshow(F,[])
Fd = fftshift(F);
figure
imshow(Fd,[])
Fr = Fd.^0.2;
figure
imshow(Fr,[])

f = imrotate(imread('rect.tif'),-45,'nearest');
figure
imshow(f)
F = abs(fft2(f));
figure
imshow(F,[])
Fd = fftshift(F);
figure
imshow(Fd,[])
Fr = Fd.^0.2;
figure
imshow(Fr,[])