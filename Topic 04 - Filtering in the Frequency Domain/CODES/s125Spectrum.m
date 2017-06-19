%%%%%%%%%%%%
% Spectrum %
%%%%%%%%%%%%
clear all
close all
clc

f = imread('Fig0429(a)(blown_ic).tif');
F = fftshift(fft2(f));
imshow(abs(F).^0.15,[])



