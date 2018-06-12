%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autor: Alexandre Zaghetto                 %
% Data: 07/06/2017                          %
% Local: McGill University                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DWT: Approximation and Detail             %
%                                           %       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
close all
clc

% Pre-processing image and generating a 1-D signal
I = imread('lunar.bmp');
I = not(I);

Iant = I;
Imorp = bwmorph(I,'thin');

while( sum(sum(abs(Iant-Imorp)))~=0 )    
    Iant = Imorp;
    Imorp = bwmorph(Iant,'thin');           
    
end    
[y, x] = find(Imorp == 1);

maxy = max(y);
y = maxy-y;
y = y-min(y);
y = y/max(y);

figure
plot(y)

% DWT
[CA,CD] = dwt(y,'db4'); 

% Approximation
figure
plot(CA)

% Details
figure
plot(CD)

% Reconstructs original signal using 
% the Approximation and Details 
yrec = idwt(CA,CD,'db4');

% Plot original and reconstructed signal
figure(1)
hold on
plot(1:10:length(y),yrec(1:10:end),'.r')

% Calculates the error
Erro = sum(abs(yrec-y))






