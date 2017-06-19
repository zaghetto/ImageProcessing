%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autor: Alexandre Zaghetto                 %
% Data: 22/05/2017                          %
% Local: McGill University                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% In this example, we start with a spatial  %
% mask and show how to generate its         %
% corresponding filter in the               %
% frequency domain.                         %
% Gonzalez 3rd Ed. pgs. 267-268             %       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
close all
clc

% Read image
I = imread('Fig0438(a)(bld_600by600).tif');
[k, l] = size(I);

% Padding size
nh = 2*k;
nw = 2*l;

% Image padding
img = zeros(nh, nw);
img(1:k, 1:l) = I;

% Filter padding
h = fspecial('sobel')';
filt = zeros(nh, nw);
filt(nh/2:nh/2+2, nw/2:nw/2+2) = h;

% (1) Filter in frequency domain (centered)
for i = 1:nh
    for j = 1:nw
        filt(i,j) = filt(i,j)*(-1)^(i+j);
    end
end
% (2) Compute the forward DFT of the result in (1);
H  = fft2(filt);

% (3) Set the real part of the resulting DFT to 0 to
H  = fft2(filt);
if ~isreal(imag((H)))
    H = imag(H);
end

% (4) Multiply (3) by (-1)^(k+l)
% This last step reverses the multiplication of H(u, v) by (-1)^(k+l)
% which is implicit when h(x, y) was moved to the center of filt(x,y)
% during padding procedure
for i = 1:nh
    for j = 1:nw
        H(i,j) = H(i,j)*(-1)^(i+j);
    end
end

% Image in frequency domain
% Multiplied by (-1)^(k+l) in spacial domain
for i = 1:nh
    for j = 1:nw
        img(i,j) = img(i,j)*(-1)^(i+j);
    end
end
IMG = fft2(img);

% Applying the Sobel filter in the frequency domain
Ffilt = H.*IMG;

% Inverse fourier
ffilt = ifft2(Ffilt);
for i = 1:nh
    for j = 1:nw
        ffilt(i,j) = ffilt(i,j)*(-1)^(i+j);
    end
end

% Show result
imshow(real(ffilt(1:600,1:600)),[])

