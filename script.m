img='Data set\8.jpg';
img=readImg(img);
%figure;
%imshow(img);

trans = haarFilter(img);
extract_trans(trans);

