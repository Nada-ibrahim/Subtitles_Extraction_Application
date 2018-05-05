function [ centroid ] = getCentroid( learImg, r, c)
learImgQ = divImg(learImg, r, c);
centroid = [];
[r, col] = size(learImgQ);
for i = 1:r
    for j = 1:col
        q = cell2mat(learImgQ(i,j));
        [xSum, ySum] = find(q);
        onesNo = sum(sum(q));
        if onesNo == 0
            xCent = 0.5;
            yCent = 0.5;
        else
            xCent = sum(xSum)/(onesNo);
            yCent = sum(ySum)/(onesNo);
        end
        centroid = [centroid xCent yCent];
    end
end
end

