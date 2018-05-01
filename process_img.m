function [  ] = process_img( img )

img=readImg(img);
% figure;
% imshow(img);

trans = haarFilter(img);

extract_trans(trans);


end

