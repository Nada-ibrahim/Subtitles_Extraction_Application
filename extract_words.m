function [ words ] = extract_words( lines )
   words  = {};
   for i = 1 : length(lines)
        line = cell2mat(lines(i));
        linehight = size(line, 1);
        wordgap = ceil(floor(linehight * 0.2)/3);
        if (wordgap == 1)
            wordgap = 2;
        end
        se = strel('disk', wordgap  +1);
        img_2 = imdilate(line, se);
        %imshow(img_2);
        [lab,num] = bwlabel(img_2);
        for i=1:num
            [r,c] = find(lab == i);
            word = line(min(r):max(r),min(c):max(c),:);
            words = [words word];
%             subplot(3,4,i)
%             imshow(word);
        end
   end 
end

