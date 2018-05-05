function [ fv ] = getChainCode( imgPath, T, S )
img = openImgBW(imgPath);
fv = getFV(img, T, S);

end

