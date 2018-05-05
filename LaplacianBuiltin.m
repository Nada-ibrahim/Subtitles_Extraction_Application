function[lapFilter]= LaplacianBuiltin(path,alpha)
image=readImg( path )
lap_h=fspecial('laplacian',alpha);
lapFilter=imfilter(image,lap_h);
end