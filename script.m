
for i =1 : 1
    
img=['Data set\' int2str(7) '.jpg'];
img=readImg(img);
%figure;
%imshow(img);

trans = haarFilter(img);
 letters = extract_trans(trans);
 linkedLitters = linkeLetter( letters );
end


