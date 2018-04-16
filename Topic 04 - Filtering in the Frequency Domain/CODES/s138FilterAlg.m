%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autor: Alexandre Zaghetto                 %
% Data: 20/06/2017                          %
% Local: McGill University                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Filtering algorithm                       %
% Example: Ideal lowpass filter             %
% Gonzalez 3rd Ed. pg. 263                  %       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Prepare environment
clear all;
close all;
clc;

% Load image
f =(imread('Fig0429(a)(blown_ic).tif'));
imshow(f)

% Image size
[h,w] = size(f);

% Padding, transform and shifting
fpadding = uint8(zeros(2*h,2*w));
fpadding(h/2+1:h/2+h,w/2+1:w/2+w) =  f;
Fpadding = fftshift(fft2(fpadding));

% Define ideal lowpass filter
D0 = 60;
H = zeros(2*h,2*w);
for i = 1:2*h  
    for j = 1:2*w
        D = sqrt((i-h)^2 + (j-w)^2);
        if D<= D0
            H(i,j) = 1;
        end
    end
end

% Filter
G = Fpadding.*H;

% Calculates the percentage of preserve power
alfa = 100*sum(sum(abs(G).^2))/sum(sum(abs(Fpadding).^2))

% Undo shifting and perfomr inverse transform
g = ifft2(ifftshift(G));

% Extract image
g = g(h/2+1:h/2+h,w/2+1:w/2+w);

% Show filtered image
figure;
imshow(uint8(abs(g)));

