function [goodImg] = getFromOrg(org, haar)
org = double(org);
goodImg = haar;

%      imshow(goodImg);
for i = 2:size(haar,1)-1
    for j = 2: size(haar,2)-1
        if(goodImg(i, j) == 255 && org(i,j) > 150)
            goodImg = regionGrow(org, goodImg, i, j);
        elseif goodImg(i, j) == 255 && org(i,j) <= 150
            goodImg(i, j) = 0;
        end
    end
end

goodImg = logical(goodImg);
CC = bwconncomp(goodImg, 4);
numPixels = cellfun(@numel,CC.PixelIdxList);
idx = find(numPixels > max(190, 0.1*max(numPixels)));
for i = 1:length(idx)
    goodImg(CC.PixelIdxList{idx(i)}) = 0;
end

end
