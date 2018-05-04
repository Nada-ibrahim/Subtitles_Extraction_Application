function LaplacianOfGussian(pathOfImage)
preImage=readImg(pathOfImage);
lap_l=fspecial('log');
lapFilter=imfilter(preImage,lap_l);
imshow(lapFilter);
end