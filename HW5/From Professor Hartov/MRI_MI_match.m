function MRI_MI_match
% This function is showing in detail image registration by mutual
% information.
% Alex Hartov, ENGG 199

%% Load and display the 1st pair of images 
load stack4;
load stack5;
imIn1=uint8(squeeze(stack4(:,:,54))/max(max(stack4(:,:,54)))*256);
imIn2=uint8(squeeze(stack5(:,:,56))/max(max(stack5(:,:,56)))*256);
clear stack4;
clear stack5;

subplot(2,2,1);     % Preop T1 image
imshow(imIn1);
title('Preop T1');
subplot(2,2,2);     % Postop T1 image +/- same position
imshow(imIn2);
title('Postop T1');
subplot(2,2,3);     % Construct overlap image to show initial alignment.
imOut=uint8(zeros(256,256,3));
imOut(:,:,1)=imIn1;                 % Notice nice trick: R plane = image 1
imOut(:,:,2)=imIn2;                 % G plane = image 2
imOut(:,:,3)=bitxor(imIn1,imIn2);   % B plane = XOR( im1 im2).  This is another way
                                    % to view overlapping grayscale images.
imshow(imOut);
title('Initial overlap');
drawnow;

%% Perform Mutual Information Alignment on two relatively similar images
% The computations that follow shift and rotate imIn2 in relation to imIn1,
% then compute the mutual information over the overalapping region and save
% that value to an array.  After that, the combination with the highest MI
% is considered the best registration.
% This code may take some time to complete, but it's worth observing how it
% goes about optimizing the registration of the two images by seeking the
% maximum mutual information.
index=1;
h1=[];
valMax=0;
for r=-10:1:5
    for c=-5:1:5
        for a=-5:1:5
            imRef=imIn1;
            % Rotate the image first.  Here we use the nearest neighbor
            % interpolation for speed, and the crop option to produce an
            % output image of the same size as the original.  This is also
            % for speed and simplicity.  Note that pixels that are not part
            % of the rotated image are set to zero automatically.  We
            % assume that all zero pixels are "out of bounds".  This is an
            % approximation that makes computations easier.
            imTest=imrotate(imIn2,a,'nearest','crop');
            % Instead of using a transformation matrix for shifing the
            % image, which would have no effect (see notes) I use the
            % circshift function.
            imTest=circshift(imTest,[r c]);
%             subplot(2,2,4);
            imOut(:,:,1)=imRef;
            imOut(:,:,2)=imTest;
            imOut(:,:,3)=bitxor(imRef,imTest);
%             imshow(imOut);
            % Next I threshold the image to a BW (binary) image, in order
            % to find what is the extent of the region of interest.  The
            % idea is to perform the MI computations on as small an image
            % as possible, presumably covering only the region of overlap.
            % Keep in mind that the range of values is 0 to 255, we
            % threshold at 40 (aribtrary).
            bw1=im2bw(imRef,40/255);    % Threshold Reference image
            bw2=im2bw(imTest,40/255);   % Threshold Test image
            bw=bitor(bw1,bw2);
            [rr cc]=find(bw==1);        % Find the indices for non-0 pixels
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

%             rectangle('Position',[cmin,rmin,cmax-cmin,rmax-rmin],...
%                 'EdgeColor','r')
%             drawnow;
            
            [val h]=MI2(imRef,imTest);
            if isempty(h1)
                h1=h;
            end
            MI(index,:)=[r c a val];
%             title(['MI=' num2str(val)]);
%             drawnow;
            
            if val>valMax
                valMax=val;
                subplot(2,2,4);
                imshow(imOut);
                title(['Best MI=' num2str(val) ', r=' num2str(r) ', c=' num2str(c) ', a=' num2str(a)]);
                
%                 subplot(2,2,2);
                %contour(log10(h(1:2:end,1:2:end)+1),10);
%                 idx=find(h>0.00001);
%                 hh=h;
%                 hh(idx)=1.0;
%                 imshow(hh,[]);
%                 title('Joint PDF Im1 & Im2');
                h2=h;
                drawnow;
            end
        end
    end
end



