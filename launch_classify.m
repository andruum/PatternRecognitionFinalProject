%% Sample parametes
addpath("./utils");
path_folder = "./training_data";
digit = 8;
samplen = 90;

%% Load sample
points = loadsample(path_folder,digit,samplen);

%% Launch test
C = digit_classify(points)