function [ str ] = process_img( img )

% img=readImg(img);
% figure;
% imshow(img);
img = rgb2gray(img);
img = imresize(img, [NaN 640]);
sz = size(img);
strtPoint = sz(1) - 160+1;
hight = sz(1) - round(sz(1) * (1/2));
cropArr = [1,strtPoint,sz(2),160];
img = imcrop(img, cropArr);

trans = haarFilter(img);

letters=extract_trans(trans);
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

end



