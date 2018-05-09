%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Alexandre Zaghetto                %
% Date: 26/05/2017                          %
% Place: McGill University                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Hit-or-miss transformation                %
% Gonzalez 3rd Ed. pg. 640                  %       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
close all
clc

% Original image
x = zeros(10,10)
x(2:3,8:9) = 1;
x(2:5,2:5) = 1;
x(7:9,7:9) = 1;

vezes = 2;
xrs = imresize(x,[vezes*100 vezes*100], 'nearest');
imshow(xrs)

% Object sought
D = [1 1 1; 1 1 1; 1 1 1];
Drs = imresize(D,[vezes*30, vezes*30],'nearest');
figure;imshow(Drs);

% Erosion of original image
 xerdrs = imerode(xrs,Drs);
 figure; imshow(xerdrs);
 
% Complement of original image
xcrs = not(xrs)
figure; imshow(xcrs);

% Define (W-D)
WD = ones(5,5);
WD(2:4,2:4) = WD(2:4,2:4)-D
WDrs = imresize(WD,[vezes*50,vezes*50],'nearest');
figure; imshow(WDrs);

% Erode the complemented image using WD
xerd2rs = imerode(xcrs, WDrs)
figure; imshow(xerd2rs);

% Result
Res = xerdrs & xerd2rs
figure; imshow(Res)


