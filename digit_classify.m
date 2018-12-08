function C = digit_classify(points)
%DIGIT_CLASSIFY Estimate digit from 3D points
%   
%% Prepare everything
addpath("./utils");
weights_name = "./weights/weights.mat";

%% Preprocessing step
img = preprocess(points);
%% Classification
C = mlp_classify(img,weights_name);
C = C-1;
end

