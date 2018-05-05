function[TotalAccuracy]=Accuracy(T,S)
Directory='D:\Matlab\Image Project Git\characters';
label=-1;
totalaccuracy=0;
totalnumber=0;
TotalAccuracy=0;
folder_Folders=dir(Directory);
for j=1:1:length(folder_Folders)
    if folder_Folders(j).name(1) ~= '.'
        foldername=strcat(Directory,'\',folder_Folders(j).name);
        folder_Files=dir(foldername);
        for i=3:1:length(folder_Files);
            filename=strcat(foldername,'\',folder_Files(i).name);
            img = openImgBW(filename);
            label=Test(img,T,S);
            l=folder_Folders(j).name(1);
            if label==l;
                totalaccuracy=totalaccuracy+1;
            end
            totalnumber=totalnumber+1;
        end
    end
end
accuracy=(totalaccuracy/totalnumber);
TotalAccuracy=TotalAccuracy+accuracy;
TotalAccuracy

end


