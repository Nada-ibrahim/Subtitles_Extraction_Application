function [output]=imageScript( img )
%for i =1 : 94 
   % img=['dataset\' int2str(i) '.jpg'];
   
    img=readImg(img);
    %figure;
    %imshow(img);
    trans = haarFilter(img);
    %name = [int2str(i) 'd.bmp'];
    %imwrite(trans, name);
    letters = extract_trans(trans);
    linkedLitters = linkeLetter( letters );
    
%     for j=1:length(letters)
%         for x=1:length(letters{j})
%             char = 1-letters{j}{x};
%             if(~isempty(char))
%                 name = ['New Folder\im ' int2str(i) 'w' int2str(j) 'c' int2str(x) '.bmp'];
%                 imwrite(char, name);
%             end
%         end
%     end
%end

output='subtitle';
end

