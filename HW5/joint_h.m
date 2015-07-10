%Pratap Luitel
%ENGS 111
%Pratap Luitel
%
%This function computes and returns a joint histogram from two images 
%of same size. The input images should be of type double, else an error
%will be thrown. 

function h=joint_h(image_1,image_2)

if ~(isa(image_1,'double') && isa(image_2,'double'))
    error('Input images must be of type double\n');
elseif ((max(image_1(:)) > 1) || (max(image_2(:)) > 1))
    error('Maximum value exceed 1 in image matrix\n');
elseif ((max(image_1(:)) < 0) || (max(image_2(:)) < 0))
    error('Minimum value is less than 0 in image matrix\n');
end
    
    
rows=size(image_1,1);
cols=size(image_1,2);

noOfBins=100; 

h=zeros(noOfBins,noOfBins);

%bins
bins = 0:(1/noOfBins):1;

%the last bin(11th) includes any number equal to one
%so have all the elements less than 1
image_1(image_1 > 0.95) = 0.95;
image_2(image_2 > 0.95) = 0.95;
%find which bin each element in x falls to
[~,binIndexImg1] = histc(image_1,bins); %image1
[~,binIndexImg2] = histc(image_2,bins); %image2


for i=1:noOfBins;    %  col 
  for j=1:noOfBins;   %   rows
    h(binIndexImg1(i,j),binIndexImg2(i,j))=...
        h(binIndexImg1(i,j),binIndexImg2(i,j))+1;
  end
end