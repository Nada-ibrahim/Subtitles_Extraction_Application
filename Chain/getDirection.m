function [ direction ] = getDirection( xf, yf, xl, yl)
diffx = xl - xf;
diffy = yl - yf;
if diffx == 0 && diffy == -1
    direction = 1;
elseif diffx == 0 && diffy == 1
    direction = 2;
elseif diffx == 1 && diffy == -1
    direction = 3;
elseif diffx == 1 && diffy == 0
    direction = 4;
elseif diffx == 1 && diffy == 1
    direction = 5;
elseif diffx == -1 && diffy == -1
    direction = 6;
elseif diffx == -1 && diffy == 0
    direction = 7;
elseif diffx == -1 && diffy == 1
    direction = 8;
else
    direction = 0;
end

end

