%Pratap Luitel
%ENGS 111
%HW 7

%This script does computations associated with a,b,c and d in HW 7 part a. 


%% image manipulation
filename = 'CT.tif';
im = imread(filename);
[freq,index] = imhist(im);%frequency vs intensity of the histogram
[maxFreq,maxIndex] = max(freq(:));%highest frequency and intensity
[minFreq,minIndex] = min(freq(:));%lowest frequency and intensity
nGrayscale = freq > 0; %# of grayscale values
nGrayscale = sum(nGrayscale(:));

fileinfo = dir(filename);
fileSize = fileinfo.bytes;
imageSize = size(im,1)*size(im,2);


%% RLE
xx = reshape(im,1,size(im,1)*size(im,2)); %reshape image into a row
[RLE_Values,RLE_Freq] = RLE(xx);
RLE_Size = prod(size(RLE_Freq))*2; % times 2 for frequency 


%% compressed: DCT+Quantization+Entropy+RLE 
[o,q,r] = compressionHelp(im,1); %quality = 1


%% printing
fprintf('a)\n');
fprintf('\n');
fprintf('Image size(pixel) = %d x %d\n',size(im,1),size(im,2));
fprintf('Expected file size = %d bytes \n',imageSize);
fprintf('Actual file size = %d bytes \n', fileSize);
fprintf('\n');
fprintf('Actual file size is bigger than expected file size\n');
fprintf('This is because the actual file stores extra information like\n');
fprintf('Camera Specification, Quantization table, etc \n');
fprintf('\n');
fprintf('b)\n');
fprintf('\n');
fprintf('# of values represnted: %d\n',nGrayscale);
fprintf('Highest frequency for: %d\n',maxIndex-1);
fprintf('Highest vales in the range of 130-180\n');
fprintf('\n');
fprintf('c)\n');
fprintf('\n');
fprintf('# of bytes originally: %d\n',imageSize);
fprintf('# of bytes after RLE compression: %d\n',RLE_Size);
fprintf('# of bytes saved by RLE: %d\n',imageSize - RLE_Size);
fprintf('\n');
fprintf('d)\n');
fprintf('# of bytes originally: %d\n',o);
fprintf('# of bytes after DCT,entropy coding and RLE compression: %d\n',r);
fprintf('# of bytes saved by total compression: %d\n',o - r);

fprintf('\n');


%%



