function[numOfDirection] =Direction(curr_x,next_x,curr_y,next_y)
numOfDirection=-1;
if (curr_x<next_x) && (curr_y== next_y)
    numOfDirection=1;
end
if (curr_x<next_x) &&  (curr_y <next_y)
numOfDirection=2;
end
if (curr_x==next_x) && (curr_y< next_y)
    numOfDirection=3;
end
if (curr_x>next_x) &&  (curr_y <next_y)
numOfDirection=4;
end
if (curr_x>next_x) && (curr_y== next_y)
    numOfDirection=5;
end
if (curr_x>next_x) &&  (curr_y >next_y)
numOfDirection=6;
end
if (curr_x==next_x) && (curr_y>next_y)
    numOfDirection=7;
end
if (curr_x<next_x) &&  (curr_y >next_y)
numOfDirection=8;
end

end