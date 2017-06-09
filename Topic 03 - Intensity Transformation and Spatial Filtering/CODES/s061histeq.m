% Histogram equalization
clc
clear all
close all
 
I = imread('tire.tif');
[h, w] = size(I);
n = length(I(:));

% Probability Mass Function (PMF) 
[nk rk] = hist(I(:), [0:255]);
stem(rk, nk,'.'); grid on; title('Original Image Histogram (PMF)');

% Building the transformation function (CDF)
ps = nk/n;
sk = cumsum(ps);
figure; stem(rk,255*sk,'.'); grid on; title('Transformation Function (CDF)'); 
xlabel('r_k'); ylabel('s_k = T(r_k)')
figure; imshow(I)

% Equalization
for i = 1:h
    for j = 1:w
        Ih(i,j) = round(255*sk(I(i,j)+1));
    end
end
figure; imshow(uint8(Ih))

% Probability Mass Function (PMF) 
[nk rk] = hist(Ih(:), [0:255]);
stem(rk, nk,'.'); grid on; title('Original Image Histogram (PMF)');

% Building the transformation function (CDF)
ps = nk/n;
sk = cumsum(ps);
figure; stem(rk,255*sk,'.'); grid on; title('Equalized CDF'); 
xlabel('s_k'); ylabel('T(s_k)')
figure; imshow(I)



