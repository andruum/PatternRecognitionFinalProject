function img = coord2vecimg(points)
%COORD2IMG Summary of this function goes here
%   Detailed explanation goes here


%Parameters
rows = 20;
cols = 15;

img = zeros(rows,cols,2);
n = size(points,2);
for i=1:n-1
   x = round(points(1,i)*cols);
   y = round(points(2,i)*rows);
   if x == 0
       x=x+1;
   end
   if y == 0
       y=y+1;
   end
   
   img(y,x,1) = img(y,x,1) + sign(points(1,i+1)-points(1,i));
   img(y,x,2) = img(y,x,2) + sign(points(2,i+1)-points(2,i));
   %img(y,x,3) = img(y,x,3) + fix(i/(n/5))+1;
end
end