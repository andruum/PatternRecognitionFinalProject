function [points,filepath] = loadsample(folder,digit,sample)
%LOADSAMPLE Load data sample
%   Load data sample from folder by digit and sample number
samplenumstr = pad(int2str(sample),4,'left','0');
file = strcat("stroke_",int2str(digit),"_",samplenumstr,".mat");
filepath = fullfile(folder,file);
points = load(filepath);
points = points.pos;
end