function [ img ] = cleanImg( img, fillColor, i, j)
    pointsX = zeros(size(img,1)*size(img,2),1);
    pointsY = zeros(size(img,1)*size(img,2),1);
    index = 1;
    pointsX(index,1) = i;
    pointsY(index,1) = j;
    while(index ~= 0)
        x = pointsX(index,1);
        y = pointsY(index,1);
        index = index - 1;
        if x > 0 && y > 0 && x <= size(img,1) && y <= size(img,2) && img(x,y) ~= fillColor
            img(x,y) = fillColor;
            pointsX(index+1,1) = x+1;
            pointsY(index+1,1) = y;
            pointsX(index+2,1) = x-1;
            pointsY(index+2,1) = y;
            pointsX(index+3,1) = x;
            pointsY(index+3,1) = y-1;
            pointsX(index+4,1) = x;
            pointsY(index+4,1) = y+1;
            index = index + 4;
        end
    end
end

