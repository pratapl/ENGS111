%Pratap Luitel
%ENGS 111
%part 3
%gradient thresholding

filename = 'son1-1.gif';

%read the gif image
%
%Note: the image had to be read as an intensity and color map because not doing
%so brought about noticable changes in the input image
[im,map] = imread(filename,'frames','all');

img1 = thresh_grad1(im,map);
img2 = thresh_grad2(im,map);

figure
subplot(121)
imshow(img1)
title('gradient threshold: spatial filtering')

subplot(122)
imshow(img2)
title('gradient threshhold: frequency filtering')

fprintf('For thresh_grad1, I first converted the image to grayscale,\n');
fprintf('and then to double. An average filter of kernel size 11(arbitarily) \n');
fprintf('was then applied to the resulting image. To reduce the gradient\n');
fprintf('illumination, the original image was subtracted from the \n');
fprintf('transformed image. The resulting image was thresholded \n');
fprintf('with a threshold value of 0. A complement of the outcome is\n');
fprintf('then my final image.\n');

fprintf('\n');
fprintf('For thresh_grad2, I again converted the input image to grayscale,\n');
fprintf('and then to double. An unsharp mask is applied to the double image,\n');
fprintf('and then the resulting output is converted to bw with appropriate \n'); 
fprintf('threshold of greater than 0 \n');


