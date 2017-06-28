%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autor: Alexandre Zaghetto                 %
% Data: 08/06/2017                          %
% Local: McGill University                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1-D denoising                             %
%                                           %       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
close all
clc

load leleccum;
s = leleccum(1:3920);
ls = length(s);
d = linspace(0,3,ls);

wavelet = 'db3';

[C,L] = wavedec(s,3,wavelet);

cA3 = appcoef(C,L,wavelet,3);
cD3 = detcoef(C,L,3);
cD2 = detcoef(C,L,2);
cD1 = detcoef(C,L,1);

A3 = wrcoef('a',C,L,wavelet,3);
D1 = wrcoef('d',C,L,wavelet,1);
D2 = wrcoef('d',C,L,wavelet,2);
D3 = wrcoef('d',C,L,wavelet,3);

subplot(2,2,1); plot(A3); title('Approximation A3')
subplot(2,2,2); plot(D1); title('Detail D1')
subplot(2,2,3); plot(D2); title('Detail D2')
subplot(2,2,4); plot(D3); title('Detail D3')

figure
subplot(3,1,1); plot(D1); title('Detail Level 1'); axis off
subplot(3,1,2); plot(D2); title('Detail Level 2'); axis off
subplot(3,1,3); plot(D3); title('Detail Level 3'); axis off

% Threshold cD1, cD2, and cD3
per = 0.5;
thr1 = per*max(abs(cD1));
thr2 = per*max(abs(cD2));
thr3 = per*max(abs(cD3));

hard = 0;
if hard    
    % Hard threshold
    i = find(abs(cD1)<thr1);
    cD1(i) = 0;    
    i = find(abs(cD2)<thr2);
    cD2(i) = 0;    
    i = find(abs(cD3)<thr3);
    cD3(i) = 0;
else
    % Soft threshold
    i = find(abs(cD1)<thr1)
    cD1 = sign(cD1).*(abs(cD1)-thr1);       
    cD1(i) = 0;

    i = find(abs(cD2)<thr2)
    cD2 = sign(cD2).*(abs(cD2)-thr2);
    cD2(i) = 0;
    
    i = find(abs(cD3)<thr3)
    cD3 = sign(cD3).*(abs(cD3)-thr3);
    cD3(i) = 0;
end

% Show original D1 and thresholded D1th
figure
D1th = wrcoef('d',[cA3 cD3 cD2 cD1],L,wavelet,1);
plot(D1)
hold on
grid on;
plot(D1th)
legend('Original D1', 'Thresholded D1')

% Wavelet reconstruction using thresholded coefficients
clean = waverec([cA3 cD3 cD2 cD1],L,wavelet);

% Results
figure
subplot(3,1,1); plot(s(2000:3920)); title('Original')
subplot(3,1,2); plot(A3(2000:3920)); title('Approximation A3')
subplot(3,1,3); plot(clean(2000:3920)); title('De-noised')

figure
plot(s(2000:3920));
title('Original')
hold on
grid on
figure
plot(clean(2000:3920),'r');
title('De-noised')
grid on

% Error
E = (sum( (s-clean).^2) )/length(s)




