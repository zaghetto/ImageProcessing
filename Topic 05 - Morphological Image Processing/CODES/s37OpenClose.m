%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autor: Alexandre Zaghetto                 %
% Data: 23/05/2017                          %
% Local: McGill University                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Opening & Closing                         %
% Gonzalez 3rd Ed. pg. 637                  %       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
close all
clc

im = imread('shapes.tif');
imshow(im);

% Opening
SE = strel('disk',10)
im_o = imopen(im,SE);
figure
imshow(im_o)

 
% Closing
im_c = imclose(im,SE);
figure
imshow(im_c)