% Filtro de média seguido de binarização
clear all
close all
clc

I = imread('Fig0334(a)(hubble-original).tif');
imshow(I)

H = fspecial('average',7)

If = imfilter(I,H);

Ibin = If > 128;

figure
imshow(If)

figure
imshow(Ibin)