function img = coord2vecimg(points)
%coord2vecimg Convert points to image representation
%   img = coord2vecimg(points)
%   points - normalized points in 2D space
%   img - image representation of points


%% Size of an image
rows = 15;
cols = 15;
%% Fill the image by difference between points and its order 
img = zeros(rows,cols,3);
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
   
   % x axis
   img(y,x,1) = img(y,x,1) + points(1,i+1)-points(1,i);
   % y axis
   img(y,x,2) = img(y,x,2) + points(2,i+1)-points(2,i);
   
   % order of points: -1 for the first part of points and +1 for the second
   % part of points
   if i<n/2
       img(y,x,3) = -1;
   else
       img(y,x,3) = 1;
   end
   
end

% Take the sign from sum of difference between points
[rows,cols,depth] = size(img);
for i=1:rows
   for j=1:cols
       for k=1:depth-1
           img(i,j,k) = sign(img(i,j,k));
       end
   end
end


end