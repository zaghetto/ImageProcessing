% Filtro de média
clear all
close all
clc

I = imread('characters_test_pattern.tif');
imshow(I)

H = fspecial('average',11)

If = imfilter(I,H);

figure
imshow(If)