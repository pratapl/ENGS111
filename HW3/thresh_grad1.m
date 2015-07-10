%Pratap Luitel
%ENGS 111
%HW 3, Problem 3

%This function takes in an indexed image(intensity and color map)
%and returns a binary version of the image. The function performs 
%filtering algorithms like average filter or median filter based on 
%the spatial domain of image. 

function imOut = thresh_grad1(imIn,map)

kernelWidth = 11;
    
imGray = ind2gray(imIn,map); %convert image to grayscale
imGrayD = im2double(imGray); %convert data type to double

%apply the average filter in spatial domain
averageFilter = fspecial('average',kernelWidth);
filteredImg1 = imfilter(imGrayD, averageFilter, 'replicate');

%apply the median filter
filteredImg2 = medfilt2(imGrayD, [kernelWidth kernelWidth]);

%correct the lighting gradient
%Note: subtracting by an offset(0.04) produced a much better result
tempImg = filteredImg2 - imGrayD - 0.04; 
bw = im2bw(tempImg,0);
imOut = imcomplement(bw);

end
