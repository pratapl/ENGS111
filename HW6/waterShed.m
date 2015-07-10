%Pratap Luitel
%ENGS 111
%HW 6, Watershed transform

function imOut = waterShed(imIn,sigma,hsize)
%import image
%imIn=double(dicomread('MRCoronal1.dcm'));
imIn=imIn/max(imIn(:));             % Double type with values in {0 ... 1}
subplot(2,2,1)
imshow(imIn);

%LPF - gaussian
h = fspecial('gaussian', hsize, sigma);
lpfImage = imfilter(imIn,h,'symmetric');
subplot(2,2,2);imshow(lpfImage);

%apply watershed transform
wsImage = watershed(lpfImage);
subplot(223)
imshow(wsImage,[])

tempImIn = imIn;
%merge regions
nWS=max(wsImage(:));  % The number of watersheds
meanRegion = zeros(nWS,1);
minRegion = zeros(nWS,1);
maxRegion = zeros(nWS,1);
%compute region means
for i =1:nWS
    index = find(wsImage==i);   % Find all the pixels within the current wathershed
    grayVals = tempImIn(index);
    meanRegion(i,1) = mean(grayVals(:));
    minRegion(i,1) = min(grayVals(:));
    maxRegion(i,1) = max(grayVals(:));
end
%check if regions are mergeable

for i=1:nWS
    distanceMean = abs(meanRegion(i,1) - meanRegion); %find the distance between region means
    indexToMerge = find(distanceMean > 0 & distanceMean < 0.2);
    
    %update the shed region
    for j = 1:length(indexToMerge)
        tempIndex = find(wsImage == indexToMerge(j)); %elements to merge 
        wsImage(tempIndex) = i;
        meanRegion(indexToMerge(j),1) = 0; %update the mean for the changed region
    end

    %recalculate means
    indexForMean = find(wsImage == i);
    grayVals = imIn(indexForMean);
    meanRegion(i,1) = mean(grayVals(:));
    subplot(224);imshow(label2rgb(wsImage));drawnow;
end

imOut = wsImage;
end



