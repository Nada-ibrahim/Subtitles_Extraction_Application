function [ learImg ] = openImgBW( path )
learImg = imread(path);
if ~islogical(learImg)
    learImg = im2bw(imread(path));
end
learImg = 1 - learImg;
[x, y] = find(learImg);
xmin = min(x);
xmax = max(x);
ymin = min(y);
ymax = max(y);

learImg = learImg(xmin:xmax, ymin:ymax);
end

