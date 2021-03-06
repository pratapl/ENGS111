    
%Pratap Luitel
%ENGS 111, HW2 Part C
%This script plots multiple versions of an image, 'WallPaper-1.tif'
%by applying the unsharp mask from the function enhance by varying the
%associated paramerters k1,k2,r0 and n. 


filename='WallPaper-1.tiff';
imIn=imread(filename);
imIn=rgb2gray(imIn); %intensity image
imIn=im2double(imIn);%image type double
k1=1;
k2=[0,1,5];
ro=[1,5,10];
n=[1,5,10];


% index=1;
% for i = 1:3
%     for j=1:3
%         for k=1:3
%             imOut=enhance(imIn,[k1,k2(k),ro(j),n(i)]);
%             
%             %converting numeric vals to string for title
%             k2Str=num2str(k2(k));
%             roStr=num2str(ro(j));
%             nStr=num2str(n(i));
%             figure(i)
%             
%             subplot(3,3,index);
%             %positionVector=[left, bottom, width, height]
%             %subplot('Position',positionVector)
%             imshow(imOut);
%             title(['k1=1 k2=' k2Str ' r0=' roStr ' n=' nStr])
%             index=index+1;
%             if mod(index,9)==1
%                 index=1;
%             end
%             
%         end
%     end
% end
    %plotting half of original and half of output image based on the
    %parameters selected from visual analayis of plotting multiple images
    %in the script above. 
    figure
    [nRow,nCol]=size(imIn);
    subplot(131)
    imOut=enhance(imIn,[1,2,5,5]);
    imOut(1:nRow/2,1:nCol)=imIn(1:nRow/2,1:nCol);
    imshow(imOut);
    title('k1=1, k2=1, ro=5, n=5')
    
    subplot(132)
    imOut=enhance(imIn,[1,4,5,5]);
    imOut(1:nRow/2,1:nCol)=imIn(1:nRow/2,1:nCol);
    imshow(imOut);
    title('k1=1, k2=5, ro=5, n=5')
    
    
    subplot(133)
    imOut=enhance(imIn,[1,10,5,5]);
    imOut(1:nRow/2,1:nCol)=imIn(1:nRow/2,1:nCol);
    imshow(imOut);
    title('k1=1, k2=10, ro=5, n=5')

    fprintf('To implement the unsharp mask, I implemented the \n');
    fprintf('butterworth High Pass Filter. The filter is a function of\n');
    fprintf('the radius from the center of the image, ro and n. \n')
    fprintf('\n');
    
    fprintf('First I explored the output by passing in multiple variables\n');
    fprintf('After visually accessing the output images, I chose some \n');
    fprintf('variables that I thought were producing better results \n');
    fprintf('Using those values, I have plotted 3 images with original \n');
    fprintf('enhanced image stacked together.\n');
    


