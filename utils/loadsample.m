function [points,filepath] = loadsample(folder,digit,sample)
%LOADSAMPLE Load data sample
%   [points,filepath] = loadsample(folder,digit,sample)
%   Load data sample from folder by digit and sample number.
%   folder
%   folder - path to folder
%   digit - the digit that needs to be loaded
%   sample - number of sample
%   points - loaded points
%   filepath - full file path (May be ignored)
samplenumstr = pad(int2str(sample),4,'left','0');
file = strcat("stroke_",int2str(digit),"_",samplenumstr,".mat");
filepath = fullfile(folder,file);
points = load(filepath);
points = points.pos;
end