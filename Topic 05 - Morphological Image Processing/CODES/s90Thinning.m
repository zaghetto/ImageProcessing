%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autor: Alexandre Zaghetto                 %
% Data: 23/05/2017                          %
% Local: McGill University                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Opening & Closing: Fingerprint            %
% Gonzalez 3rd Ed. pg. 649                  %       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
close all
clc

im = imread('Fig0911(a)(noisy_fingerprint).tif');
imshow(im);

% Opening
SE = strel('square',3)
im_o = imopen(im,SE);
figure
imshow(im_o)

% Closing
im_c = imclose(im_o,SE);
figure
imshow(im_c)

% Thinning
 im_th = bwmorph(im_c,'thin',Inf);
 figure
 imshow(im_th)
 



