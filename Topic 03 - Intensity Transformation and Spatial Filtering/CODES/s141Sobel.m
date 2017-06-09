% Sobel

clear all
close all
clc

I = imread('Fig0342(a)(contact_lens_original).tif');
figure
imshow(I)

sobel = 0; % 0 => Roberto cross-gradient; 1 => sobel
% Filtro d
if sobel
    H = fspecial('sobel');
else
    H = [-1 0; 0 1]
end
If = imfilter(I,H);

figure
imshow(If)

if sobel
    H2 = H';
else
    H2 = [0 -1; 1 0]
end

If2 = imfilter(I,H2);
figure
imshow(If2)

If3 = If+If2;

figure
imshow(If3)