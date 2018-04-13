function [ processed ] = preprocessImg( learImg )
[x, y] = find(learImg);
xmin = min(x);
xmax = max(x);
ymin = min(y);
ymax = max(y);

processed = learImg(xmin:xmax, ymin:ymax);
end

