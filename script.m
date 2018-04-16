
for i =1 : 7
    
img=['Data set\' int2str(i) '.jpg'];
img=readImg(img);
%figure;
%imshow(img);

trans = haarFilter(img);
extract_trans(trans);
end


