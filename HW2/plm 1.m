%Pratap Luitel
%ENGS 111
%HW2, Part 3

function imOut = plm(imIn,V)
   
    r1=V(1);s1=V(2);
    r2=V(3);s2=V(4);
    
    imIn=im2double(imIn);
    imOut=zeros(size(imIn));
    
    %linear mapping for pixels<r1
    low = find(imIn<r1);%indices of pixels<r1
    m =(s1/r1);%slope
    imOut(low)= m.*imIn(low);%y intercept is 0
    
    %linear mapping of pixels within the range r1,r2
    mid = find(imIn<=r1 & imIn>r2);%pixels in the range[r1,r2)
    m = ((s2-s1)/(r2-r1));%slope
    c = s2-m*r2;%y intercept
    imOut(mid) = m.*imIn(mid)+c;
    
    %linear mapping of pixels>r2
    high = find(imIn>=r2);
    m = (1-s2)/(1-r2);
    c = 1 - m*1; %y intercept
    imOut(high) = m.*imIn(high) + c;
    

end

