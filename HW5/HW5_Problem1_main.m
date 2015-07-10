%Pratap Luitel
%ENGS 111
%HW 5, Problem 1
%
%This script loads im1.png and mr2.png, converts them to type double, 
%calls micomp function and plots the output of the function. 
%
%
filename1 = 'mr1.png';
filename2 = 'mr2.png';

image_1 = im2double(imread(filename1)); %convert to double
image_2 = im2double(imread(filename2)); %convert to double

%===================================================
%shift = 0, rotation = 0
 a = 0;r = 0 ; c = 0;
 imTest = imrotate(image_1,a,'nearest','crop');
 imTest = circshift(imTest,[r c]);

[imTest,imRef] = thresholdImage(imTest,image_1);
[val,jointHist1] = micomp(imTest,imRef);

%overlapping images
subplot(3,2,1)
imshow(imfuse(imRef,imTest));
title(['MI=' num2str(val) ', r=' num2str(r) ', c=' num2str(c) ', a=' num2str(a)]);

subplot(3,2,2)
idx=find(jointHist1>0.00001);
hh=jointHist1;
hh(idx)=1;
imshow(hh,[]);
title('Joint PDF Im1 & Im1');
%==============================================

%===================================================
%shift = 0, rotation = 5
 a = 5;r = 0 ; c = 0;
 imTest = imrotate(image_1,a,'nearest','crop');
 imTest = circshift(imTest,[r c]);

[imTest,imRef] = thresholdImage(imTest,image_1);
[val,jointHist1] = micomp(imTest,imRef);

%overlapping images
subplot(3,2,3)
imshow(imfuse(imRef,imTest));
title(['MI=' num2str(val) ', r=' num2str(r) ', c=' num2str(c) ', a=' num2str(a)]);

subplot(3,2,4)
idx=find(jointHist1>0.00001);
hh=jointHist1;
hh(idx)=1;
imshow(hh,[]);
title('Joint PDF (Im1, rot. Im1)');
%==============================================


%===================================================
%shift = 10,10, rotation = 15
 a = 15;r = 10 ; c = 10;
 imTest = imrotate(image_1,a,'nearest','crop');
 imTest = circshift(imTest,[r c]);

[imTest,imRef] = thresholdImage(imTest,image_1);
[val,jointHist1] = micomp(imTest,imRef);

%overlapping images
subplot(3,2,5)
imshow(imfuse(imRef,imTest));
title(['MI=' num2str(val) ', r=' num2str(r) ', c=' num2str(c) ', a=' num2str(a)]);

subplot(3,2,6)
idx=find(jointHist1>0.00001);
hh=jointHist1;
hh(idx)=1;
imshow(hh,[]);
set(gca,'ydir','reverse')
%set(gca,'YDir','reverse');
axis on
title('Joint PDF (Im1, rot. shifted Im1)');
%==============================================
