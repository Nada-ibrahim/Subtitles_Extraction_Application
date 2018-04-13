function [H]=haarThrethold(H)
Hnew=zeros(size(H,1),size(H,2));
H = double(H);
for i=2:size(H,1)-1
    for j=2:size(H,2)-1
        col=abs(H(i+1,j)-H(i-1,j));
        row=abs(H(i,j+1)-H(i,j-1));
        Max=max(col,row);
        Hnew(i,j)=Max;
    end
end
T=sum(sum(abs(H) .*Hnew))/sum(sum(abs(Hnew)));
H(abs(H)>T)=255;
H(abs(H)<=T)=0;

%imshow(H);

end