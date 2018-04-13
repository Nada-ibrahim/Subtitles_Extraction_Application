function [ H, V, D ] = applyHaar( img )

%sum columns
I1 = zeros(size(img,1), size(img,2));
k=1;
for i=1:2:size(img,2)
    I1(:,k)=(img(:,i)+img(:,i+1));
    k=k+1;
end
for i=1:2:size(img,2)
    I1(:,k)=(img(:,i)-img(:,i+1));
    k=k+1;
end
I1=round(I1);

%sum rows
I2 = zeros(size(img,1), size(img,2));
k=1;
for i=1:2:size(img,1)
    I2(k,:)=(I1(i,:)+I1(i+1,:));
    k=k+1;
 end

for i=1:2:size(img,1)
    I2(k,:)=(I1(i,:)-I1(i+1,:));
    k=k+1;
end

%final Haar = I2;
I2=round(I2);

%threshold
H=I2(1:(size(I2,1))/2,(size(I2,2))/2+1:(size(I2,2))) ;
H=haarThrethold(H);

V=I2((size(I2,1))/2+1:size(I2,1),1:(size(I2,2))/2) ;
V=haarThrethold(V);

D=I2((size(I2,1))/2+1:size(I2,1),(size(I2,2))/2+1:(size(I2,2))) ;
D=haarThrethold(D);

end

