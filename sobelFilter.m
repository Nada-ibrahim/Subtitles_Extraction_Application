function [imgsobel,magValue,phase]=sobelFilter(preImage,T)
df_dy=[-1,-2,-1;0,0,0;1,2,1];
df_dx=[-1,0,1;-2,0,2;-1,0,1];
preImage=readImg(preImage);
rowSize=size(preImage,1);
colSize=size(preImage,2);
currRow=1;
currCol=1;
phase=[];
magValue=[];
image(rowSize+2,colSize+2)=0;%padding
image(2:rowSize+1,2:colSize+1)=preImage;
subplot(2,2,1);
imshow(preImage);
for currRow=2:1:rowSize
    for currCol=2:1:colSize
        DY=df_dy.*image(currRow-1:currRow+1,currCol-1:currCol+1);
        DX=df_dx.*image(currRow-1:currRow+1,currCol-1:currCol+1);
        dyValue=sum(sum(DY));
        dxValue=sum(sum(DX));
        phase(currRow,currCol)=atan2(dyValue,dxValue);
        dyValue=dyValue.*dyValue; %square
        dxValue=dxValue.*dxValue; %square
        magValue(currRow,currCol)=sqrt(dxValue+dyValue);
        if magValue(currRow,currCol)>T
            preImage(currRow,currCol)=255;
        end
        if magValue(currRow,currCol)<=T
            preImage(currRow,currCol)=0;
        end
    end       
end
subplot(2,2,2);
imshow(preImage);
imgsobel=preImage;
end