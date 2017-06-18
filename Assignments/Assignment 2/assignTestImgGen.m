%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autor: Alexandre Zaghetto                 %
% Data: 16/06/2017                          %
% Local: McGill University                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assignment 2                              %
% Test images generation                    %       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
close all
clc

% Load image
I = imread('airport.bmp');
[r, c, z] = size(I);
figure(1)
imshow(I)

% Generate Texture
T = double(checkerboard(5,72,72) > 0.5); 
figure, imshow(T)
h = fspecial('Gaussian',3,1);
T = imfilter(T,h);
figure(2)
imshow(T,[])

% Convert color space
YCbCr = rgb2ycbcr(I);

% Show Cr
figure(3)
imshow(YCbCr(:,:,3))

% Apply texture
CrTexture =  (double(YCbCr(:,:,3))  +  (64*double(T)+128) )/2;
figure(4)
imshow(CrTexture,[]);

% FFT
CR = fftshift(fft2(double(CrTexture)));
figure(5)
imshow(abs(CR).^0.1,[])

% Notch filter
Hf = double(imread('Notchfilter.bmp'));

Filtered = CR.*Hf/255;
figure(6)
imshow(abs(Filtered).^0.1,[]);

% Inverse transform
CrR = uint8(real(ifft2(ifftshift(Filtered))));
figure(7)
imshow(CrR)
h = fspecial('Gaussian', 5, 2);
CrR = imfilter(CrR, h);

% Reconstruct the image using only corrupted Cr - DEBUG ONLY
% YcbcrNoise(:,:,1) = YCbCr(:,:,1);
% YcbcrNoise(:,:,2) = YCbCr(:,:,2);
% YcbcrNoise(:,:,3) = CrR*0.9;
% 
% Irec = ycbcr2rgb(YcbcrNoise);
% imshow(Irec)

N = 100
YcbcrNoise = zeros(r,c,z);
for i = 1:N
    YcbcrNoise = YCbCr;
    noiseY = 16*randn(r, c);
    YcbcrNoise(:,:,1) = double(YcbcrNoise(:,:,1))+double(noiseY);    
    YcbcrNoise(:,:,2) = imnoise(YcbcrNoise(:,:,2),'salt & pepper',0.02);    
    YcbcrNoise(:,:,3) = 0.9*CrTexture;    
    Icorrupted = ycbcr2rgb(YcbcrNoise);
    
    imwrite(uint8(Icorrupted), [num2str(i) '.bmp']);
    
%     figure(8)
%     imshow(YcbcrNoise(:,:,1),[])
%     figure(9)
%     imshow(YcbcrNoise(:,:,2),[])
%     figure(10)
%     imshow(YcbcrNoise(:,:,3),[])
%     figure(11)
%     imshow(uint8(Icorrupted))
end
    
break

%%%%%%%%%%%%%%%%
% Remove noise %
%%%%%%%%%%%%%%%%

clear all
close all
clc

% Load pre-defined notch filter
Hf = double(imread('Notchfilter.bmp'));
[r, c, z] = size(Hf);

% Recover Y through averaging of y planes
N = 100;
A = zeros(r, c, N);
for i = 1:N
    I        = imread([num2str(i) '.bmp']);    
    Ycbcr    = rgb2ycbcr(I);          
    A(:,:,i) = Ycbcr(:,:,1);  
end

Ymed = zeros(r,c);
for i = 1:r
    for j = 1:c
        Ymed(i,j) = mean(A(i,j,:));
    end
end

% The Cb plan can be recovered from any image using a median filter
Ycbcr(:,:,2) = uint8(medfilt2(Ycbcr(:,:,2)));

% The Cb plan can be recovered from any image using notch filters
% in the frequency domain
Inoise = imread('1.bmp');
YcbcrNoise = rgb2ycbcr(Inoise);
imshow(YcbcrNoise(:,:,3))

CR = fftshift(fft2(double(YcbcrNoise(:,:,3))));
Filtered = CR.*Hf/255;
CrR2 = (ifft2(ifftshift(Filtered)));
Ycbcr(:,:,3) = uint8(abs(CrR2));

% Insert the luminance in the matrix
Ycbcr(:,:,1) = Ymed;

% Show result
Ir = ycbcr2rgb(Ycbcr);

imshow(Ir,[]);

imwrite(Ir,'denoised.png');
    
    


