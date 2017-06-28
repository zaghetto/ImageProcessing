%%%%%%%%%%%%%%
% Wavelts 2D %
%%%%%%%%%%%%%%
clear all
close all
clc

% Load image
load sinsin
x = X+18*randn(size(X));

% Decomposition
[C,L] = wavedec2(x,2,'sym8');

% Calculate thresholds
alpha = 2;
THR = wthrmngr('dw2dcompLVL','scarcehi',C,L,alpha);

% Denising
Xd = wdencmp('lvd',X,'sym8',2,THR,'s');

% Results
image(X); title('Original image');
figure;
image(x); title('Noisy image');
figure;
image(Xd); title('Denoised image');

