function [good] = set8Points(org, good, i , j, k)
p = org(i, j);
t = 150;
if abs(org(i-1, j))> t
    good(i-1, j) = k;
end
% if abs(org(i-1, j-1)) > t
%     good(i-1, j-1) = k;
% end
% if abs(org(i-1, j+1)) > t
%     good(i-1, j+1) = k;
% end
if abs(org(i, j-1))> t
    good(i, j-1) = k;
end
if abs(org(i, j+1)) > t
    good(i, j+1) = k;
end
% if abs(org(i+1, j-1)) > t
%     good(i+1, j-1) = k;
% end
if abs(org(i+1, j)) > t
    good(i+1, j) = k;
end
% if abs(org(i+1, j+1)) > t
%     good(i+1, j+1) = k;
% end
end