%Pratap %luitel
%ENGS 111
%HW 7

%code representation of the plane is based on
%examples in http://www2.math.umd.edu/~jmr/241/lines_planes.html

filename = 'stack2-1.mat';
imIn = load(filename);
stack = imIn.stack2;

[xMax,yMax,zMax] = size(stack);


%region of interest (ROI)
r1 = [100,0,zMax]-[0,100,0];%vector // to the plane
r2 = [xMax - 100,0,0]-[0,yMax,0];%vector // to the plane
normal = cross(r1, r2);%normal to the palne
P1 = [xMax,yMax-100,0];%point on the plane

syms x y z
P = [ x, y, z];
planefunction = dot(normal, P-P1);%ROI
zplane = solve(planefunction,z);
ezmesh(zplane, [0, xMax, 0, yMax]);

% roiPlane = zeros(xMax,yMax);
% for i = 1:xMax
%     for j = 1:yMax
%         for k = 1:zMax
%             if(31744*i + 19344*y-10000*z == 11144128)
%                 roiPlane(i,j) = stack(i,j,k);
%             end
%         end
%     end
% end


       

