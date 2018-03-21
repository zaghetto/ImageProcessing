% O operador laplaciano

clear all
close all
clc

I = imread('Fig0338(a)(blurry_moon).tif');
figure
imshow(I)

H = [0 1 0; 1 -4 1; 0 1 0]

%H = [1 1 1; 1 -8 1; 1 1 1]
% H = -1*H;

If = imfilter(I,H);
figure
imshow(If)


if H(2,2) < 0
    g = I-If;
else    
    g = I+If;
end

figure
imshow(g)

