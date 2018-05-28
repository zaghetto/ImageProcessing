%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autor: Alexandre Zaghetto                 %
% Data: 01/06/2017                          %
% Local: McGill University                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Canny edge detector                       %
% Gonzalez 3rd Ed. pg. 719                  %       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
close all
clc

% Load image
I = imread('Fig1016(a)(building_original).tif');

% Canny

% BW = edge(I,'Canny',threshold) 
% threshold is a two-element vector in which the first element is the 
% low threshold, and the second element is the high threshold. 
% If you specify a scalar, edge uses this value for the high value 
% and uses threshold*0.4 for the low threshold.

BW = edge(I,'Canny',[0.04 0.39]);
imshow(BW)


I = imread('Fig1026(a)(headCT-Vandy).tif');
figure
BW = edge(I,'Canny',[0.04 0.39]);
imshow(BW)



