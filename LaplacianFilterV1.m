function [imgLaplacian]=LaplacianFilterV1(preImage,T)
LapFilMat=[-1,-1,-1;-1,8,-1;-1,-1,-1];
preImage=readImg(preImage);
rowSize=size(preImage,1);
colSize=size(preImage,2);
currRow=1;
currCol=1;
image(rowSize+2,colSize+2)=0;%padding
image(2:rowSize+1,2:colSize+1)=preImage;
  subplot(2,2,1);
    imshow(preImage);
for currRow=2:1:rowSize
    for currCol=2:1:colSize
        laplacian=LapFilMat.*image(currRow-1:currRow+1,currCol-1:currCol+1);
        check=sum(sum(laplacian));
        if check>T
            preImage(currRow,currCol)=255;
        end
        if check<=T
            preImage(currRow,currCol)=0;
        end
    end       
end
   
    subplot(2,2,2);
   imshow(preImage);
imgLaplacian=preImage;
end