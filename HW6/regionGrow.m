%Pratap Luitel
%ENGS 111
%HW 6

function imOut = regionGrow(imIn,seeds)
narginchk(2,2);
if (size(seeds,1) == 1 && size(seeds,2) == 1 )
    seeds = randi(size(imIn,1),[seeds,2]);
end
% Load & show the original image
%imIn=double(dicomread('MRCoronal1.dcm'));
imIn=imIn/max(imIn(:));             % Double type with values in {0 ... 1}


% Region Growing, more sophisticated with multiple seed points
clf
subplot(1,1,1);
imshow(imIn);
drawnow;

% Seed points corresponding to: Outside of the head, brain, CSF, cranium.
%sp=[41 32; 203 101; 123 113; 163 95];       

% sp=[1 1; 65 128; 256 256];    % Somethings else to try.
% mean values at the seed points
%ms=[imIn(sp(1,1),sp(1,2)) imIn(sp(2,1),sp(2,2)) imIn(sp(3,1),sp(3,2)) imIn(sp(4,1),sp(4,2))];
nSeeds = length(seeds);
tempSeeds = nSeeds;

%init variables
regionBoundary = zeros(size(imIn,1),size(imIn,2),nSeeds);   % Thes R images are there to keep track of the regions
segmentedImage = zeros(size(imIn)); 
regionMean = zeros(1,nSeeds);

for i= 1:nSeeds
    regionMean(i) = imIn(seeds(i,1),seeds(i,2)); %initialize the mean values 
    regionBoundary (seeds(i,1),seeds(i,2),i) = 1; %initialize the boundary point
    segmentedImage (seeds(i,1),seeds(i,2)) = i; % initialize segmented regions
end

%dilate 
h=ones(3);      
count=100;
done=0;
while ~done
    growFlag=0;
    for i = 1 : nSeeds
        if (regionMean(i) >= 0)
            %if (regionMean(i) >= 0)
            currentRegion = regionBoundary(:,:,i);
            % Define the pixels to test for seed region 1
            imBorder=imdilate(currentRegion,h);    % find the border of the current region
            segmentedIndex=find(segmentedImage > 0);       % Pixels already segmented
            imBorder(segmentedIndex)=0;          % Remove the segmented pixels from the border
            pixelToAdd=find(imBorder>0);     % Remaining pixels to test

            if ~isempty(pixelToAdd)
                D=abs(imIn(pixelToAdd)-regionMean(i));%matrix of difference between pixel and region mean. 
                minIndex=find(D==min(D(:)));%index/es of minimum element
                pixelToAdd=pixelToAdd(minIndex);%index of minimum elements only
                growFlag=1;
            end


            if growFlag==1
                currentRegion(pixelToAdd) = 1;    % Add closest pixel by mean criterion
                segmentedImage(pixelToAdd) = i;%*(255/(nSeeds));
                segmentedIndex = find(currentRegion > 0); %update the mean
                regionMean(i)=mean(mean(imIn(segmentedIndex)));
                regionBoundary(:,:,i) = currentRegion; %update the segmented region
            end
            % Display current result
            count=count+1;
            if count > 20
                count = 0;
                clf
                %imshow(imIn)
                imshow(label2rgb(segmentedImage));
                drawnow;
            end

            % Test for no growing
            if growFlag==0
                done=1;
            end
        end
    end
    
    mergeOffset = 6;
    %merge groups is greater than 6
    if tempSeeds > mergeOffset
        tempIter = 1;
        while ((tempIter < nSeeds) && tempSeeds > mergeOffset-1)
           %find the closest group
           tempDist = abs(regionMean(tempIter) - regionMean);
           similarRegion = (tempDist > 0 & tempDist < 0.05);
           similarRegionIndex = find(similarRegion == 1);
           
           fprintf('Total regions: %d\n',length(find(regionMean >= 0)));
           %regionMean() = -1*tempIter;
           
           if ~isempty(similarRegionIndex) && tempSeeds > mergeOffset
               indexToMerge = similarRegionIndex(1);
               regionMean(indexToMerge) = -1 * tempIter;
               regionBoundary(:,:,tempIter) = regionBoundary(:,:,tempIter) | regionBoundary(:,:,indexToMerge);
               regionBoundary(:,:,indexToMerge) = 0;
               segmentedImage(find(segmentedImage == indexToMerge)) = tempIter; %#ok<FNDSB>
               tempSeeds = tempSeeds - 1;
           end
           
           %replace the closest group
           
           %check if 
           tempIter = tempIter + 1;
        end
    end
    
    
end

imOut = segmentedImage;
end

