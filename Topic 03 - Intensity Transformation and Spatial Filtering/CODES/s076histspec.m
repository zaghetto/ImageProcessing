% Histogram Matching (Specification):
clc
clear all
close all

% Compute the histogram of the given image, 
% and use it to find the histogram equalization transformation
I = imread('s076Fig0323(a)(mars_moon_phobos).tif');
[h, w] = size(I);
n = length(I(:));
[nk rk] = hist(I(:), [0:255]);
pk = nk/n

for i = 1:length(pk)
    sk1(i) = round(255*sum(pk(1:i)));
end

plot(rk, sk1)
xlabel('r_k')
ylabel('s_k = T(r_k)')
title('Transformation Function (CDF)');
axis([0 255 0 255])
grid on

% The histogram of image I2 will be used to specify the transformation
% function. Compute all values of the transformation function G
% using the specified histogram.
I2 = imread('s076ref.tif');
[h2, w2] = size(I2);
n2 = length(I2(:));
[nk2 zk2] = hist(I2(:), [0:255]);
pz = nk2/n2

for i = 1:length(pz)
    sk2(i) = round(255*sum(pz(1:i)));
end
figure
plot(zk2, sk2)
xlabel('z_k')
ylabel('v_k = G(z_k)')
title('Specified Histogram (CDF)')
axis([0 255 0 255])
grid on

% Use the stored values of G to find the corresponding value of zk so that G(zk) 
% is closest to sk and store these mappings from s to z.
cont = 1;
for i = 1:length(sk1)
    dists = abs(sk1(i)-sk2);
    j = find(dists==min(dists));
    tabela(i,1) = sk1(i);
    tabela(i,2) = zk2(j(1));
end

% Form the histogram-specified image by first histogram-equalizing the
% input image and then mapping every equalized pixel value, sk, of this
% image to the corresponding value, zk, in the histogram-specified image
% using the mappings
for i = 1:h
    for j = 1:w        
        k = find(tabela(:,1) == sk1(I(i,j)+1));
        Ih(i,j) = tabela(k(1),2);
    end
end

[h3, w3] = size(Ih);
n3 = length(Ih(:));
[nk3 zk3] = hist(Ih(:), [0:255]);
pz3 = nk3/n3

for i = 1:length(pz)
    sk3(i) = round(255*sum(pz3(1:i)));
end
figure
stem(zk3, sk3)
title('Resulting CDF')
xlabel('z_k')
ylabel('v_k = G(z_k)')
axis([0 255 0 255])
grid on

% Show images
figure
imshow(I)
figure
imshow(uint8(Ih))
















 
% rk = 0:1/7:1;
% nk = [1120 3214 4850 3425 1995  784 541 455];
% pk = nk/sum(nk)
% 
%  clear all
% rk = 0:1/7:1;
% nk = [1120 0 3214 0 4850  3425 1995 1780];
% pk = nk/sum(nk)
% 
% 
% 
% for i = 1:length(pk)
%     cpk(i) = sum(pk(1:i));
% end
% 
