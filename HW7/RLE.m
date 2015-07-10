%Pratap Luitel
%ENGS 111
%HW 7
%This function computes the RLE compressed row vector from an input x
%matrix. 

function [values,frequency]=RLE(x)
ind=1;
values(ind)=x(1);
frequency(ind)=1;

for i=2 :length(x)
    if x(i-1)==x(i)
       frequency(ind)=frequency(ind)+1;
    else ind=ind+1;
         values(ind)=x(i);
         frequency(ind)=1;
    end
end
end
