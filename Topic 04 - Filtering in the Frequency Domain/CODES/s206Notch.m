%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autor: Alexandre Zaghetto                 %
% Data: 23/05/2017                          %
% Local: McGill University                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Notch filters                             %
% Gonzalez 3rd Ed. pg. 294                  %       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
close all
clc

f = imread('Fig0464(a)(car_75DPI_Moire).tif');
[h,w] = size(f);

F = fftshift(fft2(f));

% 1o par notch
n = 4;
HM  = zeros(h,w);
Hm = zeros(h,w);
D0 = 10;
k = 39;
l = 30;
for i = 1:h  
    for j = 1:w        
        DkM  = sqrt((i-h/2-k).^2 + (j-w/2-l).^2);
        Dkm = sqrt((i-h/2+k).^2 + (j-w/2+l).^2);      
        HM(i,j)  = 1/ (1+(D0/DkM)^(2*n));
        Hm(i,j) = 1/ (1+(D0/Dkm)^(2*n));
    end
end

H = HM.*Hm;

% 2o par notch
n = 4;
HM  = zeros(h,w);
Hm = zeros(h,w);
k = -39;
l = 30;
for i = 1:h  
    for j = 1:w        
        DkM  = sqrt((i-h/2-k).^2 + (j-w/2-l).^2);
        Dkm = sqrt((i-h/2+k).^2 + (j-w/2+l).^2);      
        HM(i,j)  = 1/ (1+(D0/DkM)^(2*n));
        Hm(i,j) = 1/ (1+(D0/Dkm)^(2*n));
    end
end
H = H.*HM.*Hm;

% 3o par notch
n = 4;
HM  = zeros(h,w);
Hm = zeros(h,w);
D0 = 5;
k = 78;
l = 30;
for i = 1:h  
    for j = 1:w        
        DkM  = sqrt((i-h/2-k).^2 + (j-w/2-l).^2);
        Dkm = sqrt((i-h/2+k).^2 + (j-w/2+l).^2);      
        HM(i,j)  = 1/ (1+(D0/DkM)^(2*n));
        Hm(i,j) = 1/ (1+(D0/Dkm)^(2*n));
    end
end
H = H.*HM.*Hm;

% 4o par notch
n = 4;
HM  = zeros(h,w);
Hm = zeros(h,w);
D0 = 5;
k = -78;
l = 30;
for i = 1:h  
    for j = 1:w        
        DkM  = sqrt((i-h/2-k).^2 + (j-w/2-l).^2);
        Dkm = sqrt((i-h/2+k).^2 + (j-w/2+l).^2);      
        HM(i,j)  = 1/ (1+(D0/DkM)^(2*n));
        Hm(i,j) = 1/ (1+(D0/Dkm)^(2*n));
    end
end
H = H.*HM.*Hm;


Ff = F.*H;

ff = ifft2(fftshift(Ff));

figure;
imshow(f)
figure
imshow(log(abs(Ff)),[])
figure;
imshow(real(ff),[])



