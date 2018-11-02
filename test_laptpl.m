%% Record
%
% Create 2017-10-16
%%
clc;
clear;
FigureIdx = 2017101604;
%%
ImgWidth = 640;
ImgHeight = 480;
currentPath = pwd;
testImgName1 = 'alphaimg/light11.jpeg';
testImgName2 = 'alphaimg/dark11.jpeg';
% testImgName1 = 'lapimg/apple.jpg';
% testImgName2 = 'lapimg/orange.jpg';
img1 = imread(fullfile(currentPath, testImgName1));
img1 = imresize(img1, [ImgWidth, ImgHeight]);
img2 = imread(fullfile(currentPath, testImgName2));
img2 = imresize(img2, [ImgWidth, ImgHeight]);
%
theta = 200;
imtpl = laptpl(img1, img2, theta);
imshow(imtpl);