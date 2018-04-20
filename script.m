
for i =1 : 1
    
img=['Data set\' int2str(3) '.jpg'];
img=readImg(img);
%figure;
%imshow(img);

trans = haarFilter(img);
extract_trans(trans);
end


