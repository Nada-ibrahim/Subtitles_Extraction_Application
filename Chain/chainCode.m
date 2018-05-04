function [segmentationsDirections]=chainCode(img,T,S) %
preImg=Preprocessing(img);
segmentationsDirections=zeros((T*S),8);
[xc yc]=Get_Centroid(preImg);
getContour=bwboundaries(preImg,'noholes');
contour=getContour{1};
r=sqrt(((contour(:,1)-xc).^2)+((contour(:,2)-yc).^2));
R=max(r);

for i=1:size(contour,1)-1
        x=contour(i,1);
        xn=contour(i+1,1);
        y=contour(i,2);
        yn=contour(i+1,2);
        seta=atan2((y-yc),(x-xc));
        seta=seta+pi;
        seta=mod(seta,2*pi);
        r=sqrt(((x-xc).^2)+((y-yc).^2));
        t=floor((r/R)*T);
        s=floor((seta/360)*S);
        if t==T
            t=t-1;
        end
        segmentnumber=(t*S)+(s+1);%rows
        direction=Direction(x,xn,y,yn);%columns
       if direction~=-1
        segmentationsDirections(segmentnumber,direction)=segmentationsDirections(segmentnumber,direction)+1;%increase the direction value
        end
end
 total=0;
for i=1:size(segmentationsDirections,1)
    for j=1:size(segmentationsDirections,2)
        total=total+segmentationsDirections(i,j);
    end
        for k=1:size(segmentationsDirections,2)
            if total~=0
            segmentationsDirections(i,k)=segmentationsDirections(i,k)/total;
            end
            if total==0
            segmentationsDirections(i,k)=0;
            end
        end
    total=0;
end
segmentationsDirections=segmentationsDirections(:);

end