function points = loaddata(folder,digit,sample)
samplenumstr = pad(int2str(sample),4,'left','0');
file = strcat("stroke_",int2str(digit),"_",samplenumstr,".mat");
filepath = fullfile(folder,file);
points = load(filepath);
points = points.pos;
end

