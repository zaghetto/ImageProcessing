%%%%%%%%%%%%%%
% Wavelts 2D %
%%%%%%%%%%%%%%
clear all
close all
clc

load wbarb;
X = ind2rgb(X,map);
X = uint8(255*rgb2gray(X));
[h, w] = size(X);
X = X++uint8(10*rand(h,w));
[cA1,cH1,cV1,cD1] = dwt2(X,'bior3.7');

A1 = upcoef2('a',cA1,'bior3.7',1);
H1 = upcoef2('h',cH1,'bior3.7',1);
V1 = upcoef2('v',cV1,'bior3.7',1);
D1 = upcoef2('d',cD1,'bior3.7',1);

subplot(2,2,1); imshow(uint8(A1),[]);
title('Approximation A1')
subplot(2,2,2); imshow(uint8(H1),[]);
title('Horizontal Detail H1')
subplot(2,2,3); imshow(uint8(V1),[]);
title('Vertical Detail V1')
subplot(2,2,4); imshow(uint8(D1),[]);
title('Diagonal Detail D1')

Xsyn = idwt2(cA1,cH1,cV1,cD1,'bior3.7');

% Perform DWT
[cA1,cH1,cV1,cD1] = dwt2(X,'bior3.7');
A1 = upcoef2('a',cA1,'bior3.7',1);
H1 = upcoef2('h',cH1,'bior3.7',1);
V1 = upcoef2('v',cV1,'bior3.7',1);
D1 = upcoef2('d',cD1,'bior3.7',1);

% Show approximation and details
subplot(2,2,1); imshow(uint8(A1),[]);
title('Approximation A1')
subplot(2,2,2); imshow(uint8(H1),[]);
title('Horizontal Detail H1')
subplot(2,2,3); imshow(uint8(V1),[]);
title('Vertical Detail V1')
subplot(2,2,4); imshow(uint8(D1),[]);
title('Diagonal Detail D1')

% Threshold the details
per = 0.5;
thr = per*max(abs(cD1(:)));
[i, j] = find(abs(cD1)<thr);
cD1(i,j) = 0;

thr = per*max(abs(cH1(:)));
[i, j] = find(abs(cH1)<thr);
cH1(i,j) = 0;

thr = per*max(abs(cV1(:)));
[i, j] = find(abs(cV1)<thr);
cV1(i,j) = 0;

% Reconstruct image
Xsyn = idwt2(cA1,cH1,cV1,cD1,'bior3.7');

% Show results
figure
colormap(pink(255)), sm = size(map,1);
subplot(121), image(wcodemat(double(X),sm)), title('Noisy Image')
subplot(122), image(wcodemat(Xsyn,sm)), title('denoised Image')



