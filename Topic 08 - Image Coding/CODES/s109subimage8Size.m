%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autor: Alexandre Zaghetto                 %
% Data: 08/06/2017                          %
% Local: McGill University                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Subimage size selection                  %
%  Gonzalez 3rd Ed. pg. 573                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Another significant factor affecting transform coding error and computational
% complexity is subimage size. In most applications, images are subdivided so
% that the correlation (redundancy) between adjacent subimages is reduced to
% some acceptable level and so that n is an integer power of 2 where, as
% before, n is the subimage dimension. The latter condition simplifies the computation of
% the subimage transforms (see the base-2 successive doubling method discussed
% in Section 4.11.3). In general, both the level of compression and computational
% complexity increase as the subimage size increases. The most
% popular subimage sizes are 8 x 8 and 16 x 16

clear all
close all
clc

% Load image
I = imread('Fig0809(a).tif');
[h, w] = size(I);


fun = @(block_struct) selecoeffs8Size(block_struct.data);
I2 = blockproc('Fig0809(a).tif',[8 8],fun);

I = double(I);
I2 = double(I2);

erro = sqrt( (sum( ((I(:)-I2(:)).^2))/(h*w) )) 

difI = I-I2;

imshow(difI,[])







