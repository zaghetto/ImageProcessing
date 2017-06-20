%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autor: Alexandre Zaghetto                 %
% Data: 23/05/2017                          %
% Local: McGill University                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Power One way to establish a set of       %
% standard cutoff frequency loci is to      %
% compute circles that enclose              %
% specified amounts of total image power    %
%                                           %
% Gonzalez 3rd Ed. pg. 270                  %       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
close all;
clc;

f =(imread('Fig0442(a)(characters_test_pattern).tif'));

[h,w] = size(f);

%%%%%%%%%%%%%%%%
% Lowpass      %
%%%%%%%%%%%%%%%%

% Paddign and transform
fpadding = uint8(zeros(2*h,2*w));
fpadding(h/2+1:h/2+w,w/2+1:w/2+w) =  f;
Fpadding = fftshift(fft2(fpadding));

% Ideal filter
%+++++++++++++

% Cutoff frequency
D0 = 200
H = zeros(2*h,2*w);
for i = 1:2*h  
    for j = 1:2*w
        D = sqrt((i-h)^2 + (j-w)^2);
        if D<= D0
            H(i,j) = 1;
        end
    end
end

% Filterd spectrum
G = Fpadding.*H;
figure
imshow(abs(G).^0.1,[])

% Percentage of preserved power
alfa = 100*sum(sum(abs(G).^2))/sum(sum(abs(Fpadding).^2))


% Butterworth
% +++++++++++
n = 20;
H = zeros(2*h,2*w);
for i = 1:2*h  
    for j = 1:2*w
        D = sqrt((i-h).^2 + (j-w).^2);        
        H(i,j) = 1/ (1+(D/D0)^(2*n));
    end
end
G = Fpadding.*H;
figure
imshow(abs(G).^0.1,[])
alfa = 100*sum(sum(abs(G).^2))/sum(sum(abs(Fpadding).^2))

% Gaussian
% ++++++++
D0 = 70;
H = zeros(2*h,2*w);
for i = 1:2*h  
    for j = 1:2*w
        D = sqrt((i-h).^2 + (j-w).^2);        
        H(i,j) = exp( (-D^2)/(2*(D0.^2)) );
    end
end
G = Fpadding.*H;
figure
imshow(abs(G).^0.1,[])
alfa = 100*sum(sum(abs(G).^2))/sum(sum(abs(Fpadding).^2))

figure;
hold on
plot(H(h,1:2*w))
grid on
title('Gaussian Lowpass Filter')
plot(1:2*w,ones(1,2*w)*0.607,'r-')
stem(w,1,'k')
stem(w,1,'k')


%%%%%%%%%%%%%%%%
% Highpass     %
%%%%%%%%%%%%%%%%

% Ideal
% +++++
D0 = 200;
H = zeros(2*h,2*w);
for i = 1:2*h  
    for j = 1:2*w
        D = sqrt((i-h).^2 + (j-w).^2);
        if D> D0
            H(i,j) = 1;
        end
    end
end
G = Fpadding.*H;
figure
imshow(abs(G).^0.1,[])
alfa = 100*sum(sum(abs(G).^2))/sum(sum(abs(Fpadding).^2))

% Butterworth
% +++++++++++
n = 20;
H = zeros(2*h,2*w);
for i = 1:2*h  
    for j = 1:2*w
        D = sqrt((i-h).^2 + (j-w).^2);        
        H(i,j) = 1/ (1+(D0/D)^(2*n));
    end
end
G = Fpadding.*H;
figure
imshow(abs(G).^0.1,[])
alfa = 100*sum(sum(abs(G).^2))/sum(sum(abs(Fpadding).^2))

% Gaussian
% +++++++++++
D0 = 100
H = zeros(2*h,2*w);
for i = 1:2*h  
    for j = 1:2*w
        D = sqrt((i-h).^2 + (j-w).^2);        
        H(i,j) = 1-exp( (-D^2)/(2*(D0.^2)) );
    end
end
G = Fpadding.*H;
figure
imshow(abs(G).^0.1,[])
alfa = 100*sum(sum(abs(G).^2))/sum(sum(abs(Fpadding).^2))

%%%%%%%%%%%%%%%%
% Band-reject  %
%%%%%%%%%%%%%%%%

% Define o filtro gaussiano
% Bandwidth
W  = 400
% Order of Butterworth filter
n  = 6
% Cutoff frequency
D0 = 200
H = zeros(2*h,2*w);
for i = 1:2*h  
    for j = 1:2*w
         D = sqrt((i-h).^2 + (j-w).^2);        
         H(i,j) = 1-exp(-((D^2 - D0^2)/(D*W))^2 ); % Gaussian
       % H(i,j) = 1/ (1+  (D*W/(D^2-D0^2))^2*n   ); % Butterworth
    end
end
G = Fpadding.*H;
figure
imshow(abs(G).^0.1,[])
alfa = 100*sum(sum(abs(G).^2))/sum(sum(abs(Fpadding).^2))

% Undo shift; perform inverse transform
g = ifft2(ifftshift(G));
g = g(h/2+1:h/2+h,w/2+1:w/2+w);
figure;
imshow(uint8(abs(g)))

figure;
hold on
plot(H(h,1:2*w))
% stem(w-D0,1,'r')
% stem(w+D0,1,'r')
plot(1:2*w,ones(1,2*w)*0.607,'--r')
% stem(w+D0-W/2,1,'k')
% stem(w+D0+W/2,1,'k')
% stem(w-D0-W/2,1,'k')
title('Band-reject filter')
grid on






