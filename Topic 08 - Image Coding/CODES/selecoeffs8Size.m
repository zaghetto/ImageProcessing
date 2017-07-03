function blocoRec = seleccoeffs(blocoOrig)

% 8x8 dct, coefficiente elimination, and inverse dct.

% The 32 retained coefficients were selected on the basis of maximum
% magnitude. Note that the 32 discarded coefficients had little
% visual impact on the quality of the reconstructed image. Their elimination,
% however, was accompanied by some mean-square error.

% Zig-zag matrix
x = [0   1   5   6  14  15  27  28
2   4   7  13  16  26  29  42
3   8  12  17  25  30  41  43
9  11  18  24  31  40  44  53
10  19  23  32  39  45  52  54
20  22  33  38  46  51  55  60
21  34  37  47  50  56  59  61
35  36  48  49  57  58  62  63]+1;

% DCT and Zig-zag scann
blocoVect = zeros(1,64);
Y = dct2(double(blocoOrig));
cont = 1;
for i =1:8
    for j =1:8
        blocoVect(x(cont)) = Y(i, j);
        cont = cont+1;
    end
end

% Coefficient selection
absbloco = abs(blocoVect);
[blocoVectSort,isort] = sort(absbloco);
blocoVect(isort(1:32)) = 0;

% Zig-zag scann and  inverse DCT
blocoRec = zeros(8,8);
cont = 1;
for i =1:8
    for j =1:8
        blocoRec(i,j) =blocoVect(x(cont));
        cont = cont+1;
    end
end

blocoRec = round(idct2(blocoRec));

return



