%% Record
%
% Create 2017-10-16
%%
clc;
clear;
FigureIdx = 2017101603
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
alpha = 0.7;
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
peak_thresh = 4;
I1 = single(rgb2gray(img1)) ;
[f1, d1] = vl_sift(I1, 'PeakThresh', peak_thresh) ;
I2 = single(rgb2gray(img2)) ;
[f2, d2] = vl_sift(I2, 'PeakThresh', peak_thresh) ;
Ifu = single(rgb2gray(fuImg)) ;
[ffu, dfu] = vl_sift(Ifu, 'PeakThresh', peak_thresh) ;
%% Visualize all features
figure(FigureIdx + 1);
DisplayNum = 20;
subplott(1, 3, 1, 0.01);
imshow(img1);
perm = randperm(size(f1,2));
sel = perm(1:DisplayNum);
% h1 = vl_plotframe(f1(:, sel));
h1 = vl_plotframe(f1);
set(h1,'color','r','linewidth',2);
%
subplott(1, 3, 2, 0.01);
imshow(img2);
perm = randperm(size(f2,2));
sel = perm(1:DisplayNum);
% h2 = vl_plotframe(f2(:, sel));
h2 = vl_plotframe(f2);
%
set(h2,'color','y','linewidth',2);
subplott(1, 3, 3, 0.01);
imshow(fuImg);
perm = randperm(size(ffu,2));
sel = perm(1:DisplayNum);
% h3 = vl_plotframe(ffu(:, sel));
h3 = vl_plotframe(ffu);
set(h3,'color','b','linewidth',2);