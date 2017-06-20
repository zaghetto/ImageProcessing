%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Alexandre Zaghetto                %
% Date: 26/05/2017                          %
% Place: McGill University                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Boundary Extraction                       %
% Gonzalez 3rd Ed. pg. 642                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
close all
clc

BW1 = imread('Fig0914(a)(licoln from penny).tif');
figure
imshow(BW1)

Elem = strel('square',3);
BWErod = BW1-imerode(BW1, Elem);
figure;
imshow(BWErod);
