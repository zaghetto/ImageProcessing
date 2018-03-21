% Filtro de média
clear all
close all
clc

I = imread('Fig0335(a)(ckt_board_saltpep_prob_pt05).tif');
imshow(I)

If = I;

[h, w] = size(I);

for i = 2:h-1
    for j = 2:w-1
        Bloco = I(i-1:i+1, j-1:j+1);
        V = sort(Bloco(:));
        If(i,j) = V(5);
    end
end

figure; imshow(If);
