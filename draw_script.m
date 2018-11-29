close all;

path_folder = "./training_data";
digit = 1;
samplen = 3;

pos = loaddata(path_folder,digit,samplen);

display_3d(pos')