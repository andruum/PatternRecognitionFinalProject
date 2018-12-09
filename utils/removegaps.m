function points = removegaps(points)
%REMOVEGAPS Removes gaps between points
%   points = removegaps(points) Removes gaps between points by adding new
%   points between.
%   points - normalized points between [0;1]

%Parameter
maxgap = 0.01;

n = size(points,2)-1;
i=1;
while n>0
   dist = pdist([points(:,i)';points(:,i+1)'],'euclidean'); 
   if dist > maxgap
        %Add a new point between two points
        newpoint = [(points(1,i)+points(1,i+1))/2;
                    (points(2,i)+points(2,i+1))/2];
        points = [points(:,1:i) newpoint points(:,i+1:end)];
        n=n+1;
   else
       n=n-1;
       i=i+1;
   end
   
end

end
