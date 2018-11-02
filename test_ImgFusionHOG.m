%% Record
%
% Create 2017-10-16
%%
clc;
clear;
FigureIdx = 2017101602
%%
currentPath = pwd;
testImgName1 = 'alphaimg/light11.jpeg';
testImgName2 = 'alphaimg/dark11.jpeg';
% testImgName1 = 'lapimg/apple.jpg';
% testImgName2 = 'lapimg/orange.jpg';
img1 = imread(fullfile(currentPath, testImgName1));
img1 = imresize(img1, [640, 480]);
img2 = imread(fullfile(currentPath, testImgName2));
img2 = imresize(img2, [640, 480]);

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
subplott(1, 3, 1, 0.01);
imshow(img1);
%
subplott(1, 3, 2, 0.01);
imshow(img2);
%
subplott(1, 3, 3, 0.01);
imshow(uint8(fuImg));
%%
cellSize = 16;
hog1 = vl_hog(single(img1), cellSize, 'verbose', 'numOrientations', 4) ;
imhog1 = vl_hog('render', hog1, 'verbose', 'numOrientations', 4);
hog2 = vl_hog(single(img2), cellSize, 'verbose', 'numOrientations', 4) ;
imhog2 = vl_hog('render', hog2, 'verbose', 'numOrientations', 4);
hogFu = vl_hog(single(fuImg), cellSize, 'verbose', 'numOrientations', 4) ;
imhogFu = vl_hog('render', hogFu, 'verbose', 'numOrientations', 4);
%%
figure(FigureIdx + 1);
subplott(1, 3, 1, 0.08);
imagesc(imhog1);
%
subplott(1, 3, 2, 0.08);
imagesc(imhog2);
%
subplott(1, 3, 3, 0.08);
imagesc(imhogFu);