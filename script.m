
for i =1 : 1
    
img=['Data set\' int2str(7) '.jpg'];
img=readImg(img);
%figure;
%imshow(img);

trans = haarFilter(img);
extract_trans(trans);
end


