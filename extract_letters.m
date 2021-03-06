function [ letters ] = extract_letters( words )
% Extracting letters in an array of words
% returns 2d cell array; each row represents a word
% each cell in a row represents letters of a this word
    letters = {};
    rows = [];
    for i = 1 : length(words) 
       word = cell2mat(words(i));
       [lab,num] = bwlabel(word);
      % figure;
       lettersinword = {};
       for i = 1:num
            [r,c] = find(lab == i);
            letter = word(min(r):max(r),min(c):max(c),:);
            rows = [rows , size(letter,1)];
            lettersinword = [lettersinword letter];
%              subplot(3,4,i)
%              imshow(letter);
       end
       lettersinword = {lettersinword};
       letters = [letters ; lettersinword];
       
    end
    q1 = prctile(rows, 25);
    q3 = prctile(rows, 75);
    iqr = q3 - q1;
    lower = q1 - 1.5*iqr;
    upper = q3 + 1.5*iqr;
    for i = 1:length(letters)
        for j =1:length(letters{i})
            if size(letters{i}{j},1) > upper || size(letters{i}{j},1) < lower
                letters{i}{j} = [];
            end
        end
    end
end

