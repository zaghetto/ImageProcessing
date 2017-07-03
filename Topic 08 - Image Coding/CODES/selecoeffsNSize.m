function blocoRec = seleccoeffs(blocoOrig)

% The N retained coefficients were selected on the basis of maximum
% magnitude.


% DCT 
N = size(blocoOrig);
blocoDCT = dct2(blocoOrig);
blocoVect = blocoDCT(:);

% Coefficient selection
percent = round(0.75*N(1)*N(2));
absbloco = abs(blocoVect);
[blocoVectSort,isort] = sort(absbloco);
blocoVect(isort(1:percent)) = 0;

% Vector do matrix and inverse DCT
blocoRec = vec2mat(blocoVect,N(2))';
blocoRec = round(idct2(blocoRec));

return



