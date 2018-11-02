%% Record
%
% Create 2017-10-06
%%
clc;
clear;
FigureIdx = 2017100601;
%%
currentPath = pwd;
testImgName1 = 'alphaimg/light11.jpeg';
testImgName2 = 'alphaimg/dark11.jpeg';
% testImgName1 = 'lapimg/apple.jpg';
% testImgName2 = 'lapimg/orange.jpg';
img1 = imread(fullfile(currentPath, testImgName1));
% img1 = imresize(img1, [320, 240]);
img2 = imread(fullfile(currentPath, testImgName2));
% img2 = imresize(img2, [320, 240]);

fuImg1 = zeros(size(img1));
fuImg2 = zeros(size(img2));
fuImg = zeros(size(img2));
alpha = 0.4;
ChlNum = size(img1, 3);
for cidx = 1 : ChlNum
    fuImg1(:, :, cidx) = img1(:, :, cidx);
    fuImg2(:, :, cidx) = img2(:, :, cidx);
    fuImg(:, :, cidx) = alpha .* fuImg1(:, :, cidx) + (1 - alpha) .* fuImg2(:, :, cidx);
end
% fuImg = im2uint8(fuImg);
%%
figure(FigureIdx);
subplot(1, 3, 1);
imshow(img1);
%
subplot(1, 3, 2);
imshow(img2);
%
subplot(1, 3, 3);
imshow(uint8(fuImg));
%% %% SIFT
% peak_thresh = 5;
% ImgA = single(rgb2gray(img1));
% ImgB = single(rgb2gray(img2));
% [fa, da] = vl_sift(ImgA, 'PeakThresh', peak_thresh);
% [fb, db] = vl_sift(ImgB, 'PeakThresh', peak_thresh);
% [matches, scores] = vl_ubcmatch(da, db);
% %%
% figure(FigureIdx);
% subplot(1, 2, 1);
% imshow(img1);
% h1 = vl_plotframe(fa);
% set(h1,'color','y','linewidth',2);
% %
% subplot(1, 2, 2);
% imshow(img2);
% h2 = vl_plotframe(fb);
% set(h2,'color','y','linewidth',2);