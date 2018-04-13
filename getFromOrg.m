function [goodImg] = getFromOrg(org, haar)
org = double(org);
goodImg = haar;
x = 0;
%goodImg2 = true(size(org,1), size(org,2));
while (x < 20)
%     imshow(goodImg);
    goodImg2 = goodImg;
    for i = 2:size(haar,1)-1
        for j = 2: size(haar,2)-1
            if(goodImg2(i, j) == 255 && org(i,j) > 150)
                goodImg = set8Points(org, goodImg, i, j, 255);
%                 goodImg(i, j) = 255;
            elseif goodImg2(i, j) == 255 && org(i,j) < 150
                goodImg(i, j) = 0;
                
            end
        end
    end
    x = x + 1;
end
for i = 2:size(haar,1)-1
    for j = 2: size(haar,2)-1
        if(goodImg(i, j) == 255 && org(i,j) > 150)
            t = 150;
            if org(i-1, j)> t && goodImg(i-1,j) == 0
                goodImg = cleanImg(goodImg, 0, i, j);
            elseif org(i, j-1)> t && goodImg(i,j-1) == 0
                goodImg = cleanImg(goodImg, 0, i, j);
            elseif org(i, j+1)> t && goodImg(i,j+1) == 0
                goodImg = cleanImg(goodImg, 0, i, j);
            elseif org(i+1, j)> t && goodImg(i+1,j) == 0
                goodImg = cleanImg(goodImg, 0, i, j);
            end 
        end
    end
end
end
