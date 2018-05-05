function [ img ] = crop_line( img )

[r,c] = find(img == 1);
if (~isempty(r))
    img = imcrop(img, [min(c), min(r), ((size(img, 2)- min(c))-((size(img, 2) - max(c)))),((size(img, 1)- min(r))-((size(img, 1) - max(r))))]);
end


end

