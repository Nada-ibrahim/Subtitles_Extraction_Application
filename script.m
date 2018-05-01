
for i =1 : 1
    
path=['Data set\' int2str(11) '.png'];
img = imread(path);
img=readImg(img);
%figure;
%imshow(img);

trans = haarFilter(img);
extract_trans(trans);
end


