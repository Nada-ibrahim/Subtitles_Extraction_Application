function[]=TrainingCentroid(T,S)
Directory='E:\FCI\Third_Year\Image Processing-1\Project\Phase2\Train&TestMinimum\Image_DataSet';
FVS=[];
folder_Folders=dir(Directory);
len=length(folder_Folders)-2;
Targetlabels=zeros(len,len*6);%intialization of all targets by 0 //228(47*6)
col=1;
counter=1;
Labels=[];

for j=1:1:length(folder_Folders)
 foldername=strcat(Directory,'\',folder_Folders(j).name);
 folder_Files=dir(foldername);
 if folder_Folders(j).name(1)~='.'
Labels=cat(1,Labels,folder_Folders(j).name(1));
for i=3:1:length(folder_Files)
    filename=strcat(foldername,'\',folder_Files(i).name);
    img=imread(filename);
    FVS=cat(2,FVS,Centroid(img,T,S));
    index=size(Labels,1);
    Targetlabels(index,col)=1;
    counter=counter+1;
    col=col+1;
end
 end
end
Targetlabels = Targetlabels(:,1:col-1);
struct=Feedforward([20 30]);
outputTraining=train(struct,FVS,Targetlabels);
save('outputOfTraining.mat','outputTraining');
save('Labels.mat','Labels');
end
