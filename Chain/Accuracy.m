function[TotalAccuracy]=Accuracy(T,S)
Directory='E:\FCI\Third_Year\Image Processing-1\Project\Phase2\Train&TestMinimum\Image_DataSet';
label=-1;
totalaccuracy=0;
totalnumber=0;
TotalAccuracy=0;
folder_Folders=dir(Directory);
for j=3:1:length(folder_Folders)
 foldername=strcat(Directory,'\',folder_Folders(j).name);
 folder_Files=dir(foldername);
 for i=3:1:length(folder_Files);
    filename=strcat(foldername,'\',folder_Files(i).name);
   label=Test(filename,T,S);
      l=cast(folder_Folders(j).name, 'double') - 48;
   if label==l;
       totalaccuracy=totalaccuracy+1;
   end
totalnumber=totalnumber+1;
 end
end 
accuracy=(totalaccuracy/totalnumber);
TotalAccuracy=TotalAccuracy+accuracy;
TotalAccuracy

end


