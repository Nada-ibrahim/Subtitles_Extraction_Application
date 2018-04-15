function [ bw ] = regionGrow( grey,bw, i, j)
pointsX = zeros(size(bw,1)*size(bw,2),1);
pointsY = zeros(size(bw,1)*size(bw,2),1);
index = 1;
pointsX(index,1) = i;
pointsY(index,1) = j;
pointsX(index+1,1) = i+1;
pointsY(index+1,1) = j;
pointsX(index+2,1) = i-1;
pointsY(index+2,1) = j;
pointsX(index+3,1) = i;
pointsY(index+3,1) = j-1;
pointsX(index+4,1) = i;
pointsY(index+4,1) = j+1;
index = index + 4;
x = 0;
while(index ~= 0 )
    x = pointsX(index,1);
    y = pointsY(index,1);
    index = index - 1;
    if x > 0 && y > 0 && x <= size(bw,1) && y <= size(bw,2) && grey(x,y) >= 150 && bw(x,y) ~= 255
        bw(x,y) = 255;
        pointsX(index+1,1) = x+1;
        pointsY(index+1,1) = y;
        pointsX(index+2,1) = x-1;
        pointsY(index+2,1) = y;
        pointsX(index+3,1) = x;
        pointsY(index+3,1) = y-1;
        pointsX(index+4,1) = x;
        pointsY(index+4,1) = y+1;
        index = index + 4;
        x = x+1;
    end
end


end

