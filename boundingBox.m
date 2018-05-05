function [ candidateImg ] = boundingBox( haarImg, org )
haarImg = haarImg/255;
w  =100;
h = 26;
boxesValues = zeros(size(org,1), size(org,2));
for i = h/2:ceil(h/4):size(haarImg,1)-h/2
    for j = w/2:ceil(w/4):size(haarImg,2)-w/2
        block = haarImg(i-(h/2)+1:i+(h/2), j-(w/2)+1:j+(w/2));
        boxesValues(i,j) = sum(sum(block));
    end
end
[~,~,v] = find(boxesValues);

m = (max(v)+min(v))/2;
boxesValues(boxesValues <= m) = 0;
boxesValues(boxesValues > m) = 1;
candidateImg = zeros(size(org,1), size(org,2));
edgesImg = zeros(size(org,1), size(org,2));
for i = h/2:ceil(h/4): size(boxesValues,1)-h/2
    for j = w/2:ceil(w/4):size(boxesValues,2)-w/2
        if boxesValues(i,j) == 1
            candidateImg(i-(h/2)+1:i+(h/2), j-(w/2)+1:j+(w/2)) = org(i-(h/2)+1:i+(h/2), j-(w/2)+1:j+(w/2));
            edgesImg(i-(h/2)+1:i+(h/2), j-(w/2)+1:j+(w/2)) = haarImg(i-(h/2)+1:i+(h/2), j-(w/2)+1:j+(w/2));
        end
    end
end

end

