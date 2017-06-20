%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autor: Alexandre Zaghetto                 %
% Data: 23/05/2017                          %
% Local: McGill University                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dilation                                  %
% Gonzalez 3rd Ed. pg. 634                  %       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
close all
clc

im = imread('Fig0907(a)(text_gaps_1_and_2_pixels).tif');
imshow(im);

% Square structuring element of size 11 x 11
SE = strel([0 1 0; 1 1 1; 0 1 0]);

im_e = imdilate(im,SE);
figure
imshow(im_e);
