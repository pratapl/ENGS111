function h=joint_h(image_1,image_2)
% function h=joint_h(image_1,image_2)
%
% takes a pair of images of equal size and returns the 2d joint histogram.
% used for MI calculation
% 
% NOTE: This code works for uint8 images only, careful (AH).  Can you tell
% why?    
% 
% NOTE also that this is very poor form coding (why?).  What would be the
% alternatives to this forumulation so one could vectorize it at least
% partly...
% 
% written by http://www.flash.net/~strider2/matlab.htm
% Modified by AH for ENGG 111.


rows=size(image_1,1);
cols=size(image_1,2);
N=256;

h=zeros(N,N);

for i=1:rows;    %  col 
  for j=1:cols;   %   rows
    h(image_1(i,j)+1,image_2(i,j)+1)= h(image_1(i,j)+1,image_2(i,j)+1)+1;
  end
end