
function [ words ] = extract_trans( trans )
% Extracting words from img
    trans(trans == 255) = 1;
    trans = double(trans);
    linehist = sum(trans, 2);
    linehist(linehist<10) = 0;
    spliton = find(linehist == 0);
    lines = {};
    if (spliton ~= 0) 
        line1 = [1, spliton(1)];
        lines = [lines trans(1:spliton(1), :)];
        line2 = [spliton(1), spliton(end)];
        lines = [lines trans(spliton(1):spliton(end), :)];
        line3 = [spliton(end), size(trans, 1)];
        lines = [lines trans(spliton(end): size(trans, 1),:)];
    else 
        lines = [lines trans];
    end
    rmvline = [];
    
    for i = 1: size(lines, 2);
      test = lines(i);
        line = cell2mat(lines(i));
       if (sum(sum(line)) < 45)
           rmvline = [rmvline i];
       else
           wordhist = sum(line,1);
           subplot( 3,2, i);
           plot(wordhist);
           subplot( 3,2, i + 1);
           imshow(line)
       end
    end
   lines(rmvline) = [];

    figure;
    plot(linehist);
    

end

