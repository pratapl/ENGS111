%Pratap Luitel
%ENGS 111
%4/17/2015

%This function takes in an image and clips values outside the range[0,1].
%The input is expected to be in double as the script clips any vlaues
%greater than 1 to 1. 

function imOut=clip(imIn)
    imOut=imIn;
    imOut(imIn<0)=0;
    imOut(imIn>1)=1;
end