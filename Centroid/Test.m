function[labelImg]=Test(pathOfImage,T,S)
load('outputOfTraining2.mat','outputTraining2');
load('Labels2.mat','Labels2');
img1=imread(pathOfImage);
%imgW=im2bw(img1);
image=Preprocessing(img1);
Centroidimg=Centroid(image,T,S);%% feature vector of image
simulate=sim(outputTraining,Centroidimg);
[maxValue,index]=max(simulate);
labelImg=Labels(index);
end

        


