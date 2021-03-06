function [goodImg] = getFromOrg(org, haar)
org = wiener2(org,[3 3]);
org = imsharpen(imsharpen(org));
org = imadjust(uint8(org), [0.5 0.8], [0 1]);
org = double(org);

%imshow(uint8(org));
goodImg = haar;
goodImg2 = goodImg;
%      imshow(goodImg);
for i = 2:size(haar,1)-1
    for j = 2: size(haar,2)-1
        if(goodImg(i, j) == 255 && org(i,j) > 150)
%             imshow(goodImg2);
            goodImg2 = regionGrow(org, goodImg2, i, j);
        elseif goodImg(i, j) == 255 && org(i,j) <= 150
            goodImg2(i, j) = 0;
        end
    end
end

goodImg = logical(goodImg2);
% imshow(goodImg);
CC = bwconncomp(goodImg, 4);
numPixels = cellfun(@numel,CC.PixelIdxList);
mx = 0.1*max(numPixels);
idx = find(numPixels > max(180, 0.07*max(numPixels)));
for i = 1:length(idx)
    goodImg(CC.PixelIdxList{idx(i)}) = 0;
%     imshow(goodImg);
end
end
