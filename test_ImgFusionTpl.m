%% Record
%
% Create 2017-10-17
%%
clc;
clear;
FigureIdx = 2017101701;
%%
currentPath = pwd;
testImgName1 = 'alphaimg/light11.jpeg';
testImgName2 = 'alphaimg/dark11.jpeg';
% testImgName1 = 'lapimg/apple.jpg';
% testImgName2 = 'lapimg/orange.jpg';
img1 = imread(fullfile(currentPath, testImgName1));
img1 = imresize(img1, [320, 240]);
img2 = imread(fullfile(currentPath, testImgName2));
img2 = imresize(img2, [320, 240]);
theta = 64;
[imtpl, imbtpl] = laptpl(img1, img2, theta);
%
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
fuImg = uint8(fuImg);
%
fuImgT = zeros(size(img2));
imbtpl = double(imbtpl);
for cidx = 1 : ChlNum
    fuImgT(:, :, cidx) = (fuImg1(:, :, cidx) - (1 - alpha) * (fuImg1(:, :, cidx) .* imbtpl(:, :, cidx))) + ((1 - alpha) * (fuImg2(:, :, cidx) .* imbtpl(:, :, cidx)));
end
fuImgT = uint8(fuImgT);
%%
figure(FigureIdx);
% subplott(1, 5, 1, 0.01);
% imshow(img1);
% %
% subplott(1, 5, 2, 0.01);
% imshow(img2);
% %
% subplott(1, 5, 3, 0.01);
% imshow(fuImg);
% %
% subplott(1, 5, 4, 0.01);
% imshow(imtpl);
% %
% subplott(1, 5, 5, 0.01);
% imshow(fuImgT);
%%
figure(FigureIdx);
subplott(1, 4, 1, 0.01);
imshow(img1);
%
subplott(1, 4, 2, 0.01);
imshow(img2);
%
subplott(1, 4, 3, 0.01);
imshow(imtpl);
%
subplott(1, 4, 4, 0.01);
imshow(fuImgT);