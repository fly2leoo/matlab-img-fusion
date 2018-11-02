%% Record
%
% http://www.cnblogs.com/tiandsp/archive/2013/06/07/3123810.html
% Create 2017-10-06
%%
clear;
clc;
FigureIdx = 2017100603;
%%
currentPath = pwd;
testImgName1 = 'lapimg/apple.jpg';
testImgName2 = 'lapimg/orange.jpg';
img1 = imread(fullfile(currentPath, testImgName1));
img2 = imread(fullfile(currentPath, testImgName2));
apple=double(img1);
orange=double(img2);
%
[m n]=size(apple);
maska = [ones(m,220) zeros(m,n-220)];
masko = 1 - maska;
%
maska = imfilter(maska,fspecial('gaussian',20,10),'replicate','same');
masko = imfilter(masko,fspecial('gaussian',20,10),'replicate','same');
%
re=maska.*apple+masko.*orange;
%%
figure(FigureIdx);
subplot(2, 2, 1);
imshow(apple,[]);
subplot(2, 2, 2);
imshow(orange,[]);
subplot(2, 2, 3);
imshow(maska,[]);
subplot(2, 2, 4);
imshow(re,[]);