%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autor: Alexandre Zaghetto                 %
% Data: 31/05/2017                          %
% Local: McGill University                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Granulometry                              %
% Gonzalez 3rd Ed. pg. 674                  %       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
close all
clc

im = imread('Fig0941(a)(wood_dowels).tif');
imshow(im);

% Smoothing
SE = strel('disk',5);
im_s = imopen(im,SE);
im_s = imclose(im_s,SE);
figure
imshow(im_s)
 
% Openings
for r = 1:40    
    SE = strel('disk',r);
    im_o = imopen(im_s,SE);
    imshow(im_o);
    SA(r) = sum(im_o(:));
end
figure
x = abs(SA(1:end-1)-SA(2:end));
plot(2:40,x)
xlabel('radius')
ylabel('Differences in surface area')
grid on;
    



