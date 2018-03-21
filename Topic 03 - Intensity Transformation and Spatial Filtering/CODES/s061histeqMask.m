% Histogram equalization
clc
clear all
close all

% Load original image and ROI mask
I = rgb2gray(imread('061finger.png'));
M = rgb2gray(imread('061mask.png'));
[h, w] = size(I);

% Find the locations of the white pixels
[n, m] = find(M==255);

% Number of pixels in the ROI
N = length(n);

% Copy the pixels of ROI in the Iv vectore
for i=1:length(n)
        Iv(i) = I(n(i),m(i));      
end

% Probability Mass Function (PMF) - Histogram
[nk rk] = hist(Iv, [0:255]);
stem(rk, nk,'.'); grid on; title('Original Image Histogram (PMF)');

% Building the transformation function (CDF - Cumulative Distribution Function )
ps = nk/N;
sk = cumsum(ps);
figure; stem(rk,255*sk,'.'); grid on; title('Original CDF (Transformation Function )'); 
xlabel('r_k'); ylabel('s_k = T(r_k)')
figure; imshow(I)

% Perform equalization
Ih = zeros(h,w);
for i = 1:h
    for j = 1:w
        if M(i,j) == 255
            Ih(i,j) = round(255*sk(I(i,j)+1));
        end
    end
end

% Show equalized image
figure; imshow(uint8(Ih))
imwrite(uint8(Ih), '061fingerheq.png');

% Calculate the histogram of the equalized image (For Debug)

% Copy pixels from roi into Ihv
for i=1:length(n)
        Ihv(i) = Ih(n(i),m(i));      
end

% Probability Mass Function (PMF) 
[nk rk] = hist(Ihv(:), [0:255]);
stem(rk, nk,'.'); grid on; title('Equalized Image Histogram (PMF)');

% Building the transformation function (CDF)
ps = nk/N;
sk = cumsum(ps);
figure; stem(rk,255*sk,'.'); grid on; title('Equalized CDF'); 
xlabel('s_k'); ylabel('T(s_k)')



