%Pratap Luitel
%ENGS 111
%HW 1

filename = 'AT3_1m4_01.tif';
%image information
info = imfinfo(filename)

%load the image
img = imread(filename);
whos img

%convert image data type to double
img2 = im2double(img);

%display images
figure

%subplot 1
subplot(2,2,1)
imshow(img)
title('Original Image, command: imshow')

%subplot2
subplot(2,2,2)
imagesc(img)
title('Original Image, command: imagesc')

%subplot3
subplot(2,2,3)
imshow(img2)
title('Altered Image, type double')

%subplot4
subplot(2,2,4)
imshow(img2)
title('Altered Corrected Image, type double')

