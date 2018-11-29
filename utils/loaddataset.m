function [points,classes] = loaddataset(folderpath)
%LOADDATASET Summary of this function goes here
%   Detailed explanation goes here

points = [];
classes = [];
for d=0:9
   for s=1:100
        pnts = loadsample(folderpath,d,s);
        points = [points pnts];
        classes = [classes d];
   end
end

end

