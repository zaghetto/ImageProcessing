%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autor: Alexandre Zaghetto                 %
% Data: 23/05/2017                          %
% Local: McGill University                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The Marr-Hildreth edge detector           %
% Gonzalez 3rd Ed. pg. 716                  %       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
close all
clc

% Load image
I = imread('Fig1016(a)(building_original).tif');

% LoG Equation
sig = 4;
n = 1+2*floor(6*sig/2);

% Convolving the Gaussian with a Laplacian mask
for i = -floor(n/2):floor(n/2)
    for j = -floor(n/2):floor(n/2)
        hG(i+floor(n/2)+1, j+floor(n/2)+1) = exp( -(i^2 + j^2)/(2*sig^2));
    end
end
hG = hG/(sum(hG(:)));

% Convolution between Image and Gaussian
IG = conv2(double(I), double(hG));
figure;
imshow(IG,[]);

% Laplacian of the Gaussian
hL = [1 1 1;1  -8  1; 1 1 1];
ILoG = conv2(double(IG), double(hL));
figure
imshow(ILoG,[]);

% Zero-crossing

% Take the signs of every pixel
sig = double(sign(ILoG));
[h, w] = size(sig);

% Verify signs of oposing pixels in all directions
t1 = filter2([1 0 0; 0 0 0; 0 0 1],sig);
t2 = filter2([0 1 0; 0 0 0; 0 1 0],sig);
t3 = filter2([0 0 1; 0 0 0; 1 0 0],sig);
t4 = filter2([0 0 0; 1 0 1; 0 0 0],sig);

% Absolute value of differences between oposing pixels
i1 = abs(filter2([1 0 0; 0 0 0; 0 0 -1],ILoG));
i2 = abs(filter2([0 1 0; 0 0 0; 0 -1 0],ILoG));
i3 = abs(filter2([0 0 1; 0 0 0; -1 0 0],ILoG));
i4 = abs(filter2([0 0 0; 1 0 -1; 0 0 0],ILoG));

% Pixels that meet the requiriments of zero-crossing and threshold
th = 0.085*max(ILoG(:));
f1 = t1 == 0 & i1 > th;
f2 = t2 == 0 & i2 > th; 
f3 = t3 == 0 & i3 > th; 
f4 = t4 == 0 & i4 > th; 

f = f1 | f2 | f3 | f4;
figure
imshow(f)





