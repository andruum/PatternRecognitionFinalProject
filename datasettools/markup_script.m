%% Draw data
% Space - next sample
% ESC - exit
close all;
addpath("./utils");

dataset_folder = "./training_data";

dataset = loaddataset(dataset_folder);
gooddataset = [];
for i=1:size(dataset,2)
sample = dataset(i);
points = sample.points;
sample.class
display_2d(points')
k = waitforbuttonpress;
value = double(get(gcf,'CurrentCharacter'))
if value == 27 %ESC 
    close;
    break;
elseif value == 32 %Space
    gooddataset = [gooddataset dataset(i)];
    close;
elseif value == 114 %R 
    close;
end
end

save('gooddataset.mat','gooddataset')