%% Record
%
% Create 2017-10-16
%%
clc;
clear;
FigureIdx = 2017101601
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
% img2 = histeqs(img2);

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
fuImg = uint8(fuImg);
%%
figure(FigureIdx);
subplott(2, 3, 1, 0.01);
imshow(img1);
%
subplott(2, 3, 2, 0.01);
% img2 = histeqs(img2);
imshow(img2);
%
subplott(2, 3, 3, 0.01);
imshow(fuImg);
%%
clear param
param.orientationsPerScale = [8 8 8 8]; % number of orientations per scale (from HF to LF)
param.numberBlocks = 20;
[param.numberBlocks param.numberBlocks];
param.fc_prefilt = 4;
% param.imresizecrop = [256, 256];
[gist1, param] = LMgist(img1, '', param);
[gist2, param] = LMgist(img2, '', param);
[gistFu, param] = LMgist(fuImg, '', param);
% %
% figure(FigureIdx + 1);
gistDisplay1 = gistshoweq(gistvisual(gist1, param));
subplott(2, 3, 4, 0.01);
montage(gistDisplay1, 'size', [param.numberBlocks param.numberBlocks]);
%
gistDisplay2 = gistshoweq(gistvisual(gist2, param));
subplott(2, 3, 5, 0.01);
montage(gistDisplay2, 'size', [param.numberBlocks param.numberBlocks]);
%
gistDisplayFu = gistshoweq(gistvisual(gistFu, param));
subplott(2, 3, 6, 0.01);
montage(gistDisplayFu, 'size', [param.numberBlocks param.numberBlocks]);

function gistVi = gistshoweq(gistVi)
cNum = size(gistVi, 4);
for c = 1 : cNum
    gistVi(:, :, :, c) = histeqs(gistVi(:, :, :, c));
end
end