function res = preprocess(points)
%PREPROCESS Summary of this function goes here
%   Detailed explanation goes here

points(:,3) = [];
points = points';
points = data_normalize(points,'minmax');
points = removegaps(points);
res = coord2vecimg(points);
res = res(:);
end

