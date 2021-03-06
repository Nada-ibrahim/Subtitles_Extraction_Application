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

str = '';
c = 1;
for j=1:length(letters)
    for x=1:length(letters{j})
        char = 1-linkedLitters{c};
        if(~isempty(letters{j}{x}))
            l = Test(1- char,2,3);
            str = [str l];
        end
        c = c+1;
    end
    str = [str ' '];
end

output=str;
end

