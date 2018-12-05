%% Draw data
% Space - next sample
% ESC - exit
close all;
addpath("./utils");

path_folder = "./training_data";
digit = 8;
samplenum = 94;

while 1
samplenum
pos = loadsample(path_folder,digit,samplenum);
pos = data_normalize(pos','minmax');
pos = removegaps(pos);
display_2d(pos)
k = waitforbuttonpress;
value = double(get(gcf,'CurrentCharacter'));
if value == 27 %ESC 
    close;
    break;
elseif value == 32 %Space
    samplenum = samplenum+1;
    close;
end
end