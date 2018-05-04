function [CentroidPoints]=Centroid(image,M,N)

i=size(image,1);%rows%
j=size(image,2);%columns%
num_Rows=i;
num_Columns=j;

if(((mod(i,M)~=0)) &&((mod(j,N))~=0))
num_Rows=(i-(mod(i,M)))+M; %make number of rows divisable by M%
num_Columns=(j-(mod(j,N)))+N;%make number of columns divisable by N%
end
if(((mod(i,M)~=0)) &&((mod(j,N))==0))
num_Rows=(i-(mod(i,M)))+M; %make number of rows divisable by M%
end
if(((mod(i,M))==0)) &&((mod(j,N)~=0))
num_Columns=(j-(mod(j,N)))+N;%make number of columns divisable by N%
end


if(i~=num_Rows(1)&&j~=num_Columns(1)) %padding%
image(num_Rows(1),num_Columns(1))=0; 
end
if(i~=num_Rows(1)&&j==num_Columns(1)) %padding rows only%
image(num_Rows(1),:)=0;    
end 
if(i==num_Rows(1)&&j~=num_Columns(1)) %padding columns only%
image(:,num_Columns(1))=0;    
end


nrow=size(image,1); % new size after padding %
ncol=size(image,2);
r=(nrow/M)*ones(M,1);
c=(ncol/N)*ones(1,N);
block=mat2cell(image,r,c);




numOfBlocks=N*M;
x_numerator=0;
x_dum=0;
y_numerator=0;
y_dum=0;

for n=1:1:numOfBlocks
    currentBlock=block{n};
    for x=1:1:size(currentBlock,1)
        for y=1:1:size(currentBlock,2)
            if(currentBlock(x,y)==1)
        x_numerator=x_numerator+(x*1);%currentBlock(x,y)=1%
        x_dum=x_dum+1;%currentBlock(x,y)=1%
        y_numerator=y_numerator+(y*1);
        y_dum=y_dum+1;
            end
        end
    end
    if(x_dum~=0)
        XC(1,n)=x_numerator/x_dum;
    end
    if(x_dum==0)
        XC(1,n)=0;
    end
    if(y_dum~=0)
        YC(1,n)=y_numerator/y_dum;
    end
    if(y_dum==0)
        YC(1,n)=0;
    end
    CentroidPoints=[XC,YC];
    CentroidPoints=CentroidPoints(:);
x_numerator=0;
x_dum=0;
y_numerator=0;
y_dum=0;
end
end