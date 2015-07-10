%Pratap Luitel
%ENGS 111
%HW 2, Problem 2

%This script implements, calculates and plots min, max and difference 
%order filter using the builtin matlab command ordfilt2. 

filename='liftingbody.png';
imIn=imread(filename);
imIn=im2double(imIn);
kernel=[3,5,11,13];

for i =1:length(kernel)
   
    %min filter
    imOutMin=ordfilt2(imIn,1,ones(kernel(i)),'symmetric');
    %clip away values less than 0 to 0 and greater than 1 to 1. 
    imOutMin=clip(imOutMin);%clip is a function i wrote, 
    %max filter
    imOutMax=ordfilt2(imIn,kernel(i).^2,ones(kernel(i)),'symmetric');
    imOutMax=clip(imOutMax);
    %diff filter
    imOutDiff=imOutMax-imOutMin;
    imOutDiff=clip(imOutDiff);
    %clipping values outside the range[0-1]
    

    %plotting
    figure(i)
    kStr = num2str(kernel(i)); %kernel string
    subplot(221);imshow(imIn);title(['Original Image, Kernel: ' kStr 'x' kStr])
    subplot(222);imshow(imOutMin);title(['Min Filter, Kernel: ' kStr 'x' kStr])
    subplot(223);imshow(imOutMax);title(['Max Filter, Kernel: ' kStr 'x' kStr])
    subplot(224);imshow(imOutDiff);title(['Diff Filter, Kernel: ' kStr 'x' kStr])
    
    
    
end

%discussion
 
    fprintf('Each pixel is being replace by the minimum,maximum or\n');
    fprintf('the difference. When the kernel size is higher, \n');
    fprintf('we see bigger patches of brighter or darker pixels in the output.\n');
    fprintf('\n');
    fprintf('The min filter replaces each pixel by a darker pixel values. \n');
    fprintf('the max filter replaces each pixel by a brighter pixel values.\n');
    fprintf('The difference filter replaces each pixel by a difference\n');
    fprintf('between max value and min value. Thus the output\n ');
    fprintf('seems similar to that of a laplacian filter.\n')
    fprintf('\n');
    
    fprintf('---------Boundaries---------------------\n');
    fprintf('The boundaries contain a lot of zero pixels because ordfilt2\n');
    fprintf('uses the default option of padding boundaries to 0.\n');
    fprintf('This can be changed by adding the symmetric padding option as a\n');
    fprintf('fourth parameter when calling the ordfilt2 command,\n');
    fprintf('which is what I have done in the script.\n');
    

