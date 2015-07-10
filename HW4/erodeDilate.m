%Pratap Luitel
%ENGS 111
%HW 4, Problem 1

%This script erodes or dilates the input image.
%It is assumed that the input image is of type double. 
%Erode - flag 0, dilate - flag 1; 
function imOut = erodeDilate(imIn,SE,flag)

[nRow,nCol]=size(imIn);

%find the center of the matrix
padLengthX = floor((size(SE,1)/2));
padLengthY = floor((size(SE,2)/2));

%padding
if (flag == 0)
    %pad with maximum value of the data type for erosion
    tempIm = padarray(imIn,[padLengthX padLengthY],1);
else
    %pad with minimum value of the data type for dilation
    tempIm = padarray(imIn,[padLengthX padLengthY],0); 
end

imOut = zeros(size(imIn));
for i = 1:nRow
    for j= 1:nCol
        %imout of the same size as SE
        matrixToCheck = tempIm(i:i+(2*padLengthX),j:j+(2*padLengthY));
        index = find(SE == 1);
        if flag == 0
            imOut(i,j) = min(min(matrixToCheck(index)));  %#ok<*FNDSB>
        else
            imOut(i,j) = max(max(matrixToCheck(index)));
        end
        
    end
end


end
