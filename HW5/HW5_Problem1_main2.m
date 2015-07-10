%Pratap Luitel
%ENGS 111
%HW 5, Problem 1
%
% This script times the micomp function with image 1 and image 2 for 50
% loops.
%
filename1 = 'mr1.png';
filename2 = 'mr2.png';

image_1 = im2double(imread(filename1)); %convert to double
image_2 = im2double(imread(filename2)); %convert to double

tic
for i = 1:50
    micomp(image_1,image_2);
end
toc