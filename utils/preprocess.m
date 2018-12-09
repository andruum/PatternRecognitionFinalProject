function res = preprocess(points)
%PREPROCESS Preprocessing data before classification or training
%   res = preprocess(points)
%   points - points in 3D space
%   res - data for input layer of NN

points(:,3) = [];
points = points';
points = data_normalize(points,'minmax');
points = removegaps(points);
res = coord2vecimg(points);
res = res(:);
end

