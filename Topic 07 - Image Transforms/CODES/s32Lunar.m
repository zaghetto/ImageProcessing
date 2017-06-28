%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autor: Alexandre Zaghetto                 %
% Data: 07/06/2017                          %
% Local: McGill University                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CWT                                       %
%                                           %       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Consider a lunar landscape, whose ragged surface (simulated below) is a result
% of centuries of bombardment by meteorites whose sizes range from gigantic
% boulders to dust specks.

% If we think of this surface in cross-section as a one-dimensional signal, then it
% is reasonable to think of the signal as having components of different scales —
% large features carved by the impacts of large meteorites, and finer features
% abraded by small meteorites.
% Here is a case where thinking in terms of scale makes much more sense than
% thinking in terms of frequency. Inspection of the CWT coefficients plot for this
% signal reveals patterns among scales and shows the signal’s possibly fractal
% nature.

clear all
close all
clc

% Load image and takes its negative
I = imread('lunar.bmp');
I = not(I);
imshow(I);

% Apply morphological thinning 
Iant = I;
Imorp = bwmorph(I,'thin');

% Keeps thinning until de difference between
% two consecutive steps is zero
while( sum(sum(abs(Iant-Imorp)))~=0 )   
    Iant = Imorp;
    Imorp = bwmorph(Iant,'thin');               
end

% Find white pixels locations
[y, x] = find(Imorp == 1);

% Transforms y coodinate
maxy = max(y);
y = maxy-y;
y = y-min(y);
y = y/max(y);

% Plots locations as a function
figure;
plot(x,y)

% Filter the functio using a average filter
y = filter([1 1 1 1],1,y);

% Plots filtered function
figure;
plot(x,y);

% Calculates the DWT
figure;
C = cwt(y,1:512,'db4','plot');

