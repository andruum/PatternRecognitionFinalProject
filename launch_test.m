%% Sample parametes
addpath("./utils");
path_folder = "./training_data";
digit = 2;
samplen = 1;

%% Load sample
points = loadsample(path_folder,digit,samplen);

%% Launch test
C = digit_classify(pos)