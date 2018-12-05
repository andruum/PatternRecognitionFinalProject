function C = digit_classify(points)
%DIGIT_CLASSIFY Estimate digit from 3D points
%   
%% Prepare everything
addpath("./utils");
weights_name = "weights.mat";

%% Preprocessing step
points(:,3) = [];
points = points';
points = data_normalize(points,'minmax');
points = removegaps(points);
%% Classification
img = coord2img(points);
C = mlp_classify(img,weights_name);
C = C-1;
end

