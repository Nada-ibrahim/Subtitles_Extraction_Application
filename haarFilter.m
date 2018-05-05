function [candidateImg]=haarFilter(img)

%haar Filter

[Hnew, Vnew, Dnew] = applyHaar(img);

%morphology(dilating - thickning) of bassbands
SE = strel('rectangle',[5 3]);
hDilate=imdilate(Hnew,SE);

SE = strel('rectangle',[3 3]);
vDilate=imdilate(Vnew,SE);

SE = strel('rectangle',[3 5]);
dDilate=imdilate(Dnew,SE);


%AND between dilated bassbands
imghaar=zeros(size(Hnew,1),size(Hnew,2));
imghaar((hDilate>0)&(vDilate>0)&(dDilate>0)) = 255;

%increasing the size of the edges image to be the same size as the org
imghaar = imresize(imghaar, [size(img,1) size(img,2)], 'nearest');

%remove all non text area in the original image and leave only the
%candidate text area
candidate = boundingBox(imghaar, img);

%applty segmentation and flooding on text area alone

candidateImg = preprocessImg(getTxtEdgesFromCandidate(img, candidate));
s = sum(candidateImg);
%plot(s);
%figure;
%subplot(3,1,1);
%imshow(img);
%xlabel('original');
% subplot(4,1,2);
% imshow(Vnew);
%xlabel('haar');
%subplot(3,1,2);
%imshow(imghaar);
 %subplot(3,1,3);
 %imshow(candidateImg);

end