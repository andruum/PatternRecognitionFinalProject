function res = preprocess(points)
%PREPROCESS Preprocessing data before classification or training
%   res = preprocess(points)
%   points - points in 3D space
%   res - data for input layer of NN

%Remove the z-axis
points(:,3) = [];
points = points';
%Normalize data
points = data_normalize(points,'minmax');
%Remove gaps between points
points = removegaps(points);
%Convert to image
res = coord2vecimg(points);
res = res(:);
end

