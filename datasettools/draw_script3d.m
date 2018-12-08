%% Draw data
% Space - next sample
% ESC - exit
close all;
addpath("./utils");

path_folder = "./training_data";
digit = 8;
samplenum = 79;

pos = loadsample(path_folder,digit,samplenum);
display_3d(pos')