%Pratap Luitel
%ENGS 111
%HW 3, Problem 1

%a)
binSize = 1000;
xAxis=linspace(0,1,binSize);

%hue matrix, column ranging from 0-100(increasing to the right)
H = repmat(xAxis,100,1);
%create hsv image with varying H, but max S and V
hsvImage = cat(3,H, ones(size(H)), ones(size(H)));
image(hsv2rgb(hsvImage));
%h = colorbar;
%caxis([0 1000])
colormap('hsv')
v = linspace(1,64,5);
colorbar('Ytick',v,'YTickLabel',{'200','400','600','800','1000'});
title('mapping 1000 colors')
xlabel('Hue')


fprintf('I divided the values in the range 0 - 1, to 1000 discrete values.\n');
fprintf('I then created a matrix with 100 of the rows created earlier\n');
fprintf('to make a matrix corresponding to H in HSV\n');
fprintf('I chose H and S to be all maximum, meaning 1 in each entry.\n');
fprintf('This ensured that i would get hue values of highest saturation,\n');
fprintf('and intensity.\n');

