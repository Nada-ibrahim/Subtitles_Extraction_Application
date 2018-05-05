function [ fv ] = getFV( img, T, S)

centroid = getCentroid(img, 1,1);
contour = cell2mat(bwboundaries(img, 8, 'noholes'));
if isempty(contour)
    g = 0;
end
x = contour(:,1);
y = contour(:,2);
r = sqrt((x-centroid(1,1)).^2 + (y-centroid(1,2)).^2);
R = max(r);
theta = atan2((y - centroid(1,2)), x-centroid(1,1));
theta(theta <= 0) = theta(theta <= 0) + 2 * pi;
repR = (r/R) * T - floor((r/R)) * T;
repR(repR < 0.5) = -1;
repR(repR >= 0.5) = 1;
repT = theta/(2*pi) * S - floor(theta/(2*pi)) * S;
repT(repT < 0.5) = -1;
repT(repT >= 0.5) = 1;

tracks = ceil((r/R) * T)-1;
sectors = ceil((theta/(2*pi)) * S)-1;
tracks(tracks == -1) = 0;
fv = zeros(T*S*8, 1);
for i = 1:length(x)-1
    tNo = tracks(i,1);
    sNo = sectors(i,1);
    dirNo =  getDirection(x(i,1), y(i, 1), x(i+1,1), y(i+1,1));
    c = 8*S*tNo + 8 * sNo + dirNo;
    if(c == 0)
        h = 1;
    end
    fv(c, 1) = fv(c,1) + 1;
    if(tNo+repR(i,1) >= 0 && tNo + repR(i,1) < T)
        c = 8*S*(tNo+repR(i,1)) + 8 * sNo + dirNo;
        fv(c, 1) = fv(c,1) + 1;
    end
    if(tNo+repR(i,1) >= 0 && tNo + repR(i,1) < T && sNo+repT(i,1) >= 0 && sNo+repT(i,1) < S)
        c = 8*S*(tNo+repR(i,1)) + 8 * (sNo+repT(i,1)) + dirNo;
        fv(c, 1) = fv(c,1) + 1;
    end
    if(sNo+repT(i,1) >= 0 && sNo+repT(i,1) < S)
        c = 8*S*(tNo) + 8 * (sNo+repT(i,1)) + dirNo;
        fv(c, 1) = fv(c,1) + 1;
    end
    
end
for i = 1:8:length(fv)
    s = sum(fv(i:i+7,1));
    for j = 0:7
        if(s~=0)
            fv(i+j, 1) = fv(i+j, 1)/s;
        end
    end
end
fv;
end

