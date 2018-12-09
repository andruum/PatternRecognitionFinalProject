clear all
dataset_folder = "./training_data";
trainsetcount = 1;
addpath("./utils")
addpath("./datasettools")
load("./datasettools/dataset.mat")

[trainset,testset] = loadgooddataset(gooddataset,trainsetcount);
%[trainset,testset] = loaddataset(dataset_folder,trainsetcount);