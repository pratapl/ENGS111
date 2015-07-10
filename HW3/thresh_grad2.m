
%Pratap Luitel
%ENGS 111
%HW 3, Problem 3

%This function takes in an indexed image(intensity and color map)
%and returns a binary version of the image. The function uses frequency 
%domain filtering technique - unsharp mask to extract foreground
%information(text) from the background.


function imOut = thresh_grad2(I,map)


imGray = ind2gray(I,map); %convert to grayscale image
imGrayD = im2double(imGray); %convert to type double 

%frequency domain filtering
%apply sharpen mask = original image - high frequency components
sharpIm = imsharpen(imGrayD,'Radius',5,'Amount',10);
%convert the sharpened image with appropriate threshold

%index = find(sharpIm > 0.10);
% sharpIm(sharpIm > 0.10) = 1;
% imOut = sharpIm;
imOut = im2bw(sharpIm,0); %convert bw of sharpen mask

end