subplot(2,2,1);
idx=find(h1>0.00001);
hh=h1;
hh(idx)=1.0;
imshow(hh,[]);
title('Initial Joint PDF Im1 & Im2');
subplot(2,2,2);
idx=find(h2>0.00001);
hh=h2;
hh(idx)=1.0;
imshow(hh,[]);
title('Best Joint PDF Im1 & Im2');
drawnow;


%% Load and display the 2nd pair of images 
load stack1;
load stack2;
imIn1=uint8(squeeze(stack1(:,:,17))/max(max(stack1(:,:,17)))*256);
imIn2=uint8(squeeze(stack2(:,:,86))/max(max(stack2(:,:,86)))*256);
clear stack1;
clear stack2;

subplot(2,2,1);     % Preop T1 image
imshow(imIn1);
title('Preop T1');
subplot(2,2,2);     % Postop T1 image +/- same position
imshow(imIn2);
title('Postop T1');
subplot(2,2,3);     % Construct overlap image to show initial alignment.
imOut=uint8(zeros(256,256,3));
imOut(:,:,1)=imIn1;
imOut(:,:,2)=imIn2;
imOut(:,:,3)=bitxor(imIn1,imIn2);
imshow(imOut);
title('Initial overlap');
drawnow;


%% Perform Mutual Information Alignment on two very different images
% Using the same algorithm as before, we see how well it behaves when
% presented with two very different images.
index=1;
h1=[];
valMax=0;
for r=-3:1:3
    for c=-3:1:3
        for a=-4:1:4
            imRef=imIn1;
            % Rotate the image first.  Here we use the nearest neighbor
            % interpolation for speed, and the crop opton to produce an
            % output image of the same size as the original.  This is also
            % for speed and simplicity.  Note that pixels that are not part
            % of the rotated image are set to zero automatically.  We
            % assume that all zero pixels are "out of bounds".  This is an
            % approximation that makes computations easier.
            imTest=imrotate(imIn2,a,'nearest','crop');
            % Instead of using a transformation matrix for shifing the
            % image, which would have no effect (see notes) I use the
            % circshift function.
            imTest=circshift(imTest,[r c]);
%             subplot(2,2,2);
%             imshow(imTest);
            subplot(2,2,4);
            imOut(:,:,1)=imRef;
            imOut(:,:,2)=imTest;
            imOut(:,:,3)=bitxor(imRef,imTest);
            imshow(imOut);
            % Next I threshold the image to a BW (binary) image, in order
            % to find what is the extent of the region of interest.  The
            % idea is to perform the MI computations on as small an image
            % as possible, presumably covering only the region of overlap.
            % Keep in mind that the range of values is 0 to 255, we
            % threshold at 40 (aribtrary).
            bw1=im2bw(imRef,40/255);    % Threshold Reference image
            bw2=im2bw(imTest,40/255);   % Threshold Test image
            bw=bitor(bw1,bw2);
            [rr cc]=find(bw==1);        % Find the indices for non-0 pixels
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

            rectangle('Position',[cmin,rmin,cmax-cmin,rmax-rmin],...
                'EdgeColor','r')
            drawnow;
            
            [val h]=MI2(imRef,imTest);
            if isempty(h1)
                h1=h;
            end
            MI(index,:)=[r c a val];
            title(['MI=' num2str(val) ', r=' num2str(r) ', c=' num2str(c) ', a=' num2str(a)]);
            drawnow;
            
            if val>valMax
                valMax=val;
                subplot(2,2,1);
                imshow(imOut);
                title(['Best MI=' num2str(val) ', r=' num2str(r) ', c=' num2str(c) ', a=' num2str(a)]);
                
                subplot(2,2,2);
                idx=find(h>0.00001);
                hh=h;
                hh(idx)=1;
                imshow(hh,[]);
                title('Joint PDF Im1 & Im2');
                h2=h;
                drawnow;
            end
        end
    end
end

subplot(2,2,1);
idx=find(h1>0.00001);
hh=h1;
hh(idx)=1.0;
imshow(hh,[]);
title('Initial Joint PDF Im1 & Im2');
subplot(2,2,2);
idx=find(h2>0.00001);
hh=h2;
hh(idx)=1.0;
imshow(hh,[]);
title('Best Joint PDF Im1 & Im2');
drawnow;

