%Pratap Luitel
%ENGS 111
%HW 4


im1 = imread('rice.png');
[i2,m2] = imread('son1-1.gif');

%convert to type double
imIn1 = im2double(im1);
imIn2 = ind2gray(i2,m2);
imIn2 = im2double(imIn2);

imageSequence1 = zeros(size(imIn1,1),size(imIn1,2),1,8);
imageSequence2 = zeros(size(imIn2,1),size(imIn2,2),1,8);

for i = 1:4
    n = [7 11 13 15];

    startX = floor(n(i)/2);
    x = repmat(-startX:startX,[n(i) 1]);
    y = repmat([-startX:startX]',[1 n(i)]);
    r = sqrt(x.^2 + y.^2);

    SE = zeros(n(i),n(i));
    SE(r <= startX) = 1;

    %rice.png
    imageSequence1(:,:,1,i) = erodeDilate(imIn1,SE,0); %erode
    imageSequence1(:,:,1,i+4) = erodeDilate(imIn1,SE,1); %dilate
    
    %son1-1.gif
    imageSequence2(:,:,1,i) = erodeDilate(imIn2,SE,0); %erode
    imageSequence2(:,:,1,i+4) = erodeDilate(imIn2,SE,1); %dilate
    
end
figure(1)
montage(imageSequence1,'size',[2,4]);
figure(2)
montage(imageSequence2,'size',[2 4]);



