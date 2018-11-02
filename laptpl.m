function [ imtpl, imbtpl ] = laptpl( imgA, imgB, theta )
%LAPTPL Summary of this function goes here
%   Detailed explanation goes here
imtmpA = zeros(size(imgA));
imtmpB = zeros(size(imgB));
imtmpA = imgA;
imtmpB = imgB;
imtpl = uint8(abs(imtmpA - imtmpB));
imbtpl = uint8(abs(imtmpA - imtmpB));
for c = 1 : 3
    tmptpl = imtpl(:, :, c);
    tmpbtpl = imbtpl(:, :, c);
    [bm, bn] = find(tmptpl >= theta);
    [sm, sn] = find(tmptpl < theta);
    %
    num = length(bm);
    for i = 1 : num
        tmptpl(bm(i), bn(i)) = 255;
        tmpbtpl(bm(i), bn(i)) = 1;
    end
    %
    num = length(sm);
    for i = 1 : num
        tmptpl(sm(i), sn(i)) = 0;
        tmpbtpl(sm(i), sn(i)) = 0;
    end
    imtpl(:, :, c) = tmptpl;
    imbtpl(:, :, c) = tmpbtpl;
end

end

