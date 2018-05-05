function[labelImg]=Test(img,T,S)
load('outputOfTraining.mat','outputTraining');
load('Labels.mat','Labels');

% img1=imread(pathOfImage);
% imgW=im2bw(img1);
% image=Preprocessing(imgW);
chainCodeImg=getFV(img,T,S);%% feature vector of image
simulate=sim(outputTraining,chainCodeImg);
[maxValue,index]=max(simulate);

labelImg = Labels(index);
end

        


