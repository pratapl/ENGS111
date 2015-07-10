%Pratap Luitel
%ENGS 111
%HW 4, Problem 2


%The function returns a filtered(top hat/bottom hat) image from 
%the input image. The flag argument determines the choice of filter - 0 
%is bottom hat and 1 is top hat. The function assumes that the input image
%is of type double. 

function imOut = topBottomHat(imIn,SE,flag)

%bottom hat filtering
if (flag == 0) 
    %closing = dilation, and then erosion
    dilatedImage = erodeDilate(imIn,SE,1);%dilate
    closeImage = erodeDilate(dilatedImage,SE,0);%erode
    imOut = imsubtract(closeImage,imIn);%bottomHat

%top hat filtering
else 
    %opening = erosion and then dilation
    erodedImage = erodeDilate(imIn,SE,0);%erode
    openImage = erodeDilate(erodedImage,SE,1);%dilate
    imOut = imsubtract(imIn,openImage);%topHat
end

end


