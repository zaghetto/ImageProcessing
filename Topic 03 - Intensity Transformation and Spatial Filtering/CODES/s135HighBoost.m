% Unsharp and Highboost

clear all
close all
clc

%I = imread('tungs.tif');
I = imread('Fig0340(a)(dipxe_text).tif');
figure
imshow(I)

H = fspecial('gaussian',5,3)

If = imfilter(I,H);

figure
imshow(If)

fs = I-If;

figure;
imshow(fs)

A = 4.5
g = I+A*fs;
figure;
imshow(g)

