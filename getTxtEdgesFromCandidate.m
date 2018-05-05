function [ candidateEdgesCropped ] = getTxtEdgesFromCandidate( org, candidateImg)
%apply prewitt on original image
orgEdges = edge(org, 'sobel');
s = [0 0 1 0 0; 0 0 1 0 0; 0 1 1 1 0; 0 0 1 0 0; 0 0 1 0 0];
SE = strel(s);
orgEdges = imclose(orgEdges, SE);
orgEdges = imerode(orgEdges, SE);
%imshow(orgEdges);

%crop the result bases on the image that contain only the txt area
%(candidateImg)
[x, y] = find(candidateImg);
xmin = min(x);
xmax = max(x);
ymin = min(y);
ymax = max(y);
orgEdges = orgEdges(xmin:xmax, ymin:ymax);
candidateImg = candidateImg(xmin:xmax, ymin:ymax);
imshow(org(xmin:xmax, ymin:ymax));
%flood until reaching all text areas in the original and retutrn them in
%white and BG in black
candidateEdgesCropped = getFromOrg(candidateImg, 255*orgEdges);
candidateEdgesCropped = boundingBox(candidateEdgesCropped, candidateEdgesCropped);


end

