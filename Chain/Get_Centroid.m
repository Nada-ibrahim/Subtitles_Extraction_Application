function [XC,YC]=Get_Centroid(image)
x_numerator=0;
x_dum=0;
y_numerator=0;
y_dum=0;
for x=1:1:size(image,1)
    for y=1:1:size(image,2)
            if(image(x,y)==1)
        x_numerator=x_numerator+(x*1);%image(x,y)=1%
        x_dum=x_dum+1;%image(x,y)=1%
        y_numerator=y_numerator+(y*1);
        y_dum=y_dum+1;
            end
    end
end
    if(x_dum~=0)
        XC=x_numerator/x_dum;
    end
    if(x_dum==0)
        XC=0;
    end
    if(y_dum~=0)
        YC=y_numerator/y_dum;
    end
    if(y_dum==0)
        YC=0;
    end

end
