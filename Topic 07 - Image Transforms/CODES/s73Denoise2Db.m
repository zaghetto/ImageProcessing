%%%%%%%%%%%%%%
% Wavelts 2D %
%%%%%%%%%%%%%%
clear all
close all
clc

% Load image
load(fullfile(matlabroot,'examples','wavelet', 'jump.mat'));

% Wavelet decomposition
wname = 'bior3.5';
level = 5;
[C,S] = wavedec2(jump,level,wname);

% Threshold calculation
thr = wthrmngr('dw2ddenoLVL','penalhi',C,S,3);
sorh = 's';

% Denoising
[XDEN,cfsDEN,dimCFS] = wdencmp('lvd',C,S,wname,level,thr,sorh);

% Results
figure;
subplot(1,2,1);
imagesc(jump); colormap gray; axis off;
title('Noisy Image');
subplot(1,2,2);
imagesc(XDEN); colormap gray; axis off;
title('Denoised Image');


