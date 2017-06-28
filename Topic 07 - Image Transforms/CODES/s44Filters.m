%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autor: Alexandre Zaghetto                 %
% Data: 07/06/2017                          %
% Local: McGill University                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DWT: Filters                              %
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

% Filter associated with a specific wavelet
[LO_D,HI_D,LO_R,HI_R] = wfilters('db4');

[CA,CD] = dwt(y,LO_D, HI_D); 

figure
plot(CA)
figure
plot(CD)