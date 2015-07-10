%Pratap Luitel
%ENGS 111
%HW 2, Problem B
%4/15/2015
%
%INPUT
%imIn: input image, a grayscale double image
%V: a vector with 4 elements containing k1,k2,r0 and n
%
%OUTPUT
%imOut: output image after processing, a grayscale double image 
%       the output contains the magnitude of the inverse transform
%       to avoid issues with complex numbers
%
%This function enhances the features of an image by emphasizing higher
%frequency contents in the image. The image and the kernel are both taken 
%to frequency domain and multiplied. Then the result is inverse transformed 
%back to the original spatial domain. 

function imOut = enhance(imIn, V)
    
    narginchk(2,2); 
    if (length(V) ~= 4)
        error('Please pass [k1,k2,r0 and n]')
    end
    
    k1=V(1);
    k2=V(2);
    ro=V(3);
    n=V(4);
    
    %imIn=im2double(imIn);
    %imGray=rgb2gray(imIn);
    [nRow,nCol]=size(imIn);
    
    %radius matrix implementation
    rX=repmat(1:nCol,nRow,1);
    rY=repmat([1:nRow]',1,nCol);
    rX=rX-nCol/2;
    rY=rY-nRow/2;
    r=sqrt(rX.^2+rY.^2);
    size(r);
    
    %butterworth high pass filter implementation
    hpfilter=1./(1+(ro./r).^(2*n));
    imFFT=fftshift(fft2(imIn));
    Fuv=(k1+k2*hpfilter).*imFFT;%F(u,v)
    imOut=abs(ifft2(fftshift(Fuv)));
end
