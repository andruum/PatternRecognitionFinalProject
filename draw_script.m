%% Draw data
% Space - next sample
% ESC - exit
close all;
addpath("./utils");

path_folder = "./training_data";
digit = 2;
samplenum = 1;
                                               
while 1
samplenum
pos = loadsample(path_folder,digit,samplenum);
display_3d(pos')
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