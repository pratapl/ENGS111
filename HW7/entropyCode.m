%Pratap Luitel
%ENGS 111
%HW 7

%this function returns an entropy coded version of the 
%input matrix imIn. Entropy Coding is rearranging the 
%matrix element from top left to bottom right, inverse diagonals. 

function imOut = entropyCode(imIn)
%entropy coding
nDiagonals = size(imIn,1)*2 - 1;
maxDiagonal = (nDiagonals  - 1)/2;
imOut = zeros(1,prod(size(imIn)));
counter = 1;

imIn = flip(imIn);
for i = -maxDiagonal:maxDiagonal
    tempV = diag(imIn,i);
    
    if mod(i,2) == 0
        tempV = flip(tempV);
    end
    counterEnd = counter + length(tempV);
    imOut(counter:counterEnd-1) = tempV(:);
    counter = counterEnd;
end

end
