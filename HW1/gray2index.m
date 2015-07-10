%Pratap Luitel
%ENGS 111
%HW 1, Problem B
%4/9/2015
%

function [imIndex,imMap] = gray2index(im,varargin)
%
%INPUT
%im : [nRows x nColumns] loaded image data
%varargin : a cell containing one or more input arguments
%
%OUTPUT
%imIndex : [nRows x nColumns] each entry is the index into imMap
%imMap   : [varargin{1} x 3], contains the mapped r,g,b values
%
%
    
    range = getrangefromclass(im);%get the range of the data class
    rangeMax = range(2)+1; %number of gray levels(i.e 255+1 = 256 for uint8)
    
    %accept at most one variable argument
    if length(varargin) > 1
        error('Maximum of two input allowed to the function')
    elseif isempty(varargin)
        n = rangeMax; %default value if empty argument
    else
        n = varargin{1};
    end
    interval = (range(2)+1)/n;
    
    %image map
    imMap = [0:1/(n-1):1]';
    imMap = repmat(imMap,1,3);
    
    %image index
    imIndex = floor(im./interval);
end



    
    
    