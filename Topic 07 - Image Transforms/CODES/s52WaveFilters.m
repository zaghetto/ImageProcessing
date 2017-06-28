%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autor: Alexandre Zaghetto                 %
% Data: 08/06/2017                          %
% Local: McGill University                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Relationship of Filters to Wavelet Shapes %
%                                           %       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
close all
clc

% db2 wavelet
[LO_D,HI_D,LO_R,HI_R] = wfilters('db2')

%%%%%%%%%%%%%%%%%%
% MOTHER WAVELET %
%%%%%%%%%%%%%%%%%%

% Consider the lowpass reconstruction filter L'
Lprime = LO_R;

% If we reverse the order of this vector (see wrev), 
% and then multiply every second sample by –1, 
% we obtain the highpass filter H':

minusOnes = (-1).^(0:length(Lprime)-1);
Hprime = wrev(Lprime).*minusOnes;

% Initialize H2 for interation
H2 = Hprime;

% Number of interation
iter = 3
coef = (sqrt(2)^iter);

if iter ~= 1
    for i = 2:iter
        HU = upsample(H2,2);
        H2 = conv(HU,Lprime);
    end
end

H2 =coef*[0 H2(1:end-2^(iter-1)+1) 0 0] ;

plot(H2,'r')
hold on
%plot(L2)
grid on
legend('Mother wavelet - \psi',' Scale function - phi')
title('Wavelet Daubechies 2')

%%%%%%%%%%%%%%%%%%%%
% SCALING FUNCTION %
%%%%%%%%%%%%%%%%%%%%

% Consider the lowpass reconstruction filter H'
Hprime = HI_R;

% Generate L'

% Multiply every second sample by –1 
% and reverse the order of the resulting vector (see wrev).
Hprime = Hprime.*minusOnes
Lprime = wrev(Hprime)
 
% Initialize L2 for interation
L2 = Lprime;

if iter ~= 1
    for i = 2:iter
        LU = upsample(L2,2);
        L2 = conv(LU,Lprime);
    end
end

L2 =coef*[0 L2(1:end-2^(iter-1)+1) 0 0] ;

plot(H2,'r')
hold on
plot(L2)
grid on
legend('Mother wavelet - \psi',' Scale function - \phi')
title('Wavelet Daubechies 2')

% Uisng wavefun
figure
[PHI,PSI,XVAL] = wavefun('db2',iter)
plot(PSI,'r')
hold on
plot(PHI)
grid on
legend('Mother wavelet - \psi',' Scale function - \phi')
title('Wavelet Daubechies 2 (using wavefun)')


subplot(221); stem(LO_D);
title('Decomposition low-pass filter');
subplot(222); stem(HI_D);
title('Decomposition high-pass filter');
subplot(223); stem(LO_R);
title('Reconstruction low-pass filter');
subplot(224); stem(HI_R);
title('Reconstruction high-pass filter');
xlabel('The four filters for db2')





