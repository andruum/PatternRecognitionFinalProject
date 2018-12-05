function img = coord2img(points)
%COORD2IMG Summary of this function goes here
%   Detailed explanation goes here

%Parameters
rows = 30;
cols = 20;

img = zeros(rows,cols,1);

n = size(points,2);
for i=1:n
   x = round(points(1,i)*cols);
   y = round(points(2,i)*rows);
   if x == 0
       x=x+1;
   end
   if y == 0
       y=y+1;
   end
   img(y,x,1) = img(y,x,1)+1;
end


end

