% Unsharp and Highboost

clear all
close all
clc

I = imread('tungs.tif');
figure
imshow(I)

H = fspecial('average',11)

If = imfilter(I,H);

figure
imshow(If)

fs = I-If;

figure;
imshow(fs)

A = 1.5
g = I+A*fs;
figure;
imshow(g)

