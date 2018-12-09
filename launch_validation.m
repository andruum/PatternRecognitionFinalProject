addpath("./mlp")
weights_name = "./weights/weights.mat";

% launch validation and draw results
res_validate = mlp_validate(testset,weights_name,1)