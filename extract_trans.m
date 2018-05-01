
function [ letters, bool_trans ] = extract_trans( trans )
% Extracting translation from img
    [lines , bool_trans] = extract_lines(trans); % bool_trans check if translation exsits
    if (bool_trans == 0)
        words = extract_words(lines);
        letters = extract_letters(words);
    end
end

