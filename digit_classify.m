function C = digit_classify(points)
%DIGIT_CLASSIFY Estimate digit from 3D points
%   C = digit_classify(points) Returns estimated digit from array of 3D points

%% Paths for functions and weights
addpath("./utils");
addpath("./mlp");
weights_name = "./weights/weights.mat";
%% Classification
img = preprocess(points);
C = mlp_classify(img,weights_name);
C = C-1;
end

