clear all
close all

I = imread('s024kidney.tif');

% Original
subplot(1,3,1);
imshow(I);
title('Original')

% Binary
m = mean(I(:));
for delta = m: m+40
    O = I>delta & I<250;
    subplot(1,3,2);
    imshow(O);
    title('Proc. binary')
    pause(0.1)
end

% Grayscale
G = uint8(double(I).*double(O));
subplot(1,3,3);
imshow(G);
title('Proc. gray')

