%Pratap Luitel
%4/24/2015
%ENGS 111, HW-3, Problem 2

binSize = 1000;
xAxis=linspace(0,1,binSize);
yAxis=linspace(0,1,binSize)';
%hue matrix, column ranging from 0-100(increasing to the right)
H = repmat(xAxis,binSize,1); 
%saturation matrix, rows range from 0-100(increaing up)
S = repmat(yAxis,1,binSize); 
%value matrix, columns range from 0-100(increasing to the right)
V = repmat(yAxis,1,binSize); %value matrix
%V=1* ones(binSize,binSize);
shImage = cat(3, H, S,ones(binSize,binSize));%fix value(maximum here)
vhImage = cat(3,H,ones(binSize,binSize),V);%fix saturation( maximum here)

fontSize = 14;
figure
subplot(121)
imshow(hsv2rgb(shImage),'XData',[0 1],'YData',[0 1])
title('Saturation vs. Hue, Value: 1','fontsize',fontSize)
xlabel('Hue','fontsize',fontSize)
ylabel('Saturation','fontsize',fontSize)
axis on
set(gca,'fontsize',fontSize)

subplot(122)
imshow(hsv2rgb(vhImage),'XData',[0 1],'YData',[0 1])
title('Value vs. Hue, Saturation: 1','fontsize',fontSize)
xlabel('Hue','fontsize',fontSize)
ylabel('Value','fontsize',fontSize)
axis on
set(gca,'fontsize',fontSize)

fprintf('I created 3 2-d matrices, H, S and V and combined them to\n');
fprintf('get an HSV image color map\n');
fprintf('The hue values in H matrix ranged from 0 to 1 across 1000 columns.\n');
fprintf('The number of columns is stored by the variable binSize\n');
fprintf('Similarly, I made another 2d matrix for saturation and value.\n');
fprintf('To display hue vs. saturation, I concatenated H and S matrices with\n');
fprintf('a V matrix that was all ones. I then coverted this HSV image to an RGB\n');
fprintf('to pring the image on screen. \n');
fprintf('Hue vs. Value was plotted in exactly similar fashion.\n')
