function[proImg] =Preprocessing(img)
img_comp=imcomplement(img);
[cropX,cropY]=find(img_comp==1);
    minimumX=min(cropX);
    maximumX=max(cropX);
    minimumY=min(cropY);
    maximumY=max(cropY);
    proImg=img_comp(minimumX:maximumX,minimumY: maximumY);
end