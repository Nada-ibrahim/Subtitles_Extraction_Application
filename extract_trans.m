
function [ words ] = extract_trans( trans )
% Extracting words from img
    lines = extract_lines(trans);
       % [L Ne]=bwlabel(trans);
    words = extract_words(lines);

end

