%Pratap Luitel
%ENGS 111
%HW2, Part 3

filename='pout.tif';
imIn=imread(filename);
h=figure;

%initial values
r1=1/3;s1=1/3;
r2=2/3;s2=2/3;

%until there is a window handle
while (ishandle(h))

%PLM plot
clf
subplot(121)
x1=[0,r1];y1=[0,s1];
x2=[r1,r2];y2=[s1,s2];
x3=[r2,1];y3=[s2,1];
plot(x1,y1,'k',x2,y2,'k',x3,y3,'k','LineWidth',3,'MarkerFaceColor','black')
hold on
plot(r1,s1,'-mo','LineWidth',2,'MarkerFaceColor','r')
plot(r2,s2,'-mo','LineWidth',2,'MarkerFaceColor','r')
xlabel('input intensity');
ylabel('output intensity');
axis square;
title('PLM')

subplot(122)
imOut=plm(imIn,[r1,s1,r2,s2]);
imshow((abs(imOut)))
title('PLM Image')

%read from the input
[x,y]=ginput(2);
r1=x(1);s1=y(1);
r2=x(2);s2=y(2);

%clip for values outside[0,1]
if r1>1;r1=1;end
if r1<0;r1=0;end
if r2>1;r2=1;end
if r2<0;r2=0;end
if s1>1;s1=1;end
if s1<0;s1=0;end
if s2>1;s2=1;end
if s2<0;s2=0;end


end

