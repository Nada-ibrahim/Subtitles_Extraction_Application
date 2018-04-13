function [ img ] = readImg( path )

img = imread(path);
img = rgb2gray(img);
img = imresize(img, [NaN 640]);
sz = size(img);
strtPoint = sz(1) - 160+1;
hight = sz(1) - round(sz(1) * (1/2));
cropArr = [1,strtPoint,sz(2),160];
img = imcrop(img, cropArr);

%imshow(img);

end