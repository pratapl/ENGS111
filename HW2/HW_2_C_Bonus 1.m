%Pratap Luitel
%ENGS 111, HW2 Part C -Bonus

%This script implements the unsharp mask enhance effect for colored images.
%The input image is in the rgb space which is then converted to hsv space. 
%The V from the hsv is then processed to obtain an enhanced V. The new HSV
%is then converted back into rgb space to display the images. 

filename='WallPaper-1.tiff';
%filename='Peppers.png';
imIn=imread(filename);
imIn=im2double(imIn);%convert input image to type double
hsvImage=rgb2hsv(imIn); %convert to hsv
h=hsvImage(:,:,1);
s=hsvImage(:,:,2);
v=hsvImage(:,:,3);%V in HSV is the input image

  figure
    [nRow,nCol]=size(imIn);

    
    subplot(121)
    newV=enhance(v,[1,2,5,5]);
    newHSV=cat(3,h,s,newV);
    imOut=hsv2rgb(newHSV);
    imOut(1:nRow/2,1:nCol)=imIn(1:nRow/2,1:nCol);
    imshow(imOut);
    title('k1=1, k2=5, ro=5, n=5')
    
    
    subplot(122)
    newV=enhance(v,[1,2,5,5]);
    newHSV=cat(3,h,s,newV);
    imOut=hsv2rgb(newHSV);
    imOut(1:nRow/2,1:nCol)=imIn(1:nRow/2,1:nCol);
    imshow(imOut);
    title('k1=1, k2=10, ro=5, n=5')
    
    fprintf('I first converted the rgb space image into HSV.\n');
    fprintf('Then, the V in HSV is used as the input image for\n');
    fprintf('implementing the unsharp mask. \n');
    fprintf('\n');
    fprintf('The new HSV image is then converted back into rgb space.\n');



