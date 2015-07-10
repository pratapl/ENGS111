%Pratap Luitel
%ENGS 111
%HW 1, Problem B
%4/9/2015
%
filename = 'AT3_1m4_01.tif';
im = imread(filename);
[X,map] = gray2index(im); %original image has max intensity of 254
[X2,map2] = gray2index(im,64);
[X3,map3] = gray2index(im,16);
[X4,map4] = gray2index(im,4);

%plot
figure
%subplot(221)
imshow(X,map)
title('original image')

figure
%subplot(222)
imshow(X2,map2)
title('n = 64')

figure
%subplot(223)
imshow(X3,map3)
title('n = 16')

figure
%subplot(224)
imshow(X4,map4)
title('n = 4')