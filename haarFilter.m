function []=haarFilter(img)
% img=im2bw(img,0.5);
% n = 2;
% %[ca,ch,cv,cd]=dwt2(img,'haar');%wavelet decomposition in to approximation image ,horiz,vertical and diagonals
% [c,s]=wavedec2(img,n,'haar');    %multiple level decomposition: c is 1 row containing all values of appcoeff,H,V,D,
%                                   %s is 3*2 first row is sz of app coef ,
%                                   %second row is sz of sum of H,V,D ,
%   %imshow(img);                                %third row is sz of img
% %[ch,cv,cd]=detcoef2('all',c,s,1);%extract coefficients details from c,s 
% % reconstruct coefficienrs
% A1 = appcoef2(c,s,'haar',n);
% h=wrcoef2('h',c,s,'haar',n); 
% v=wrcoef2('v',c,s,'haar',n);
% d=wrcoef2('d',c,s,'haar',n);
% %imghaar=zeros(size(h,1),size(h,2));
% %xO=waverec2(c,s,'haar');  %reconstruct ooriginal image 
% [thr,sorh,keepapp]=ddencmp('den','wv',img); %compress image
% [imghaar,CXC,LXC,PERFO,PERFL2]=wdencmp('gbl',c,s,'haar',1,thr,sorh,keepapp);
% imghaar=zeros(size(h,1),size(h,2));
% %  for i=1:size(h,1)
% %      for j=1:size(h,2)
% %          if((h(i,j)>0)&&(d(i,j)>0)&&(v(i,j)>0))
% %              imghaar(i,j)=1;
% %         end
% %      end
% %  end
% %imghaar=im2bw(imghaar,0.5);

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
imghaar=zeros(size(Hnew,1),size(Hnew,2));
imghaar((Hnew>0)&(Vnew>0)&(Dnew>0)) = 255;
imghaar = imresize(imghaar, [size(img,1) size(img,2)], 'nearest');
candidateImg = preprocessImg(getTxtEdgesFromCandidate(img, candidate));
s = sum(candidateImg);
m = median(s);
d = mean(s);
plot(s);
figure;
subplot(3,1,1);
imshow(img);
%xlabel('original');
% subplot(4,1,2);
% imshow(Vnew);
%xlabel('haar');
subplot(3,1,2);
imshow(imghaar);
 subplot(3,1,3);
 imshow(candidateImg);

end