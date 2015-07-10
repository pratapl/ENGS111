
%Pratap Luitel
%ENGS 111
%Pratap Luitel
%HW5, Problem 1
%
%This function thresholds the given test and reference images
%based on the max and min values in them

function [imTest,imRef] = thresholdImage(imTest,imRef)

            bw1=im2bw(imRef,40/255);    % Threshold Reference image
            bw2=im2bw(imTest,40/255);   % Threshold Test image
            bw=bitor(bw1,bw2);
            [rr, cc]=find(bw==1);        % Find the indices for non-0 pixels
            rmin=min(rr);
            rmax=max(rr);
            cmin=min(cc);
            cmax=max(cc);
            imTest(rmax:end,:)=[];      % Remove from the bottom
            imTest(1:rmin,:)=[];        % Remove from the top
            imTest(:,cmax:end)=[];      % Remove from the right
            imTest(:,1:cmin)=[];        % Remove from the left
            % Repeat same cropping on the reference image
            imRef(rmax:end,:)=[];       % Remove from the bottom
            imRef(1:rmin,:)=[];         % Remove from the top
            imRef(:,cmax:end)=[];       % Remove from the right
            imRef(:,1:cmin)=[];         % Remove from the left

end
