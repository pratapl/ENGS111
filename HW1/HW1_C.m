%Pratap Luitel
%ENGS 111
%HW 1, Problem C
%4/9/2015
%
filename = 'peppers.png';
im = imread(filename); %unint8 by default

%im = im2double(im); %convert to double


%original channel intensities
r = im(:,:,1);
g = im(:,:,2);
b = im(:,:,3);


%histogram equalized for individual channel
r_heq = histeq(r);
g_heq = histeq(g);
b_heq = histeq(b);

%histogram equalized image
im_heq = cat(3,r_heq,g_heq,b_heq);

%displaying
figure
subplot(221)
imshow(im)
title('Original Image')

subplot(222)
imshow(im_heq)
title('Histogram equalized - individual channel')

%------------------------------------------------------------------------
%New approach for histogram equalization by scaling the individual channels
%by the ratio of original intensity image to histogram equalized intensity image

%I have tried two approaches - with and without converting the unint8 to
%double values. 

intensity_im = rgb2gray(im);
%histogram equalized intensity image
intensity_im_heq = histeq(intensity_im);

%scaling ratio
scaleRatio = intensity_im_heq./intensity_im;
%new image 
im_new = cat(3,r.*scaleRatio,g.*scaleRatio,b.*scaleRatio);

%plot
subplot(223)
imshow(im_new)
title('Histogram Equalized - new approach(uint8)')

%-------------------------------------------------------------------------
%Implementation by converting image from uint8 to double
im = im2double(im);
intensity_im = rgb2gray(im);
%histogram equalized intensity image
intensity_im_heq = histeq(intensity_im);

%scaling ratio
scaleRatio = intensity_im_heq./intensity_im;
%new image 
im_new2 = cat(3,im2double(r).*scaleRatio,...
                im2double(g).*scaleRatio,...
                im2double(b).*scaleRatio);

%plot
subplot(224)
imshow(im_new2)
title('Histogram Equalized - new approach(double)')


