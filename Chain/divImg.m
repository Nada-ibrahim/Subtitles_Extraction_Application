function [ learImgQ ] = divImg( learImg, rows, cols )
midRow = floor(size(learImg,1)/rows);
midCol = floor(size(learImg,2)/cols);
r = midRow * ones(1, rows-1);
c = midCol * ones(1, cols-1);
r = [r (size(learImg, 1) - ((rows-1)*midRow))];
c = [c (size(learImg, 2) - ((cols-1)*midCol))];
learImgQ = mat2cell(learImg, r, c);
end

