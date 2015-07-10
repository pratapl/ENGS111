%Pratap Luitel
%ENGS 111
%HW 5, Problem 1
%
%This function takes two images, computes and returns
%the mutual information based on the joint entropy function
%joint_h.m
%
%Note: Code adapted from ENGS 111 at Dartmouth, Spring 15(Professor Hartov)
%

function [MI, jointHist]=MI2(image_1,image_2)

jointHist=joint_h(image_1,image_2); % calculating joint histogram for two images
jointHist=jointHist/sum(jointHist(:)); % normalized joint histogram
y_marg=sum(jointHist,2); %sum of the rows of normalized joint histogram
x_marg=sum(jointHist);%sum of columns of normalized joint histogran

index=find(y_marg~=0);  % Avoid computing log(0)
Hy=-sum(y_marg(index) .* log2(y_marg(index)));
index=find(x_marg~=0);
Hx=-sum(x_marg(index) .* log2(x_marg(index)));
h_xy = -sum(sum(jointHist.*(log2(jointHist+(jointHist==0))))); % joint entropy
MI = Hx + Hy - h_xy;% Mutual information

