function [ linkedLitters ] = linkeLetter( letters )
    %n = 25;
    %m = 2;
    %counter = 1;
    linkedLitters = {};
    for i = 1:length(letters)
        for in = 1:length(letters{i})
            letPad = letters{i}{in}; 
            letPad = cat(2, zeros(size(letPad,1),3), letPad); 
            letPad = cat(2, letPad, zeros(size(letPad,1),3));
            letPad = cat(1, letPad, zeros(3, size(letPad,2)));
            letPad = cat(1, zeros(3, size(letPad,2)),letPad);   
            %subplot(n,m,counter);
            %imshow(letPad);
            %counter = counter + 1;
            el = strel('rectangle',[1 3]); % el is struct element
            let = imclose(letPad, el);
            linkedLitters = [linkedLitters, let]; 
            %l = edgeLinking(letters) ;
            %subplot(n,m,counter);
            %counter = counter + 1;
           % imshow(let);
           
            
        end
    end



end

