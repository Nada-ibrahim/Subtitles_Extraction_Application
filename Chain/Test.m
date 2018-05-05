function[labelImg]=Test(pathOfImage,T,S)
load('outputOfTraining.mat','outputTraining');
load('Labels.mat','Labels');

img1=imread(pathOfImage);
imgW=im2bw(img1);
image=Preprocessing(imgW);
chainCodeImg=chainCode(image,T,S);%% feature vector of image
simulate=sim(outputTraining,chainCodeImg);
[maxValue,index]=max(simulate);

labelImg=index-1;
end

        


