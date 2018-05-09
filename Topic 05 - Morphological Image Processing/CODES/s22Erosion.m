%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autor: Alexandre Zaghetto                 %
% Data: 23/05/2017                          %
% Local: McGill University                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Erosion                                   %
% Gonzalez 3rd Ed. pg. 632                  %       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
close all
clc

im = imread('Fig0905(a)(wirebond-mask).tif');
imshow(im);

% Square structuring element of size 11 x 11
SE = strel('square',15)

im_e = imerode(im,SE);
figure
imshow(im_e);
