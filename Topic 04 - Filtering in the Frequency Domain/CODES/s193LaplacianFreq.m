%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autor: Alexandre Zaghetto                 %
% Data: 23/05/2017                          %
% Local: McGill University                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Image sharpening in the frequency         %
% domain using the Laplacian                %
% Gonzalez 3rd Ed. pg. 268                  %       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
close all;
clc;

% Read image
f = imread('Fig0458(a)(blurry_moon).tif');
imshow(f);
[h,w] = size(f);
fN = double(f)/double(max(f(:)));

% Padding de f
fpadding = double(zeros(2*h,2*w));
fpadding(h/2+1:h/2+h,w/2+1:w/2+w) =  fN;

% Transform and spectrum shift
Fpadding = fftshift(fft2(fpadding));

% Laplaciano filter in frequency domain
H = double(zeros(2*h,2*w));
for i = 1:2*h  
    for j = 1:2*w
        D = sqrt((i-h).^2 + (j-w).^2);        
        H(i,j) = -(4*(pi^2)*D^2);
    end
end

% Filter, undo shift, inverse transform, real part (4.9-7)
nabla2f = real(ifft2(ifftshift(H.*Fpadding)));

% Undo padding 
nabla2f = nabla2f(h/2+1:h/2+h,w/2+1:w/2+w);

% Normalize
figure
nabla2fN = nabla2f/max(nabla2f(:));
imshow(nabla2fN)

% Enhance using (4.9-8)
g = uint8(255*(double(fN)-double(nabla2fN)));

figure
imshow(g)








